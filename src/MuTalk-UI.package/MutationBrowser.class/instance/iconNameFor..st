printing
iconNameFor: aTest 
	| testResult |
	testResult := mutantEvaluationResult result.
	(testResult concretePassed includes: aTest) ifTrue: [ ^ #testGreen ].
	(testResult concreteFailures includes: aTest) ifTrue: [ ^ #testOrange ].
	(testResult concreteErrors includes: aTest) ifTrue: [ ^ #testRed ].
	^ #testGray