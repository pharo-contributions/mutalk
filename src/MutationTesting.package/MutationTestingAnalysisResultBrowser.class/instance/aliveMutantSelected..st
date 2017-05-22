accessing
aliveMutantSelected: anInteger 
	aliveMutantSelected := self aliveMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #aliveMutantSelected.
	aliveMutantSelected ifNotNil: [ MutationBrowser openOn: aliveMutantSelected]