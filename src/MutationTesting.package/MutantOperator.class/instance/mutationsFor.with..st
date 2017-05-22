mutant generation
mutationsFor: aCompiledMethod with: aParseTree 
	| numberOfMutations |
	numberOfMutations := self timesToApplyIn: aCompiledMethod with: aParseTree.
	^ (1 to: numberOfMutations)
		collect: [:aNumberOfSelector | self
				mutationFor: aCompiledMethod
				with: aParseTree
				number: aNumberOfSelector]