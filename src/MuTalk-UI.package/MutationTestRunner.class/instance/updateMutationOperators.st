updating
updateMutationOperators
	mutationOperators := self findMutationOperators.
	mutationOperatorsSelected := mutationOperatorsSelected isNil
				ifTrue: [Set new]
				ifFalse: [mutationOperatorsSelected
						select: [:each | mutationOperators includes: each]].
	self changed: #allSelections;
	     changed: #mutationOperatorsList;
		 changed: #mutationOperatorsSelected