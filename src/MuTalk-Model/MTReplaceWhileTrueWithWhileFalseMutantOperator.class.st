Class {
	#name : 'MTReplaceWhileTrueWithWhileFalseMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators - Conditional boolean operation',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Conditional boolean operation'
}

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperator >> newSelector [

	^ #whileFalse:
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperator >> oldSelector [

	^ #whileTrue:
]
