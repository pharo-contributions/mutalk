Class {
	#name : 'MTFileLoggerTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MTFileLoggerTest >> testLogFileExists [

	| analysis logFileName logFile |
	logFileName := 'logFileForTest.txt'.
	logFile := logFileName asFileReference.
	analysis := MTAnalysis new
		            classesToMutate: { MTAuxiliarClassForMTAnalysis };
		            testClasses: { MTAuxiliarClassForMTAnalysisTest };
		            logger: (MTFileLogger toFileNamed: logFileName);
		            budget: MTFreeBudget new.

	analysis run.

	self assert: logFile exists.
	logFile delete
]
