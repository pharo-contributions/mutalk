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
	^ self allChangesForRepo: project fromCommitNamed: commit 
]

{ #category : #'as yet unclassified' }
MutalkCI >> allChangesForRepo: project fromCommitNamed: commitName [
	| repo commit diff leafs targets |
	repo := IceRepository registry detect: [ :x | x name = project ].
	commit := repo commitishNamed: commitName.
	diff := commit diffFromHead.
	leafs := OrderedCollection new.
	diff tree
		allChildrenDo: [ :node | node children ifEmpty: [ leafs add: node ] ].
	leafs := leafs reject: [ :n | n value isRemoval ].
	leafs := leafs select: [ :n | n value definition isMethodDefinition ].
	leafs := leafs
		reject: [ :n | 
			n value definition contextClass isNil
				or: [ n value definition contextClass isTestCase
						or: [ (n value definition contextClass
								includesSelector: n value definition name) not ] ] ].
	targets := leafs
		collect: [ :n | n value definition contextClass >> n value definition name ].
	^ targets
]

{ #category : #private }
MutalkCI >> allClassesForRepo [

	Smalltalk at: #IceRepository ifPresent: [ :clsIceRepository | 
		clsIceRepository registry
			detect: [ :r | r name = project ]
			ifFound: [ :r | 
				^ (r workingCopy packages select: [ :p | p isLoaded ]) 
					  flatCollect: [ :p | 
					  p package asPackage definedClasses asOrderedCollection ] ] ].
	Smalltalk
		at: #MetacelloProjectRegistration
		ifPresent: [ :clsMetacelloProjectRegistration | 
			| reg |
			reg := clsMetacelloProjectRegistration
				       registrationForClassNamed: project
				       ifAbsent: [ nil ].
			reg ifNotNil: [ 
				^ reg currentlyLoadedClassesInProject asOrderedCollection ] ].
	self error: 'repo not installed. ' , project
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
MutalkCI >> exportResult [

	| json file |
	json := STONJSON toStringPretty: result.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream writeStream nextPutAll: json; close
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
MutalkCI >> mutateAll [

	| classes tests targets xtremeAnalysis |
	classes := self allClassesForRepo.
	result := Dictionary new.
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
		(SelectingFromAlivesMutationsGenerationStrategy new
		analysis: xtremeAnalysis).
	self exportResult
]

{ #category : #'as yet unclassified' }
MutalkCI >> mutateDiff [

	| targets targetMethods tests classes xtremeAnalysis |
	classes := self allClassesForRepo.
	targetMethods := self allChangesForRepo.
	result := Dictionary new.
	tests := classes select: #isTestCase.
	targets := (targetMethods collect: #methodClass) asSet.

	xtremeAnalysis := self
		                  extremeTransformationTargets: targets
		                  tests: tests
		                  generationStrategy:
		                  (ManualMutationsGenerationStrategy new targetMethods: targetMethods ).
	self
		deepMutationTestingTargets: targets
		tests: tests
		generationStrategy:
			(SelectingFromAlivesMutationsGenerationStrategy new analysis:
				 xtremeAnalysis).
	self exportResult
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

	| repo |
	repo := IceRepository registry detect: [ :x | x name = project ].

	commit := repo head commit ancestors
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
