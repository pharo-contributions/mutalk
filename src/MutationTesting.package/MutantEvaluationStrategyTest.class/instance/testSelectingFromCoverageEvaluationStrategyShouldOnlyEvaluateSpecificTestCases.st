testing
testSelectingFromCoverageEvaluationStrategyShouldOnlyEvaluateSpecificTestCases
	"tests that the message #testCasesToEvaluateFrom: returns only the test cases that cover the mutated code"
	| classes mutationTestingAnalysis testCases mutation operator evaluationStrategy |
	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := SelectingFromCoverageMutantEvaluationStrategy new.
	mutationTestingAnalysis := MutationTestingAnalysis 
		for: AuxiliarTestClassForTestingStrategies suite tests
		mutating: classes
		using: (Set with: operator)
		with: evaluationStrategy
		with: AllMutationsGenerationStrategy new.
	mutationTestingAnalysis generateCoverageAnalysis.
	mutation := (operator mutationsFor: AuxiliarClassForTestingStrategies >> #method1) asOrderedCollection first.
	testCases := evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1).
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)