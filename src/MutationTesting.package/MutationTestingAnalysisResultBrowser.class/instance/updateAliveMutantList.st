updating
updateAliveMutantList
	aliveMutantList := self filterAliveMutantsList.
	aliveMutantSelected := nil.
	self
		changed: #aliveMutantList;
		changed: #aliveMutantSelected