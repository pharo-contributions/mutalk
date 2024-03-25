Class {
	#name : #MTFamixLeftToRightInheritanceOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Moose-Operators'
}

{ #category : #private }
MTFamixLeftToRightInheritanceOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	accumulator add: (MTMetamodelMethodMutation
			 for: aCompiledMethod
			 using: self
			 nodeNumber: nodeIndex
			 ofClass: aCompiledMethod methodClass).
	^ accumulator
]

{ #category : #accessing }
MTFamixLeftToRightInheritanceOperator >> newSelector [

	^ #'--|>'
]

{ #category : #accessing }
MTFamixLeftToRightInheritanceOperator >> oldSelector [

	^ #'<|--'
]
