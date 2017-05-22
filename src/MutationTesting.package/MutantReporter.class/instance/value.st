evaluating
value
	|stream|
	stream := String streamContents: [:str|
		str nextPutAll: '----------------'; cr.
		str nextPutAll: 'Mutant Generated: ', mutantEvaluationResult printString; cr.
		str nextPutAll: '----------------'; cr.
		str nextPutAll: 'Result --> ',mutantEvaluationResult resultString; cr.	
		mutantEvaluationResult printDetailedResultOn: str.
		str cr].
	^stream contents
	
	