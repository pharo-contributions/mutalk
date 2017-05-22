suggestions
suggestionForMutationProducedByADoBlockWithEmptyBlockOperator: aMutation 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that there is an iteration doing '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' on each element of '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.]