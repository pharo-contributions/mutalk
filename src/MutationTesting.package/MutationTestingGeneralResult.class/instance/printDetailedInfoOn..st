printing
printDetailedInfoOn: aStream 
	
	(particularResults 
		groupBy:  [:result | result mutant operator]
		having: [:g | true]) 
			keysAndValuesDo: [:key :value | 
				aStream nextPutAll: key description.
				aStream nextPutAll: ' - '.
				aStream nextPutAll: value size printString; cr.
			]