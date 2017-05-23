updating
updateKilledMutantList
	killedMutantList := self filterKilledMutantsList.
	killedMutantSelected := nil.
	self
		changed: #killedMutantList;
		changed: #killedMutantSelected