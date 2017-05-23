testing-operators
testSuggestionToKillReplaceAndForOr
	| operator mutation mutationWithAssignment |
	operator := ReplaceAndWithOrMutantOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRAO) first.
	mutationWithAssignment := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRAOWithAssignments) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) = 'It is missing a test case where only one of the conditions 2 = (1 + 1) and [ Set new isEmpty ] is True.'.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutationWithAssignment) = 'It is missing a test case where only one of the conditions firstCondition and [ secondCondition ] is True.'