Class {
	#name : 'MTReplaceWhileFalseWithWhileTrueMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperator >> newSelector [

	^ #whileTrue:
]

{ #category : 'accessing' }
MTReplaceWhileFalseWithWhileTrueMutantOperator >> oldSelector [

	^ #whileFalse:
]
