accessing
reRun
	analysis run.
	result := analysis generalResult.
	aliveMutantList := result aliveMutants.
	killedMutantList := result killedOrTerminatedMutants.
	self refresh.