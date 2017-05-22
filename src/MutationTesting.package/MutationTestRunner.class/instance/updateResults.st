updating
updateResults
	
	self updateStatus: false.
	killedMutantList size = result killedOrTerminatedMutants size ifFalse: [ self updateKilledMutantList ].
	aliveMutantList size = result aliveMutants size ifFalse: [ self updateAliveMutantList ].
	 