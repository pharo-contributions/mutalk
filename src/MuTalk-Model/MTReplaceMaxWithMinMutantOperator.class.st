Class {
	#name : 'MTReplaceMaxWithMinMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Relational operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Relational operation'
}

{ #category : 'applying' }
MTReplaceMaxWithMinMutantOperator >> expressionToReplace [
	^ '``@a max: ``@b'
]

{ #category : 'applying' }
MTReplaceMaxWithMinMutantOperator >> newExpression [
	^ '``@a min: ``@b'
]

{ #category : 'accessing' }
MTReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : 'accessing' }
MTReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
