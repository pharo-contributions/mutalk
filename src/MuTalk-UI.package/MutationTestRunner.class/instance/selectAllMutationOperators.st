accessing-mutationOperators
selectAllMutationOperators
	mutationOperatorsSelected := mutationOperators asSet.
	self changed: #allSelections; changed: #mutationOperatorsSelected; changed: #hasRunnable.