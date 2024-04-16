Class {
	#name : 'MTMutantOperatorAnalysis',
	#superclass : 'MTUtilityAnalysis',
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'adding' }
MTMutantOperatorAnalysis >> addAllAssociationsFrom: sourceDictionary to: destinationDictionary [

	sourceDictionary associationsDo: [ :assoc |
		| key value |
		key := assoc key.
		value := assoc value.
		destinationDictionary
			at: key
			ifPresent: [ :v |
			destinationDictionary at: key update: [ :val | val + value ] ]
			ifAbsentPut: [ destinationDictionary at: key put: value ] ].

	^ destinationDictionary
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorDictionary [
	"Returns the dictionary with mutant operators as keys, and for each operator the number of mutants it produce"

	| operatorDictionary operatorsWithoutMutants |
	operatorDictionary := self operatorDictionaryFromAnalysis.
	operatorsWithoutMutants := self operatorsWithoutMutantsFor:
		                           operatorDictionary.

	operatorDictionary := self
		                       addAllAssociationsFrom:
		                       operatorsWithoutMutants
		                       to: operatorDictionary asDictionary.

	^ operatorDictionary
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorDictionaryFromAnalysis [

	| analysis dic |
	analysis := MTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  }.

	analysis generateMutations.

	^ dic := (analysis mutations groupedBy: [ :e | e operator species ])
		         collect: [ :coll | coll size ]
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsProducingAtLeast: aNumber [

	^ self operatorsSelectedWith: [ :value | value >= aNumber ]
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsProducingAtMost: aNumber [

	^ self operatorsSelectedWith: [ :value | value <= aNumber ]
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsSelectedWith: aBlock [

	^ (self operatorDictionary select: aBlock) keys asSet
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsWithoutMutantsFor: aDictionary [

	| operatorsWithoutMutants |
	operatorsWithoutMutants := (MTAbstractMutantOperator contents collect:
		                            #species) reject: [ :ope |
		                           aDictionary keys includes: ope ].

	^ Dictionary new
		  addAll:
			  (operatorsWithoutMutants collect: [ :each | each -> 0 ])
				  asDictionary;
		  yourself
]
