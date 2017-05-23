accessing
methodWithTwoSenders
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	