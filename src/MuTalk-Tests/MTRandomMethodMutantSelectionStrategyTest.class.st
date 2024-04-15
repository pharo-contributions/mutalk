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

	| analysis mutations seed mutationsDic expected sysVersion |
	sysVersion := SystemVersion current major.
	sysVersion >= 12 ifTrue: [ expected := #( 24 23 29 24 ) ].
	sysVersion = 11 ifTrue: [ expected := #( 19 29 26 26 ) ].
	sysVersion = 10 ifTrue: [ expected := #( 21 27 26 26 ) ].
	sysVersion <= 9 ifTrue: [ expected := #( 26 26 26 22 ) ].
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate:
			            { MTAuxiliarClassForRandomMethodMutantSelectionStrategy };
		            testClasses: {  }.
	analysis mutantGenerationStrategy mutantSelectionStrategy:
		(MTRandomMethodMutantSelectionStrategy withSeed: seed).

	mutations := analysis generateMutations first: 100.
	mutationsDic := (mutations groupedBy: #originalMethod) collect: #size.

	self assert: mutationsDic values equals: expected
]
