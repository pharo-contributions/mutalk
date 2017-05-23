mutant generation
mutationsFor: aCompiledMethod 
	^self mutationsFor: aCompiledMethod with: aCompiledMethod parseTree.
	