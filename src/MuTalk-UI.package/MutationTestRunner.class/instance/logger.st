private
logger
	^ loggingActivated 
		ifTrue: 
			[ MutationTestingAnalysisFileLogger toFileNamed: 'MutationTestingLog.txt' ]
		ifFalse: [ NullMutationTestingAnalysisLogger new ]