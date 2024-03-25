Class {
	#name : #MTFamixRemoveBooleanDefaultValueOperator,
	#superclass : #MTPredicateBasedMutantOperator,
	#category : #'MuTalk-Moose-Operators'
}

{ #category : #'instance creation' }
MTFamixRemoveBooleanDefaultValueOperator >> appliesToNode: aNode [

	^ aNode isMessage and: [
		  aNode selector = #property:type:defaultValue: ]
]

{ #category : #printing }
MTFamixRemoveBooleanDefaultValueOperator >> description [

	^ 'Remove the default value of a Boolean property'
]

{ #category : #private }
MTFamixRemoveBooleanDefaultValueOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

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
MTFamixRemoveBooleanDefaultValueOperator >> newNodeFrom: anOldNode [

	| newNode |
	newNode := anOldNode copy.
	newNode selector: #property:type:.
	newNode arguments remove: (newNode arguments at: 3).
	^ newNode
]
