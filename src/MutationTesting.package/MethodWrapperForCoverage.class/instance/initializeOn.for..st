initialization
initializeOn: aMethodReference for: aCoverageAnalysis
	super initializeOn: aMethodReference.
	coverageAnalysis := aCoverageAnalysis.
	tests := Set new