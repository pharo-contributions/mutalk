Class {
	#name : 'MTReplaceWhileTrueWithWhileFalseMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperator >> newSelector [

	^ #whileFalse:
]

{ #category : 'accessing' }
MTReplaceWhileTrueWithWhileFalseMutantOperator >> oldSelector [

	^ #whileTrue:
]
