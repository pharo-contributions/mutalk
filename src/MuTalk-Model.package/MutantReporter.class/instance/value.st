evaluating
value
	| stream |
	stream := String
		streamContents: [ :str | 
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Mutant Generated: ';
				nextPutAll: mutantEvaluationResult printString;
				cr.
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Result --> ';
				nextPutAll: mutantEvaluationResult resultString;
				cr.
			mutantEvaluationResult printDetailedResultOn: str.
			str cr ].
	^ stream contents