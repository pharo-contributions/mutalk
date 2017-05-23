evaluating
value
	|file|
	
	file := fileReference writeStream.
	file setToEnd; nextPutAll: self resumedInfo; close.
	
	