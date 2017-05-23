testing-operators
testSuggestionToKillRemoveCaret
	| operator mutation |
	operator := RemoveCaretOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRCOWithAssignments) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) = 'It is missing a test case to check that the method is returning aValue + anotherValue'