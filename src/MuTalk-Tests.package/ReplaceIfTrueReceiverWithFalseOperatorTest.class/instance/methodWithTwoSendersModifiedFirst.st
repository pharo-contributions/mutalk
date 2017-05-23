accessing
methodWithTwoSendersModifiedFirst
	false ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false