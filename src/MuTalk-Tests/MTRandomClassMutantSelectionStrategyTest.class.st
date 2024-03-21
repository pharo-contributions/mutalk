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

	| expected seed analysis mutations mutationsDic |
	expected := #( 30 39 31 ).
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate: {
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy1.
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy2.
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy3 };
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll;
		            mutantSelectionStrategy:
			            (MTMockRandomClassMutantSelectionStrategy for: seed).
	mutations := analysis generateMutations truncateTo: 100.
	mutationsDic := (mutations groupedBy: #originalClass) collect: #size.
	self assert: mutationsDic values equals: expected
]
