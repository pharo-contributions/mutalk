private
writeLineToFile: aString 
	[fileStream closed
		ifTrue: [fileStream open].
	fileStream setToEnd; nextPutAll: aString; cr]
		ensure: [fileStream close]