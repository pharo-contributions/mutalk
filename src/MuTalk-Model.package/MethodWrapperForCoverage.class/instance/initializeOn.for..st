initialization
initializeOn: aMethodReference for: aCoverageAnalysis
	self initializeOn: aMethodReference.
	coverageAnalysis := aCoverageAnalysis.
	tests := Set new