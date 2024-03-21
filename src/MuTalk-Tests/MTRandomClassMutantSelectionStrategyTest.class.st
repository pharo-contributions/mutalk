Class {
	#name : 'MTRandomClassMutantSelectionStrategyTest',
	#superclass : 'MTRandomMutantSelectionStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTRandomClassMutantSelectionStrategyTest >> classToTest [

	^ MTRandomClassMutantSelectionStrategy
]

{ #category : 'tests' }
MTRandomClassMutantSelectionStrategyTest >> testAround33PercentOfMutantsForEachClass [

	| seed analysis mutations mutationsDic maximum |
	maximum := 100.
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate: {
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy1.
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy2.
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy3 };
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll;
		            mutantSelectionStrategy:
			            (MTMockRandomGroupedMutantSelectionStrategy
				             for: MTRandomClassMutantSelectionStrategy new
				             andSeed: seed).

	mutations := analysis generateMutations truncateTo: maximum.
	mutationsDic := (mutations groupedBy: #originalClass) collect: [
		                :mutationList | "Here we divide the number of mutants for each class by the total of mutants to obtain a percentage, and we check if it's close to the theoretical 1/3 with a precision of 0.1, because the small number of mutants can induce a quite large gap"
		                mutationList size / maximum asFloat
			                closeTo: 1 / 3 asFloat
			                precision: 0.1 ].

	self assert:
		(mutationsDic values fold: [ :bool1 :bool2 | bool1 and: bool2 ])
]
