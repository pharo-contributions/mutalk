testing
testExecutingTwoMutantsFromDiferentMethods
	"Obtain 2 mutants using ifFalse-->ifTrue replacement in two diferent methods."
	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self ifFalseForIfTrueReplacementMutation.
	analysis := MutationTestingAnalysis 
		testCasesFrom: Array new
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: operatorSelection.
	analysis run.
	results := analysis particularResults.
	self assert: results size = 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]