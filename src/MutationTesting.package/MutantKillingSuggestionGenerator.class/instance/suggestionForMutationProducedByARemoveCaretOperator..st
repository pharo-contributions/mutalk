suggestions
suggestionForMutationProducedByARemoveCaretOperator: aMutation 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case to check that the method is returning '.
		aStream nextPutAll: aMutation mutatedNode formattedCode asText allBold ]