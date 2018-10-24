Class {
	#name : #ReplacePlusWithMinusMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #accessing }
ReplacePlusWithMinusMutantOperator >> newSelector [
	^#-
]

{ #category : #accessing }
ReplacePlusWithMinusMutantOperator >> oldSelector [
	^#+
]
