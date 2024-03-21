Class {
	#name : 'MTRandomOperatorMutantSelectionStrategyTest',
	#superclass : 'MTRandomMutantSelectionStrategyTest',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTRandomOperatorMutantSelectionStrategyTest >> classToTest [

	^ MTRandomOperatorMutantSelectionStrategy
]

{ #category : 'tests' }
MTRandomOperatorMutantSelectionStrategyTest >> testAroundOneSeventhPercentOfMutantsForEachOperator [

	| analysis mutations seed mutationsDic expected |
	expected := #( 30 28 37 1 31 26 29 28 ).
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate:
			            { MTAuxiliarClassForRandomOperatorMutantSelectionStrategy };
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll;
		            mutantSelectionStrategy:
			            (MTMockRandomOperatorMutantSelectionStrategy for: seed).
	mutations := analysis generateMutations truncateTo: 210.
	mutationsDic := (mutations groupedBy: #operator) collect: #size.
	self assert: mutationsDic values equals: expected
]
