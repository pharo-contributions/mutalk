accessing-testing
aliveMutantSelected: anInteger 
	aliveMutantSelected := aliveMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #aliveMutantSelected.
	aliveMutantSelected ifNotNil: [ MutationBrowser openOn: aliveMutantSelected]