Class {
	#name : 'RandomOperatorMutantSelectionStrategy',
	#superclass : 'RandomMutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'intialization' }
RandomOperatorMutantSelectionStrategy class >> fixed: aNumber [

	^ self new randomMutantSelection:
		  (FixedRandomMutantSelectionStrategy new numberOfMutants: aNumber)
]

{ #category : 'intialization' }
RandomOperatorMutantSelectionStrategy class >> percent: aPercentage [

	^ self new randomMutantSelection:
		  (PercentRandomMutantSelectionStrategy new percentageOfMutants: aPercentage)
]

{ #category : 'generating' }
RandomOperatorMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations shuffledMutations mutationDict operators operator random |
	mutations := mutationsGenerationStrategy
		             mutationsFor: aMutationTestingAnalysis
		             loggingIn: aLogger.

	mutationDict := mutations groupedBy: [ :e | e operator ].
	operators := mutationDict keys.
	shuffledMutations := OrderedCollection new.
	random := Random new.

	1 to: mutations size do: [ :i |
		operator := self
			            selectOperatorFrom: operators
			            and: mutationDict
			            using: random
			            for: shuffledMutations.

		shuffledMutations add: (self
				 selectMutantFrom: mutationDict
				 with: operator
				 using: random
				 for: shuffledMutations) ].

	^ shuffledMutations
]

{ #category : 'selection' }
RandomOperatorMutantSelectionStrategy >> selectMutantFrom: mutationDictionnary with: anOperator using: aRandom for: newCollection [

	| size index |
	size := (mutationDictionnary at: anOperator) size.
	index := aRandom nextIntegerBetween: 1 and: size.

	"If the selected mutant has already been added, another one is chosen"
	[ newCollection includes:
		((mutationDictionnary at: anOperator) at: index) ] whileTrue: [
		index := aRandom nextIntegerBetween: 1 and: size ].

	^ (mutationDictionnary at: anOperator) at: index
]

{ #category : 'selection' }
RandomOperatorMutantSelectionStrategy >> selectOperatorFrom: operators and: mutationDictionnary using: aRandom for: newCollection [

	| size index |
	size := operators size.
	index := aRandom nextIntegerBetween: 1 and: size.

	"if all the mutants generated with a given operator have already been selected, another operator is chosen"
	[
	(mutationDictionnary at: (operators at: index)) allSatisfy: [ :each |
		newCollection includes: each ] ] whileTrue: [
		index := aRandom nextIntegerBetween: 1 and: size ].

	^ operators at: index
]
