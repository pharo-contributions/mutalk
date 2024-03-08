Class {
	#name : #MTFamixRightToLeftGeneralizationOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Model-Operators-Moose'
}

{ #category : #accessing }
MTFamixRightToLeftGeneralizationOperator >> newSelector [

	^ #'<|--'
]

{ #category : #accessing }
MTFamixRightToLeftGeneralizationOperator >> oldSelector [

	^ #'--|>'
]
