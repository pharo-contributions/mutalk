accessing
methodWithTwoSendersModifiedSecond
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] value