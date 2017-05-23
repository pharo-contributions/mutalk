accessing
methodWithTwoSendersModifiedFirst
	|a|
	a := true ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].