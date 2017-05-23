suggestions
suggestionForMutationProducedByAReplaceAndWithFalseOperator: aMutation 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are true.' ]