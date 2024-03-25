Class {
	#name : #MTFamixNegateBooleanDefaultValueOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : #'MuTalk-Moose-Operators'
}

{ #category : #'instance creation' }
MTFamixNegateBooleanDefaultValueOperator >> appliesToNode: aNode [

	^ aNode isMessage and: [
		  aNode selector = #property:type:defaultValue: ]
]

{ #category : #printing }
MTFamixNegateBooleanDefaultValueOperator >> description [

	^ 'Negate the default value of a Boolean property'
]

{ #category : #private }
MTFamixNegateBooleanDefaultValueOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	| affectedNode newNode |
	affectedNode := self affectedNodeFor: aParseTree at: nodeIndex.
	newNode := self newNodeFrom: affectedNode.

	accumulator add: (MTMetamodelMethodMutation
			 for: aCompiledMethod
			 using: self
			 nodeNumber: nodeIndex
			 ofClass: aCompiledMethod methodClass
			 withData: newNode).
	^ accumulator
]

{ #category : #'instance creation' }
MTFamixNegateBooleanDefaultValueOperator >> newNodeFrom: anOldNode [

	| newNode |
	newNode := anOldNode copy.
	(newNode arguments at: 3) replaceWith:
		(RBLiteralValueNode value: (anOldNode arguments at: 3) value not).
	^ newNode
]
