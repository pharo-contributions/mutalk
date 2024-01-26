Class {
	#name : 'MTNonMutatedMethodsAnalysis',
	#superclass : 'Object',
	#instVars : [
		'classes'
	],
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'environments' }
MTNonMutatedMethodsAnalysis class >> forClasses: aCollectionOfClasses [

	^ self new classes: aCollectionOfClasses
]

{ #category : 'environments' }
MTNonMutatedMethodsAnalysis class >> forPackages: aCollectionOfPackages [

	| allClasses |
	allClasses := aCollectionOfPackages
		              inject: OrderedCollection new
		              into: [ :coll :package |
			              coll addAll: package asPackage definedClasses.
			              coll ].
		
	^ self new classes: allClasses
]

{ #category : 'accessing' }
MTNonMutatedMethodsAnalysis >> classes [

	^ classes
]

{ #category : 'accessing' }
MTNonMutatedMethodsAnalysis >> classes: anObject [

	classes := anObject
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> findMethodsWithoutMutation [

	| allMethods allMutatedMethods |
	allMethods := self getAllMethods.
	allMutatedMethods := self getMutatedMethods.

	^ allMethods reject: [ :method | allMutatedMethods includes: method ]
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> getAllMethods [

	^ classes inject: OrderedCollection new into: [ :coll :class |
		  coll addAll: (class methods reject: #isExtension).
		  coll ]
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> getMutatedMethods [

	| analysis mutatedMethods |
	analysis := MTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  };
		            operators: MTMutantOperator contentsAll.

	mutatedMethods := Set withAll:
		                  (analysis generateMutations collect:
			                   #originalMethod).
	^ mutatedMethods
]
