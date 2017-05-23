logging
logStartEvaluating: aMethodMutation 
	|logStream|
	logStream := WriteStream on: String new.
	logStream nextPutAll: 'Evaluating mutant of method ', (self methodNameOf: aMethodMutation originalMethod) , '  With source:'.
	logStream cr.
	logStream nextPutAll: aMethodMutation modifiedSource.
	self writeLineToFile: logStream contents