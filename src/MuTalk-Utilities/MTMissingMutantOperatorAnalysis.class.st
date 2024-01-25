Class {
	#name : 'MTMissingMutantOperatorAnalysis',
	#superclass : 'Object',
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'computing' }
MTMissingMutantOperatorAnalysis >> findMethodsWithoutMutationFor: aCollectionOfPackages [

	| allMethods allMutatedMethods |
	allMethods := self getAllMethodsFrom: aCollectionOfPackages.
	allMutatedMethods := OrderedCollection new.
	aCollectionOfPackages do: [ :name |
		allMutatedMethods addAll: (self getMutatedMethodsFrom: name) ].

	^ allMethods reject: [ :method | allMutatedMethods includes: method ]
]

{ #category : 'computing' }
MTMissingMutantOperatorAnalysis >> getAllMethodsFrom: aCollectionOfPackages [

	| allMethods |
	allMethods := OrderedCollection new.
	aCollectionOfPackages do: [ :name |
		allMethods addAll: (name asPackage methods reject: #isExtension) ].
	^ allMethods
]

{ #category : 'computing' }
MTMissingMutantOperatorAnalysis >> getMutatedMethodsFrom: aName [

	| classesToMutate testCases analysis |
	classesToMutate := aName asPackage definedClasses.
	testCases := (aName , '-Tests') asPackage definedClasses select:
		             #isTestCase.

	analysis := MTAnalysis new
		            classesToMutate: classesToMutate;
		            testClasses: testCases;
		            operators: MTMutantOperator contentsAll.
	^ (analysis generateMutations groupedBy: #originalMethod) keys
]
