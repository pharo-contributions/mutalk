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
MTMutantOperatorAnalysis >> allOperators [

	| operatorsDictionary operatorsWithoutMutants |
	operatorsDictionary := self getMutantOperatorsDictionary.
	operatorsWithoutMutants := self findOperatorsWithoutMutantsFor:
		                           operatorsDictionary.

	operatorsDictionary := self
		                       addAllAssociationsFrom:
		                       operatorsWithoutMutants
		                       to: operatorsDictionary asDictionary.

	^ operatorsDictionary
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
MTMutantOperatorAnalysis >> getMutantOperatorsDictionary [

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
MTMutantOperatorAnalysis >> operatorsProducingOverXMutants: aNumber [

	^ self operatorsSelectedWith: [ :value | value >= aNumber ]
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsProducingUnderXMutants: aNumber [

	^ self operatorsSelectedWith: [ :value | value <= aNumber ]
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsSelectedWith: aBlock [

	^ self allOperators select: aBlock
]
