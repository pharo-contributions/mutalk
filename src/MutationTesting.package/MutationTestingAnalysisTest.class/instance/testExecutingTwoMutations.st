testing
testExecutingTwoMutations
	"Execute 2 diferent mutations #ifTrue-->#ifFalse: and
	#+-->#-"
	| analysis results generalResult operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self plusForMinusReplacementMutation.
	operatorSelection addAll: self ifTrueForIfFalseReplacementMutation.
	analysis := MutationTestingAnalysis 
		testCasesFrom: (Array with: AuxiliarClassForMutationTestingAnalysisTest)
		mutating: (Array with: AuxiliarClassForMutationTestingAnalysis)
		using: operatorSelection.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis particularResults.
	self assert: results size = 2.
	results do: [ :mutationResult | self assert: mutationResult killed ].
	self assert: generalResult numberOfKilledMutants = 2