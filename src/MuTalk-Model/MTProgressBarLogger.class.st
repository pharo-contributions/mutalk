Class {
	#name : 'MTProgressBarLogger',
	#superclass : 'MTAnalysisLogger',
	#category : 'MuTalk-Model-Logging',
	#package : 'MuTalk-Model',
	#tag : 'Logging'
}

{ #category : 'logging' }
MTProgressBarLogger >> logAnalysisStartFor: aMutationTestingAnalysis [

	[ :job | job title: 'Starting analysis' ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logEnd [

	[ :job | job title: 'Analysis finished' ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logNumberOfGeneratedMutations: aNumber [

	[ :job |
	aNumber < 2
		ifTrue: [ job title: aNumber asString , ' mutation generated' ]
		ifFalse: [ job title: aNumber asString , ' mutations generated' ] ]
		asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logRunningTest: aTestCaseReference [

	[ :job |
	job title: 'Running test: ' , aTestCaseReference testCase printString ]
		asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [

	[ :job |
	job title:
		'Generating mutations for ' , (self methodNameOf: aCompiledMethod)
		, ' with operator: ' , aMutantOperator description ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartCoverageAnalysis [

	[ :job | job title: 'Starting coverage analysis' ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartEvaluating: aMethodMutation [

	[ :job |
	job title: 'Evaluating mutant of method '
		, (self methodNameOf: aMethodMutation originalMethod) ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartMutationEvaluation [

	[ :job | job title: 'Starting mutation evaluation' ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logStartMutationGeneration [

	[ :job | job title: 'Starting mutation generation' ] asJob run
]

{ #category : 'logging' }
MTProgressBarLogger >> logTotalNumberOfMutations: mutations [

	[ :job |
	job title: mutations size asString , ' total mutations generated' ]
		asJob run
]
