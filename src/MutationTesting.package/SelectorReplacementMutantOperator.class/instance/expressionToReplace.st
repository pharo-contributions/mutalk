applying
expressionToReplace 
	| oldString |
	oldString := RBParseTreeSearcher buildSelectorString: self oldSelector.
	^'``@object ' , oldString
	