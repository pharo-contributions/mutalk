testing
testSuggestionToKillReplaceDoBlockWithEmptyBlock
	| operator mutation |
	operator := ReplaceDoBlockWithEmptyBlockOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceDoBlockWithEmptyBlock) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that there is an iteration doing [ :each | Transcript show: each ] on each element of OrderedCollection new'.