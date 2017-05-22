initialize
initializeFor: aMutationAnalisys 
	analysis := aMutationAnalisys.
	result := aMutationAnalisys generalResult.
	aliveMutantList := result aliveMutants.
	killedMutantList := result killedOrTerminatedMutants.
	self refresh