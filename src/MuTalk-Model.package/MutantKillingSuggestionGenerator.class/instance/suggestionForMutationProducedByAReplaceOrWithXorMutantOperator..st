suggestions
suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are true.' ]