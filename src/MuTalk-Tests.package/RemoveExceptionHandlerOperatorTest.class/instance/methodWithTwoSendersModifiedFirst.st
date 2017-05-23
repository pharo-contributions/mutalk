accessing
methodWithTwoSendersModifiedFirst
	[self error:'an error'.] value.
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].