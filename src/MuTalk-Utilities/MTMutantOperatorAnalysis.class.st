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
MTMutantOperatorAnalysis >> findOperatorsWithoutMutantsFor: aDictionary [

	| operatorsWithoutMutants |
	operatorsWithoutMutants := (MTMutantOperator contentsAll collect:
		                            #species) reject: [ :ope |
		                           aDictionary keys includes: ope ].

	^ Dictionary new
		  addAll:
			  (operatorsWithoutMutants collect: [ :each | each -> 0 ])
				  asDictionary;
		  yourself
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> mutantOperatorsDictionaryFromAnalysis [

	| analysis dic |
	analysis := MTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  };
		            operators: MTMutantOperator contentsAll.

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

	^ (self wholeOperatorsDictionary select: aBlock) keys asSet
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> wholeOperatorsDictionary [

	| operatorsDictionary operatorsWithoutMutants |
	operatorsDictionary := self mutantOperatorsDictionaryFromAnalysis.
	operatorsWithoutMutants := self findOperatorsWithoutMutantsFor:
		                           operatorsDictionary.

	operatorsDictionary := self
		                       addAllAssociationsFrom:
		                       operatorsWithoutMutants
		                       to: operatorsDictionary asDictionary.

	^ operatorsDictionary
]
