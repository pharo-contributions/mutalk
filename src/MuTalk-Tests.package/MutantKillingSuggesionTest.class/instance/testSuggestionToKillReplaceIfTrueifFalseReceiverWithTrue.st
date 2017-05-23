testing
testSuggestionToKillReplaceIfTrueifFalseReceiverWithTrue
	| operator mutation |
	operator := ReplaceIfTrueIfFalseReceiverWithTrueOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is evaluated and [ 1 ] is not'.