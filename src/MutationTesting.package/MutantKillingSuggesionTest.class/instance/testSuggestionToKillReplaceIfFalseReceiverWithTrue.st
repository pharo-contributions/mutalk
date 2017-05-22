testing
testSuggestionToKillReplaceIfFalseReceiverWithTrue
	| operator mutation |
	operator := ReplaceIfFalseReceiverWithTrueOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is evaluated'.