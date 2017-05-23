testing
testExecutingTwoMutantsFromSameMethod
	"Obtain 2 mutants using --->+ replacement in only one method."
	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self minusForPlusReplacementMutation.
	analysis := MutationTestingAnalysis 
		testCasesFrom: Array new
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: operatorSelection.
	analysis run.
	results := analysis particularResults.
	self assert: results size = 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]