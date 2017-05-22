evaluating
value
	|file|
	file := (FileDirectory default fileExists: logName)
		ifTrue: [
			(FileDirectory default oldFileNamed: logName).
		] ifFalse: [
			(FileDirectory default newFileNamed: logName).
		].
	file setToEnd; nextPutAll: self resumedInfo; close.
	"(FileDirectory default forceNewFileNamed: 'detailed_', mutationGeneralResult numberOfEvaluatedMutants printString) 
		nextPutAll: self detailedInfo; close."
	
	