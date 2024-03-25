Class {
	#name : #MTFamixRightToLeftInheritanceOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Moose-Operators'
}

{ #category : #private }
MTFamixRightToLeftInheritanceOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	accumulator add: (MTMetamodelMethodMutation
			 for: aCompiledMethod
			 using: self
			 nodeNumber: nodeIndex
			 ofClass: aCompiledMethod methodClass).
	^ accumulator
]

{ #category : #accessing }
MTFamixRightToLeftInheritanceOperator >> newSelector [

	^ #'<|--'
]

{ #category : #accessing }
MTFamixRightToLeftInheritanceOperator >> oldSelector [

	^ #'--|>'
]
