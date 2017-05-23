testing
testSuggestionToKillRemoveExceptionHandler
	| operator mutation |
	operator := RemoveExceptionHandlerOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRemoveExceptionHandler) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when an exception of kind Exception is signaled, it is handled evaluating the block [ :ex | Transcript show: ''error'' ]'.