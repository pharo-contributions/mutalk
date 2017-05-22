accessing
methodToTestSuggestionToKillRAOWithAssignments
	|firstCondition secondCondition|
	firstCondition := 2 = (1 + 1).
	secondCondition := Set new isEmpty.
	^firstCondition and: [secondCondition ]