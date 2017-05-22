printing
printDetailedResultOn: aStream 

		aStream cr; nextPutAll: 'PASSED'; cr.
		result passed do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr; nextPutAll: 'FAILURES'; cr.
		result failures do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr; nextPutAll: 'ERRORS'; cr.
		result errors do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr.