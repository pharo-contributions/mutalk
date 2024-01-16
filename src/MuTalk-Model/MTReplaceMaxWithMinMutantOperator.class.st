Class {
	#name : 'MTReplaceMaxWithMinMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : 'accessing' }
MTReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
