Class {
	#name : 'MTMutantOperatorAnalysis',
	#superclass : 'Object',
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'computing' }
MTMutantOperatorAnalysis >> allOperatorsFor: aCollectionOfPackages [

	| allOperatorsDictionary |
	allOperatorsDictionary := Dictionary new.

	aCollectionOfPackages do: [ :name |
		| operatorsDictionary |
		operatorsDictionary := self getMutantOperatorsDictionaryFor: name.

		operatorsDictionary := operatorsDictionary asDictionary
			                       addAllWithoutOverwrite:
				                       (self findOperatorsWithoutMutantsFor:
						                        operatorsDictionary);
			                       yourself.
		allOperatorsDictionary addAllWithoutOverwrite: operatorsDictionary ].

	^ allOperatorsDictionary
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> findOperatorsWithoutMutantsFor: aDictionary [

	| operatorsWithoutMutants |
	operatorsWithoutMutants := (MTMutantOperator contentsAll collect:
		                            #species) reject: [ :ope |
		                           aDictionary keys includes: ope ].

	^ OrderedDictionary new
		  addAll: (operatorsWithoutMutants collect: [ :each | each -> 0 ]);
		  yourself
]

{ #category : 'computing' }
MTMutantOperatorAnalysis >> getMutantOperatorsDictionaryFor: aName [

	| analysis dic classesToMutate testCases |
	classesToMutate := aName asPackage definedClasses.
	testCases := (aName , '-Tests') asPackage definedClasses select:
		             #isTestCase.

	analysis := MTAnalysis new
		            classesToMutate: classesToMutate;
		            testClasses: testCases;
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
