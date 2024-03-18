Class {
	#name : #MTFamixPropertiesDefaultValueReplacementOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : #'MuTalk-Model-Operators-Famix'
}

{ #category : #'instance creation' }
MTFamixPropertiesDefaultValueReplacementOperator >> appliesToNode: aNode [

	^ aNode isMessage and: [
		  aNode selector = #property:type:defaultValue: ]
]

{ #category : #printing }
MTFamixPropertiesDefaultValueReplacementOperator >> description [

	^ ''
]

{ #category : #'instance creation' }
MTFamixPropertiesDefaultValueReplacementOperator >> newNodeFrom: anOldNode [

	| newNode |
	newNode := anOldNode copy.
	(newNode arguments at: 3) replaceWith:
		(RBLiteralValueNode value: (anOldNode arguments at: 3) value not).
	^ newNode
]
