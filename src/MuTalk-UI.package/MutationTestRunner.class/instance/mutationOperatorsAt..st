accessing-mutationOperators
mutationOperatorsAt: anInteger 

	^ mutationOperatorsSelected includes: (mutationOperators at: anInteger ifAbsent: [ ^ false ]).