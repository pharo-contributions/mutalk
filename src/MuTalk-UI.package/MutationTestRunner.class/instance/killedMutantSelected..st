accessing-testing
killedMutantSelected: anInteger 
	killedMutantSelected := killedMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #killedMutantSelected.
	killedMutantSelected ifNotNil: [MutationBrowser openOn: killedMutantSelected]