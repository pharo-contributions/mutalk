testing-operators
testSuggestionToKillReplaceOrForAnd
	| operator mutation mutationWithAssignment |
	operator := ReplaceOrWithAndMutantOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillROA) first.
	mutationWithAssignment := (operator mutationsFor: self class >> #methodToTestSuggestionToKillROAWithAssignments) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) = 'It is missing a test case where only one of the conditions 2 = (1 + 1) and [ Set new isEmpty ] is True.'.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutationWithAssignment) = 'It is missing a test case where only one of the conditions firstCondition and [ secondCondition ] is True.'