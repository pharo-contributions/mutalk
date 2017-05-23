testing
testSuggestionToKillReplaceIfTrueifFalseReceiverWithFalse
	| operator mutation |
	operator := ReplaceIfTrueIfFalseReceiverWithFalseOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is true, [ 1 ] is evaluated and [ 8 ] is not'.