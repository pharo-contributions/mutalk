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

	| analysis mutations seed mutationsDic maximum |
	maximum := 210.
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate:
			            { MTAuxiliarClassForRandomOperatorMutantSelectionStrategy };
		            testClasses: {  };
		            operators:
			            (MTAbstractMutantOperator contentsAll reject: [ :op |
					             op species = MTEmptyMethodOperator ]);
		            mutantSelectionStrategy:
			            (MTMockRandomGroupedMutantSelectionStrategy
				             for: MTRandomOperatorMutantSelectionStrategy new
				             andSeed: seed).

	mutations := analysis generateMutations truncateTo: 210.
	mutationsDic := (mutations groupedBy: #operator) collect: [
		                :mutationList | "Here we divide the number of mutants for each operator by the total of mutants to obtain a percentage, and we check if it's close to the theoretical 1/7 with a precision of 0.1, because the small number of mutants can induce a quite large gap"
		                mutationList size / maximum asFloat
			                closeTo: 1 / 7 asFloat
			                precision: 0.1 ].

	self assert:
		(mutationsDic values fold: [ :bool1 :bool2 | bool1 and: bool2 ])
]
