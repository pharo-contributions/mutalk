accessing
methodWithTwoSendersModifiedFirst
	false ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false