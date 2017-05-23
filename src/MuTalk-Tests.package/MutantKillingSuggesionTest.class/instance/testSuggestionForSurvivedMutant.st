testing-results
testSuggestionForSurvivedMutant

	self assert: self survivedMutant killingSuggestions
			= (MutantKillingSuggestionGenerator new suggestionFor: self survivedMutant mutant)