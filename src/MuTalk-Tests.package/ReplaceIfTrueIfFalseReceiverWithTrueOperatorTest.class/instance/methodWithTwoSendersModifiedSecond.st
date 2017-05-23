accessing
methodWithTwoSendersModifiedSecond
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^true ifTrue: [a + 1] ifFalse: [a + 8].