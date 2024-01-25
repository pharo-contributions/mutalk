Class {
	#name : 'MTMutantOperatorAnalysis',
	#superclass : 'Object',
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
MTMutantOperatorAnalysis >> allOperatorsFor: aCollectionOfPackages [

	| allOperatorsDictionary |
	allOperatorsDictionary := Dictionary new.

	aCollectionOfPackages do: [ :name |
		| operatorsDictionary operatorsWithoutMutants |
		operatorsDictionary := self getMutantOperatorsDictionaryFor: name.
		operatorsWithoutMutants := self findOperatorsWithoutMutantsFor:
			                           operatorsDictionary.

		operatorsDictionary := self
			                       addAllAssociationsFrom:
			                       operatorsWithoutMutants
			                       to: operatorsDictionary asDictionary.

		self
			addAllAssociationsFrom: operatorsDictionary
			to: allOperatorsDictionary ].

	^ allOperatorsDictionary
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> findOperatorsWithoutMutantsFor: aDictionary [

	| operatorsWithoutMutants |
	operatorsWithoutMutants := (MTMutantOperator contentsAll collect:
		                            #species) reject: [ :ope |
		                           aDictionary keys includes: ope ].

	^ Dictionary new
		  addAll: (operatorsWithoutMutants collect: [ :each | each -> 0 ]) asDictionary;
		  yourself
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> getMutantOperatorsDictionaryFor: aName [

	| analysis dic classesToMutate |
	classesToMutate := aName asPackage definedClasses.

	analysis := MTAnalysis new
		            classesToMutate: classesToMutate;
		            testClasses: {  };
		            operators: MTMutantOperator contentsAll.

	analysis generateMutations.

	^ dic := (analysis mutations groupedBy: [ :e | e operator species ])
		         collect: [ :coll | coll size ]
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsProducingOver: aNumber mutantsFor: aCollectionOfPackages [

	^ self
		  operatorsSelectedWith: [ :value | value >= aNumber ]
		  for: aCollectionOfPackages
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsProducingUnder: aNumber mutantsFor: aCollectionOfPackages [

	^ self
		  operatorsSelectedWith: [ :value | value <= aNumber ]
		  for: aCollectionOfPackages
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> operatorsSelectedWith: aBlock for: aCollectionOfPackages [

	^ (self allOperatorsFor: aCollectionOfPackages) select: aBlock
]
