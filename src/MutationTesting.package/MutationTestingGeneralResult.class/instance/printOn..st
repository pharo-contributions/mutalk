printing
printOn: aStream 
	aStream
		nextPutAll: self numberOfEvaluatedMutants printString;
		nextPutAll: ' mutants, ';
		nextPutAll: self numberOfKilledMutants printString;
		nextPutAll: ' killed, ';
		nextPutAll: self numberOfAliveMutants printString;
		nextPutAll: ' alive, ';
		nextPutAll: self numberOfTerminatedMutants printString;
		nextPutAll: ' terminated. Mutation Score: ';
		nextPutAll: self mutationScore printString;
		nextPutAll: '%.'