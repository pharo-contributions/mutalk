accessing
killedMutantSelected: anInteger 
	killedMutantSelected := self killedMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #killedMutantSelected.
	killedMutantSelected ifNotNil: [MutationBrowser openOn: killedMutantSelected]