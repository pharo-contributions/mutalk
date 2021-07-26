Class {
	#name : #MutalkCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'result'
	],
	#category : #'MuTalk-Model'
}

{ #category : #accessing }
MutalkCommandLineHandler class >> commandName [ 
	^ 'mutalk'

]

{ #category : #accessing }
MutalkCommandLineHandler class >> description [

	^ 'Runs mutation testing'
]

{ #category : #activation }
MutalkCommandLineHandler >> activate [

	| noquit saveit |
	self activateHelp ifTrue: [ ^ self ].
	(self hasOption: 'project') ifTrue: [ self icebergProject ].
	noquit := self commandLine hasOption: 'noquit'.
	saveit := self commandLine hasOption: 'save'.
	Smalltalk snapshot: saveit andQuit: noquit not.
]

{ #category : #private }
MutalkCommandLineHandler >> alivesFrom: analysis [

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

{ #category : #private }
MutalkCommandLineHandler >> allClassesForRepo: repoName [ 
	Smalltalk
		at: #IceRepository
		ifPresent: [ :clsIceRepository | 
			clsIceRepository registry
				detect: [ :r | r name = repoName ]
				ifFound: [ :r | 
					^ (r workingCopy packages select: [ :p | p isLoaded ])
						flatCollect: [ :p | p package asPackage definedClasses asOrderedCollection ] ] ].
	Smalltalk
		at: #MetacelloProjectRegistration
		ifPresent: [ :clsMetacelloProjectRegistration | 
			| reg |
			reg := clsMetacelloProjectRegistration
				registrationForClassNamed: repoName
				ifAbsent: [ nil ].
			reg
				ifNotNil: [ ^ reg currentlyLoadedClassesInProject asOrderedCollection ] ].
	self error: 'repo not installed. ' , repoName
]

{ #category : #private }
MutalkCommandLineHandler >> deepMutationTestingTargets: targets tests: tests [

	| analysis |
	analysis := MutationTestingAnalysis
		            testCasesFrom: tests
		            mutating: targets
		            using: MutantOperator contents
		            with: SelectingFromCoverageMutantEvaluationStrategy new
		            with:
		            SelectingFromCoverageMutationsGenerationStrategy new.
	analysis run.
	result
		at: 'uncoveredMethods'
		ifAbsentPut: (self uncoveredMethodsFrom: analysis).
	result
		at: 'aliveMutants'
		ifAbsentPut: (self alivesFrom: analysis)
]

{ #category : #private }
MutalkCommandLineHandler >> exportFileName [
	^ '__mutalk_export.json'
]

{ #category : #private }
MutalkCommandLineHandler >> exportResult [

	| json file |
	json := STONJSON toStringPretty: result.
	file := FileLocator imageDirectory / self exportFileName.
	file exists ifTrue: [ file delete ].
	file writeStream writeStream nextPutAll: json; close
]

{ #category : #private }
MutalkCommandLineHandler >> extremeTransformationTargets: targets tests: tests [

	| analysis |
	analysis := MutationTestingAnalysis
		            testCasesFrom: tests
		            mutating: targets
		            using: MutantOperator extremeTransformation
		            with: AllTestsMethodsRunningMutantEvaluationStrategy new.
	analysis run.
	result
		at: 'uncoveredMethods'
		ifAbsentPut: (self uncoveredMethodsFrom: analysis).
	result
		at: 'aliveExtremeTransformations'
		ifAbsentPut: (self alivesFrom: analysis)
]

{ #category : #private }
MutalkCommandLineHandler >> icebergProject [

	| cmd |
	cmd := '--project='.
	self arguments
		detect: [ :arg | arg beginsWith: cmd ]
		ifFound: [ :arg | self icebergProject: (arg allButFirst: cmd size) ]
		
]

{ #category : #private }
MutalkCommandLineHandler >> icebergProject: repoName [

	| classes tests targets |
	classes := self allClassesForRepo: repoName.
	result := Dictionary new.
	tests := classes select: #isTestCase.
	targets := classes reject: #isTestCase.
	self flag: #TODO. "accept parameters for strategies and ..."

	self extremeTransformationTargets: targets tests: tests.
	self deepMutationTestingTargets: targets tests: tests.
	self flag: #TODO. "accept output filename (or STD)"
	self exportResult
]

{ #category : #private }
MutalkCommandLineHandler >> uncoveredMethodsFrom: analysis [

	^ analysis coverageAnalysisResult uncoveredMethods collect: [ 
		  :compiledMethod | 
		  { 
			  ('class' -> compiledMethod methodClass).
			  ('method' -> compiledMethod selector) } asDictionary  ]
]
