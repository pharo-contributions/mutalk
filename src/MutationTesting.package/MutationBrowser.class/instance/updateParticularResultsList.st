updating
updateParticularResultsList

	particularResultsList := self filterParticularResultsList.
	particularResultsSelected := nil.
	self
		changed: #particularResultsList;
		changed: #particularResultsSelected