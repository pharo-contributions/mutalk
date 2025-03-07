Class {
	#name : 'MTUtilityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'classes',
		'mtAnalysis'
	],
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'environments' }
MTUtilityAnalysis class >> forClasses: aCollectionOfClasses [

	^ self new classes: aCollectionOfClasses
]

{ #category : 'environments' }
MTUtilityAnalysis class >> forPackages: aCollectionOfPackages [

	| allClasses |
	allClasses := aCollectionOfPackages
		              inject: OrderedCollection new
		              into: [ :coll :package |
			              coll addAll: package asPackage definedClasses.
			              coll ].
		
	^ self new classes: allClasses
]

{ #category : 'accessing' }
MTUtilityAnalysis >> classes [

	^ classes
]

{ #category : 'accessing' }
MTUtilityAnalysis >> classes: anObject [

	classes := anObject
]

{ #category : 'initialization' }
MTUtilityAnalysis >> initializeMtAnalysis [

	mtAnalysis ifNil: [
		mtAnalysis := MTAnalysis new
			              classesToMutate: classes;
			              doNotWarnAboutEmptyTests;
			              testClasses: {  } ]
]

{ #category : 'accessing' }
MTUtilityAnalysis >> mtAnalysis [

	^ mtAnalysis
]

{ #category : 'accessing' }
MTUtilityAnalysis >> mtAnalysis: anAnalysis [

	mtAnalysis := anAnalysis
]
