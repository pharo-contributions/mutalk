running
tryToKill
	| mutantEvaluation strategy list|
	list := self testsSelectionStrategies collect: [:anStrategy | anStrategy description].
	strategy := UIManager default chooseFrom: list  message: 'Try to kill using:'.
	(strategy isNil
			or: [strategy = 0])
		ifTrue: [^nil].
	^[mutantEvaluationResult mutantEvaluation testCases do: [ :aTestCase | aTestCase run ].
	strategy := self testsSelectionStrategies at: strategy.
	mutantEvaluation := MutantEvaluation 
								for: mutantEvaluationResult mutant 
								using: mutantEvaluationResult mutantEvaluation testCases 
								following:  mutantEvaluationResult mutantEvaluation strategy
								and: strategy.
	mutantEvaluationResult := mutantEvaluation value.
	self update.
	true]
		on: TestsWithErrorsException
		do: [ :anException |
			OBInformRequest message: 'Your tests have Errors or Failures. Please correct them.'.
			anException return: false].