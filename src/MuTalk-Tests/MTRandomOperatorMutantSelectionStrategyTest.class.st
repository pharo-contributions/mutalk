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
	expected := SystemVersion current major >= 12
		            ifTrue: [ #( 30 28 37 1 31 26 29 28 ) ]
		            ifFalse: [ #( 33 34 31 1 26 27 26 32 ) ].
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate:
			            { MTAuxiliarClassForRandomOperatorMutantSelectionStrategy };
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll;
		            mutantSelectionStrategy:
			            (MTRandomOperatorMutantSelectionStrategy withSeed: seed).

	mutations := analysis generateMutations first: 210.
	mutationsDic := (mutations groupedBy: #operator) collect: #size.

	self assert: mutationsDic values equals: expected
]
