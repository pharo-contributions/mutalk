Class {
	#name : #RemoveExceptionHandlerOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
RemoveExceptionHandlerOperator >> description [
	^'Remove Exception Handler Operator'
]

{ #category : #applying }
RemoveExceptionHandlerOperator >> expressionToReplace [ 
	^'``@aBlock on: ``@anException do: ``@anotherBlock'

]

{ #category : #applying }
RemoveExceptionHandlerOperator >> newExpression [ 
	^'``@aBlock value'

]

{ #category : #suggestions }
RemoveExceptionHandlerOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByARemoveExceptionHandlerOperator: aMutation.
]
