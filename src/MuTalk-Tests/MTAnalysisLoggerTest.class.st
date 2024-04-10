Class {
	#name : 'MTAnalysisLoggerTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'testing' }
MTAnalysisLoggerTest >> testExecutingSimpleMutation [

	| analysis logger operator |
	logger := MTMockAnalysisLogger new.
	operator := MTReplacePlusWithMinusMutantOperator new.
	analysis := MTAnalysis new
		            testClasses:
			            (Array with: MTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MTAuxiliarClassForMTAnalysis);
		            operators: (Array with: operator);
		            logger: logger;
		            budget: MTFreeBudget new.
	analysis run.
	self assert: logger loggedStartAnalysis.
	self assert: (logger
			 loggedStartBuildingMutationsFor:
			 MTAuxiliarClassForMTAnalysis >> #methodWithOnePlusSender
			 using: operator).
	self assert: (logger loggedStartMutantEvaluationForMutationOf:
			 MTAuxiliarClassForMTAnalysis >> #methodWithOnePlusSender)
]
