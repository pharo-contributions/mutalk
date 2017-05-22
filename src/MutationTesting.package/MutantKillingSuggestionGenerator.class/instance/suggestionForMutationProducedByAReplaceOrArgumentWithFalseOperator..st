suggestions
suggestionForMutationProducedByAReplaceOrArgumentWithFalseOperator: aMutation 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is true' ]