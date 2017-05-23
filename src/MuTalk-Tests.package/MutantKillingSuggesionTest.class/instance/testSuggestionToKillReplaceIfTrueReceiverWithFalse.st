testing
testSuggestionToKillReplaceIfTrueReceiverWithFalse
	| operator mutation |
	operator := ReplaceIfTrueReceiverWithFalseOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is true, [ 8 ] is evaluated'.