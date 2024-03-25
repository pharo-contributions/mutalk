Class {
	#name : #MTFamixPropertiesTypeReplacementOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : #'MuTalk-Moose-Operators'
}

{ #category : #accessing }
MTFamixPropertiesTypeReplacementOperator >> allPropertyTypes [

	^ { #Number. #String. #Boolean. #Object } asOrderedCollection
]

{ #category : #'instance creation' }
MTFamixPropertiesTypeReplacementOperator >> appliesToNode: aNode [

	^ aNode isMessage and: [
		  aNode selector = #property:type: ]
]

{ #category : #printing }
MTFamixPropertiesTypeReplacementOperator >> description [

	^ ''
]

{ #category : #private }
MTFamixPropertiesTypeReplacementOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	| properties affectedNode |
	affectedNode := self affectedNodeFor: aParseTree at: nodeIndex.
	properties := self propertiesForNode: affectedNode.
	accumulator addAll: (properties collect: [ :property |
			 | newExpression newNode |
			 newExpression := RBLiteralValueNode value: property.
			 newNode := self newNodeFrom: affectedNode with: newExpression.
			 MTMethodMutation
				 for: aCompiledMethod
				 using: self
				 nodeNumber: nodeIndex
				 ofClass: aCompiledMethod methodClass
				 withData: newNode ]).
	^ accumulator
]

{ #category : #'instance creation' }
MTFamixPropertiesTypeReplacementOperator >> newNodeFrom: anOldNode with: anExpression [

	| newNode |
	newNode := anOldNode copy.
	(newNode arguments at: 2) replaceWith: anExpression.
	anExpression value = #Boolean ifTrue: [
		newNode selector: #property:type:defaultValue:.
		newNode arguments add: (RBLiteralValueNode value: true) ].
	^ newNode
]

{ #category : #accessing }
MTFamixPropertiesTypeReplacementOperator >> propertiesForNode: aNode [

	| nodeProperty |
	nodeProperty := (aNode arguments at: 2) value.
	^ self allPropertyTypes
		  remove: nodeProperty ifAbsent: [  ];
		  yourself
]
