Class {
	#name : #MTFamixLeftToRightGeneralizationOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Model-Operators-Moose'
}

{ #category : #accessing }
MTFamixLeftToRightGeneralizationOperator >> newSelector [

	^ #'--|>'
]

{ #category : #accessing }
MTFamixLeftToRightGeneralizationOperator >> oldSelector [

	^ #'<|--'
]
