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

	| analysis mutations seed mutationsDic |
	seed := 854125793.
	analysis := MTAnalysis new
		            classesToMutate:
			            { MTAuxiliarClassForRandomMethodMutantSelectionStrategy };
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll;
		            mutantSelectionStrategy:
			            (MTMockRandomMethodMutantSelectionStrategy for: seed).
	mutations := analysis generateMutations truncateTo: 100.
	mutationsDic := (mutations groupedBy: #originalMethod) collect:#size.
	self assert: (mutationsDic values at:1) equals: 25
]
