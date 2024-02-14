Class {
	#name : 'MTAnalysisFileLoggerTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MTAnalysisFileLoggerTest >> testLogFileExists [

	| analysis logFileName logFile |
	logFileName := 'logFileForTest.txt'.
	logFile := logFileName asFileReference.
	analysis := MTAnalysis new
		            classesToMutate: { MTAuxiliarClassForMTAnalysis };
		            testClasses: { MTAuxiliarClassForMTAnalysisTest };
		            logger: (MTAnalysisFileLogger toFileNamed: logFileName).

	analysis run.

	self assert: logFile exists.
	logFile delete
]
