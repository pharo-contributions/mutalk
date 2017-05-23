accessing
numberOfMethodVersionsOf: aSelector in: aClass 
	
	| aMethod |
	
	aMethod := aClass>>aSelector.
	
	^ (SourceFiles
		changeRecordsFrom: aMethod sourcePointer
		className: aMethod origin
		isMeta: aMethod origin isClassSide) size