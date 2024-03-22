Class {
	#name : #MTFamixLeftToRightGeneralizationOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Moose-Operators-Famix'
}

{ #category : #accessing }
MTFamixLeftToRightGeneralizationOperator >> newSelector [

	^ #'--|>'
]

{ #category : #accessing }
MTFamixLeftToRightGeneralizationOperator >> oldSelector [

	^ #'<|--'
]
