updating
updateAliveMutantList
	aliveMutantList := self filterAliveMutantsList.
	aliveMutantSelected := nil.
	self
		changed: #allSelections;
		changed: #aliveMutantList;
		changed: #aliveMutantSelected