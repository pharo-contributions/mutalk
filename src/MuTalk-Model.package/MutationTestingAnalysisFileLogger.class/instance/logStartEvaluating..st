logging
logStartEvaluating: aMethodMutation
	| logStream |
	logStream := WriteStream on: String new.
	logStream
		nextPutAll: 'Evaluating mutant of method ';
		nextPutAll: (self methodNameOf: aMethodMutation originalMethod);
		nextPutAll: '  With source:'.
	logStream cr.
	logStream nextPutAll: aMethodMutation modifiedSource.
	self writeLineToFile: logStream contents