suggestions
suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where only one of the conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is True.' ]