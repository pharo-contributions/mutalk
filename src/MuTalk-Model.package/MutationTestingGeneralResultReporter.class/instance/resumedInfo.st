evaluating
resumedInfo
	|stream|
	stream := String streamContents: [:str|
		str nextPutAll: mutationGeneralResult numberOfEvaluatedMutants printString; tab.
		str nextPutAll: mutationGeneralResult numberOfKilledMutants printString; tab.
		str nextPutAll: mutationGeneralResult numberOfAliveMutants printString; tab.
		str nextPutAll: mutationGeneralResult numberOfTerminatedMutants printString; tab.
		str nextPutAll: mutationGeneralResult mutationScore printString; tab.
		str nextPutAll: mutationGeneralResult elapsedTime asMilliSeconds printString; tab.
		packagesNames do: [:packageName | str nextPutAll: packageName printString; tab].
		str cr.
		].
	^stream contents
	
	