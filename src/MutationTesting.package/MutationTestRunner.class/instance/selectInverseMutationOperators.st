accessing-mutationOperators
selectInverseMutationOperators
	mutationOperatorsSelected := mutationOperators asSet 
		removeAll: mutationOperatorsSelected;
		yourself.
	self changed: #allSelections; changed: #mutationOperatorsSelected; changed: #hasRunnable.