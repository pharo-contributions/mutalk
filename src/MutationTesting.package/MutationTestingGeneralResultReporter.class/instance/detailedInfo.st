evaluating
detailedInfo
	|stream|
	stream := String streamContents: [:str|
		str nextPutAll: mutationGeneralResult printString; cr.
		str nextPutAll: '----------------------------------'; cr.
		str nextPutAll: mutationGeneralResult elapsedTime printString; cr.
		str nextPutAll: '----------------------------------'; cr.
		mutationGeneralResult printDetailedInfoOn: str].
	^stream contents
	
	