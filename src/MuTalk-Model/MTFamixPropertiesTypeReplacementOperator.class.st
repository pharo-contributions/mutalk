Class {
	#name : #MTFamixPropertiesTypeReplacementOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : #'MuTalk-Model-Operators-Famix'
}

{ #category : #accessing }
MTFamixPropertiesTypeReplacementOperator >> allPropertyTypes [

	^ { #Number. #String. #Boolean. #Object }
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

{ #category : #'instance creation' }
MTFamixPropertiesTypeReplacementOperator >> newNodeFrom: anOldNode [

	| newNode |
	newNode := anOldNode copy.
	(newNode arguments at: 2) replaceWith:
		(RBLiteralValueNode value: #Number).
	^ newNode
]
