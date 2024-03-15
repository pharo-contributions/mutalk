Class {
	#name : #MTFamixLeftToRightGeneralizationOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Model-Operators-Famix'
}

{ #category : #accessing }
MTFamixLeftToRightGeneralizationOperator >> newSelector [

	^ #'--|>'
]

{ #category : #accessing }
MTFamixLeftToRightGeneralizationOperator >> oldSelector [

	^ #'<|--'
]
