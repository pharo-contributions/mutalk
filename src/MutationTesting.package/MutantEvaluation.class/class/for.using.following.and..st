instance creation
for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy and: aTestSelectionStrategy 
	|tests|
	tests := aTestSelectionStrategy testCasesFromReferencies: aCollectionOftestCases.
	^self for: aMutation using: tests following: aMutantEvaluationStrategy andConsidering:nil