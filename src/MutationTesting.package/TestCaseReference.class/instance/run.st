evaluating
run
	| result |
	result := self testCase run.
	(result failuresSize > 0 or: [ result errorsSize > 0])
		ifTrue: [TestsWithErrorsException signal].
	^ result