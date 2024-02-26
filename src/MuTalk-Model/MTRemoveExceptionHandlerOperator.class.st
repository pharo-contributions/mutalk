Class {
	#name : #MTRemoveExceptionHandlerOperator,
	#superclass : #MTParseRewriterMutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
MTRemoveExceptionHandlerOperator >> description [
	^'Remove Exception Handler Operator'
]

{ #category : #applying }
MTRemoveExceptionHandlerOperator >> expressionToReplace [ 
	^'``@aBlock on: ``@anException do: ``@anotherBlock'

]

{ #category : #applying }
MTRemoveExceptionHandlerOperator >> newExpression [ 
	^'``@aBlock value'

]

{ #category : #suggestions }
MTRemoveExceptionHandlerOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByARemoveExceptionHandlerOperator: aMutation.
]
