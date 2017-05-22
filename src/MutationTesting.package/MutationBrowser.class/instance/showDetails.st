opening
showDetails
	| string |
	string := (MutantReporter for: mutantEvaluationResult) value.
	Workspace new
		contents: string;
		openLabel: 'Mutation Details' string