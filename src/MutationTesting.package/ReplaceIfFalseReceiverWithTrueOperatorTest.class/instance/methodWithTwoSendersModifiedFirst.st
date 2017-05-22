accessing
methodWithTwoSendersModifiedFirst
	true ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false