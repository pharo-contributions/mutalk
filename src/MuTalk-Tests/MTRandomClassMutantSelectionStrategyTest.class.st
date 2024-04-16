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

	| expected seed analysis mutations mutationsDic sysVersion |
	sysVersion := SystemVersion current major.
	sysVersion >= 12 ifTrue: [ expected := #( 30 39 31 ) ].
	sysVersion = 11 ifTrue: [ expected := #( 33 32 35 ) ].
	sysVersion <= 10 ifTrue: [ expected := #( 36 33 31 ) ].
	seed := 864127593.
	analysis := MTAnalysis new
		            classesToMutate: {
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy1.
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy2.
				            MTAuxiliarClassForRandomClassMutantSelectionStrategy3 };
		            testClasses: { MTAuxiliarClassForMTAnalysisTest }.
	analysis mutantGenerationStrategy mutantSelectionStrategy:
		(MTRandomClassMutantSelectionStrategy withSeed: seed).

	mutations := analysis generateMutations first: 100.
	mutationsDic := (mutations groupedBy: #originalClass) collect: #size.

	self assert: mutationsDic values equals: expected
]
