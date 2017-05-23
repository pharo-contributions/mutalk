accessing
methodWithTwoSendersModifiedSecond
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^false ifTrue: [a + 1] ifFalse: [a + 8].