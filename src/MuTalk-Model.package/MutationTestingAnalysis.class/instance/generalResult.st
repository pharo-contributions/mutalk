results
generalResult
	^ MutationTestingGeneralResult
		for: particularResults
		timed: (Duration nanoSeconds: (Duration milliSeconds: elapsedTime) nanoSeconds)