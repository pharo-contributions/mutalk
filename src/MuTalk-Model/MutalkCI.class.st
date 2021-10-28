Class {
	#name : #MutalkCI,
	#superclass : #Object,
	#instVars : [
		'project',
		'commit',
		'result'
	],
	#category : #'MuTalk-Model'
}

{ #category : #private }
MutalkCI >> alivesFrom: analysis [

	^ analysis generalResult aliveMutants collect: [ :alive | 
		  { 
			  ('class' -> alive mutant originalClass).
			  ('method' -> alive mutant originalMethod selector).
			  ('from' -> alive mutant nodeToMutate start).
			  ('to' -> alive mutant nodeToMutate stop).
			  ('originalSourceCode' -> alive mutant originalMethod sourceCode).
			  ('mutatedNode' -> alive mutant mutatedNode formattedCode) }
			  asDictionary ]
]

{ #category : #'as yet unclassified' }
MutalkCI >> allChangesForRepo [
	| repo cmt diff leafs targets |
	repo := self getRepo.
	cmt := repo commitishNamed: commit.
	diff := cmt diffFromHead.
	leafs := OrderedCollection new.
	diff tree allChildrenDo: [ :node | 
		node children ifEmpty: [ leafs add: node ] ].
	leafs := leafs reject: [ :n | n value isRemoval ].
	leafs := leafs select: [ :n | n value definition isMethodDefinition ].
	leafs := leafs reject: [ :n | 
		         n value definition contextClass isNil or: [ 
			         n value definition contextClass isTestCase or: [ 
				         (n value definition contextClass includesSelector:
					          n value definition name) not ] ] ].
	targets := leafs collect: [ :n | 
		           n value definition contextClass
		           >> n value definition name ].
	^ targets
]

{ #category : #private }
MutalkCI >> allClassesForRepo [

	|repo|
	repo := self getRepo.
	^ (repo workingCopy packages select: [ :p | p isLoaded ]) 
					  flatCollect: [ :p | 
					  repo package asPackage definedClasses asOrderedCollection]
	

]

{ #category : #accessing }
MutalkCI >> commit [

	^ commit
]

{ #category : #accessing }
MutalkCI >> commit: anObject [

	commit := anObject
]

{ #category : #private }
MutalkCI >> deepMutationTestingTargets: targets tests: tests generationStrategy: generationStrategy [

	| analysis |
	analysis := MutationTestingAnalysis
		            testCasesFrom: tests
		            mutating: targets
		            using: MutantOperator contents
		            with: SelectingFromCoverageMutantEvaluationStrategy new
		            with: generationStrategy.
	analysis run.
	result
		at: 'uncoveredMethods'
		ifAbsentPut: (self uncoveredMethodsFrom: analysis).
	result at: 'aliveMutants' ifAbsentPut: (self alivesFrom: analysis).
	^ analysis
]

{ #category : #private }
MutalkCI >> exportFileName [
	^ '__mutalk_export.json'
]

{ #category : #private }
MutalkCI >> exportResultJson [

	| json file |
	json := STONJSON toStringPretty: result.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream writeStream
		nextPutAll: json;
		close
]

{ #category : #private }
MutalkCI >> exportResultMarkdown [

	| mdString |
	mdString := String new writeStreamDo: [ :str | 
		            self markdownTitle: str ]
]

{ #category : #private }
MutalkCI >> extremeTransformationTargets: targets tests: tests generationStrategy: generationStrategy [

	| analysis |
	analysis := MutationTestingAnalysis
		            testCasesFrom: tests
		            mutating: targets
		            using: MutantOperator extremeTransformation
		            with: AllTestsMethodsRunningMutantEvaluationStrategy new
		            with: generationStrategy.
	analysis run.
	result
		at: 'uncoveredMethods'
		ifAbsentPut: (self uncoveredMethodsFrom: analysis).
	result
		at: 'aliveExtremeTransformations'
		ifAbsentPut: (self alivesFrom: analysis).
	^ analysis 
]

{ #category : #'as yet unclassified' }
MutalkCI >> getRepo [

	Smalltalk at: #IceRepository ifPresent: [ :clsIceRepository | 
		clsIceRepository registry
			detect: [ :r | r name = project ]
			ifFound: [ :r | ^ r ]
			ifNone: [  ] ].
	
	self error: 'repo not installed. ' , project
]

{ #category : #private }
MutalkCI >> markdownAliveMutants: str [

	str << '## Alive mutants'.
	(result at: #aliveMutants) do: [ :item | 
		str
			<< '* ';
			<< (item at: #class);
			<< ' << #';
			<< (item at: #method);
			<< String lf ]
]

{ #category : #private }
MutalkCI >> markdownTitle: str [
	str
			            << '#Mutalk output';
			            << String lf;
			            << 'Project: ';
			            << project;
			            << String lf;
			            << 'From: ';
			            << commit;
			            << String lf;
			            << 'To: ';
			            << self getRepo head commit id
]

{ #category : #private }
MutalkCI >> markdownUncovered: str [

	str << '## Uncovered methods'.
	(result at: #uncoveredMethods) do: [ :item | 
		str
			<< '* ';
			<< (item at: #class);
			<< ' << #';
			<< (item at: #method);
			<< String lf ]
]

{ #category : #private }
MutalkCI >> markdownUndetectedXtremes: str [

	str << '## Undetected extreme transformations'.
	(result at: #aliveExtremeTransformations) do: [ :item | 
		str
			<< '* ';
			<< (item at: #class);
			<< ' << #';
			<< (item at: #method);
			<< String lf ]
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateAll [

	| classes tests targets xtremeAnalysis |
	classes := self allClassesForRepo.
	self prepareResult.
	tests := classes select: #isTestCase.
	targets := classes reject: #isTestCase.

	xtremeAnalysis := self
		                  extremeTransformationTargets: targets
		                  tests: tests
		                  generationStrategy:
		                  SelectingFromCoverageMutationsGenerationStrategy
			                  new.
	self
		deepMutationTestingTargets: targets
		tests: tests
		generationStrategy:
			(SelectingFromAlivesMutationsGenerationStrategy new analysis:
				 xtremeAnalysis).
	self exportResultJson
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateDiff [

	| targets targetMethods tests classes xtremeAnalysis |
	classes := self allClassesForRepo.
	targetMethods := self allChangesForRepo.
	self prepareResult.

	tests := classes select: #isTestCase.
	targets := (targetMethods collect: #methodClass) asSet.
	targets ifEmpty: [ ^ self exportResultJson ].
	xtremeAnalysis := self
		                  extremeTransformationTargets: targets
		                  tests: tests
		                  generationStrategy:
		                  (ManualMutationsGenerationStrategy new 
			                   targetMethods: targetMethods).
	self
		deepMutationTestingTargets: targets
		tests: tests
		generationStrategy:
			(SelectingFromAlivesMutationsGenerationStrategy new analysis:
				 xtremeAnalysis).
	self exportResultJson
]

{ #category : #'as yet unclassified' }
MutalkCI >> prepareResult [

	result := Dictionary new.
	result
		at: 'commitFrom'
		put: commit .
	result at: 'commitTo' put: self getRepo head commit id.
	result at: 'timestamp' put: DateAndTime now asUnixTime
]

{ #category : #accessing }
MutalkCI >> project [

	^ project
]

{ #category : #accessing }
MutalkCI >> project: anObject [

	project := anObject
]

{ #category : #'as yet unclassified' }
MutalkCI >> recentCommit [

	commit := self getRepo head commit ancestors
		          ifNotEmpty: #first
		          ifEmpty: [ IceNoCommit new ]
]

{ #category : #private }
MutalkCI >> uncoveredMethodsFrom: analysis [

	^ analysis coverageAnalysisResult uncoveredMethods collect: [ 
		  :compiledMethod | 
		  { 
			  ('class' -> compiledMethod methodClass).
			  ('method' -> compiledMethod selector) } asDictionary  ]
]
