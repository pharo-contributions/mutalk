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
	expected := SystemVersion current major >= 12
		            ifTrue: [ #( 30 39 31 ) ]
		            ifFalse: [ #( 33 32 35 ) ].
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

	mutations := analysis generateMutations first: 100.
	mutationsDic := (mutations groupedBy: #originalClass) collect: #size.

	self assert: mutationsDic values equals: expected
]
