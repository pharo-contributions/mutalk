applying
newExpression 
	| newString |
	newString := RBParseTreeSearcher buildSelectorString: self newSelector.
	^'``@object ' , newString
