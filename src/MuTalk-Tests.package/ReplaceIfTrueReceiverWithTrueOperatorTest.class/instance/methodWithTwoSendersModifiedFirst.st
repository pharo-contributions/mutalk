accessing
methodWithTwoSendersModifiedFirst
	true ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false