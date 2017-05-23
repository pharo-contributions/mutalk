suggestions
suggestionForMutationProducedByAReplaceIfFalseReceiverWithTrueOperator: aMutation 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated'.]