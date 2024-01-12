Class {
	#name : 'MTAnalysisLoggerTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTAnalysisLoggerTest >> testExecutingSimpleMutation [

	| analysis logger operator |
	logger := MockMutationTestingAnalysisLogger new.
	operator := ReplacePlusWithMinusMutantOperator new.
	analysis := MutationTestingAnalysis new
		            testClasses:
			            (Array with:
					             AuxiliarClassForMutationTestingAnalysisTest);
		            classesToMutate:
			            (Array with: AuxiliarClassForMutationTestingAnalysis);
		            operators: (Array with: operator);
		            logger: logger.
	analysis run.
	self assert: logger loggedStartAnalysis.
	self assert: (logger
			 loggedStartBuildingMutationsFor:
			 AuxiliarClassForMutationTestingAnalysis
			 >> #methodWithOnePlusSender
			 using: operator).
	self assert: (logger loggedStartMutantEvaluationForMutationOf:
			 AuxiliarClassForMutationTestingAnalysis
			 >> #methodWithOnePlusSender)
]
