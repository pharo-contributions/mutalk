Class {
	#name : #MuTalkInfiniteRecursionError,
	#superclass : #Error,
	#category : #'MuTalk-Model'
}

{ #category : #halting }
MuTalkInfiniteRecursionError class >> onCount: anInteger [

	"Based on Halt"

	^ self onCountWithBehavior: [ :node | 
		  (node propertyAt: #haltCount) > anInteger ]
]

{ #category : #halting }
MuTalkInfiniteRecursionError class >> onCountWithBehavior: behaviorBlock [
	
	| callingContext node |
	"if the compiler is not loaded, we fall back on the standard halt "
	self environment at: #OpalCompiler ifAbsent: [ ^ self signal ].
	callingContext := thisContext sender sender sender.
	node := callingContext sourceNodeExecuted.
	(node hasProperty: #haltCount)
		ifFalse: [ node propertyAt: #haltCount put: 0 ].
	node propertyAt: #haltCount put: (node propertyAt: #haltCount) + 1.
	(behaviorBlock value: node)
		ifTrue: [ ^ self signal ]
]
