accessing-mutationOperators
mutationOperatorsAt: anInteger put: aBoolean 
	mutationOperatorsSelected := mutationOperatorsSelected
				perform: (aBoolean
						ifTrue: [#copyWith:]
						ifFalse: [#copyWithout:])
				with: (mutationOperators
						at: anInteger
						ifAbsent: [^ self]).
	self changed: #mutationOperatorsSelected;
		 changed: #hasRunnable