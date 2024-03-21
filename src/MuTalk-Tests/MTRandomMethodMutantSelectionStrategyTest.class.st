Class {
	#name : 'MTRandomMethodMutantSelectionStrategyTest',
	#superclass : 'MTRandomMutantSelectionStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTRandomMethodMutantSelectionStrategyTest >> classToTest [

	^ MTRandomMethodMutantSelectionStrategy
]

{ #category : 'tests' }
MTRandomMethodMutantSelectionStrategyTest >> testAround25PercentOfMutantsForEachMethod [

	| analysis mutations seed mutationsDic expected |
	expected := #( 24 23 29 24 ).
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate:
			            { MTAuxiliarClassForRandomMethodMutantSelectionStrategy };
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll;
		            mutantSelectionStrategy:
			            (MTMockRandomGroupedMutantSelectionStrategy
				             for: MTRandomMethodMutantSelectionStrategy new
				             andSeed: seed).
	mutations := analysis generateMutations truncateTo: 100.
	mutationsDic := (mutations groupedBy: #originalMethod) collect: #size.
	self assert: mutationsDic values equals: expected
]
