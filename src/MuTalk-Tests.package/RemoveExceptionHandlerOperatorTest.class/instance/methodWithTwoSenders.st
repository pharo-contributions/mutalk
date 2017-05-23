accessing
methodWithTwoSenders
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].