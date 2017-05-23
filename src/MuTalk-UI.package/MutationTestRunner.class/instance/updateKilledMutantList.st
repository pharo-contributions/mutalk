updating
updateKilledMutantList
	killedMutantList := self filterKilledMutantsList.
	killedMutantSelected := nil.
	self changed: #allSelections;
		changed: #killedMutantList;
		changed: #killedMutantSelected