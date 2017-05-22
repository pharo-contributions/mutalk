applying
timesToApplyIn: aCompiledMethod with: aParseTree 
	"Evaluates how many times can the operator be applyied"	
	|searcher timesToApply|
	searcher := RBParseTreeSearcher new.
	timesToApply := 0.
	searcher matches:self expressionToReplace do:[:node :answer | timesToApply := timesToApply + 1].
	searcher executeTree: aParseTree copy.
	^timesToApply.
	