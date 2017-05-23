suggestions
suggestionForMutationProducedByARemoveExceptionHandlerOperator: aMutation 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when an exception of kind '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is signaled, it is handled evaluating the block '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.]