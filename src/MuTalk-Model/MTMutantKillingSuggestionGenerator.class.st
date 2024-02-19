Class {
	#name : 'MTMutantKillingSuggestionGenerator',
	#superclass : 'Object',
	#category : 'MuTalk-Model-Reporting',
	#package : 'MuTalk-Model',
	#tag : 'Reporting'
}

{ #category : 'evaluating' }
MTMutantKillingSuggestionGenerator >> suggestionFor: aMutation [
	^aMutation operator suggestionFor: aMutation using: self.
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByADoBlockWithEmptyBlockOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that there is an iteration doing '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' on each element of '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByARemoveCaretOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case to check that the method is returning '.
		aStream nextPutAll: aMutation mutatedNode formattedCode asText allBold ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByARemoveExceptionHandlerOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when an exception of kind '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is signaled, it is handled evaluating the block '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndArgumentWithTrueOperator: aMutation [ 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is false' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndReceiverWithTrueMutantOperator: aMutation [
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is true' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are false.' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndWithFalseOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are true.' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndWithOrMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where only one of the conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is True.' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceGreaterOrEqualWithEqualMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is greater than '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceGreaterOrEqualWithGreaterMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is equal to '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfFalseReceiverWithFalseOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is not evaluated'.]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfFalseReceiverWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated'.]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithFalseOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated and '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.
		aStream nextPutAll: ' is not']
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is not']
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueReceiverWithFalseOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated'.]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueReceiverWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is not evaluated'.]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceLessOrEqualWithEqualMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is less than '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceLessOrEqualWithLessMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is equal to '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceLessOrEqualWithTrueOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is greater than '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrArgumentWithFalseOperator: aMutation [ 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is true' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrReceiverWithFalseOperator: aMutation [ 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is false' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where only one of the conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is True.' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are false.' ]
]

{ #category : 'suggestions' }
MTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are true.' ]
]
