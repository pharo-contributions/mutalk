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

	| analysis mutations seed mutationsDic maximum |
	maximum := 100.
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

	mutations := analysis generateMutations truncateTo: maximum.
	mutationsDic := (mutations groupedBy: #originalMethod) collect: [
		                :mutationList | "Here we divide the number of mutants for each method by the total of mutants to obtain a percentage, and we check if it's close to the theoretical 1/4 with a precision of 0.1, because the small number of mutants can induce a quite large gap"
		                (mutationList size / maximum asFloat - 0.25) abs
		                <= 0.1 ].

	self assert:
		(mutationsDic values fold: [ :bool1 :bool2 | bool1 and: bool2 ])
]
