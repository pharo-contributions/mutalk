instance creation
for: aMutant results: aTestResult producedBy: aMutantEvaluation 
	| handler |
	handler := self subclasses 
		detect: 
			[ :class | 
			class 
				canHandle: aMutant
				withResults: aTestResult ]
		ifNone: [ self error: 'There are missing classes' ].
	^ handler 
		newFor: aMutant
		results: aTestResult
		producedBy: aMutantEvaluation