Class {
	#name : 'MTParametricMethodMutation',
	#superclass : 'MTMethodMutation',
	#instVars : [
		'newExpression'
	],
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'instance creation' }
MTParametricMethodMutation class >> for: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass replacingWith: anObject [

	^ self new
		  initializeFor: aMethod
		  using: anOperatorApplied
		  nodeNumber: aNodeNumber
		  ofClass: aClass
		  replacingWith: anObject;
		  yourself
]

{ #category : 'initialization' }
MTParametricMethodMutation >> initializeFor: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass replacingWith: anObject [

	super
		initializeFor: aMethod
		using: anOperatorApplied
		nodeNumber: aNodeNumber
		ofClass: aClass.
	newExpression := anObject
]

{ #category : 'accessing' }
MTParametricMethodMutation >> modifiedSource [

	^ operator
		  modifiedSourceFor: originalMethod
		  number: nodeNumber
		  newExpression: newExpression
]
