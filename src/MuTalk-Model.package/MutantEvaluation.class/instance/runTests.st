private
runTests
	"Collect all suite test and execute them."
	| suite |
	suite := TestSuite named: 'MutationEvaluation'.
	suite addTests: ((strategy	testCasesToEvaluate: mutation
									for: self) collect: [ :each | each testCase ]).
	^ [ suite runStoppingOnFirstFailOrError ] 
		on: Error
		do: [ :ex | nil ]