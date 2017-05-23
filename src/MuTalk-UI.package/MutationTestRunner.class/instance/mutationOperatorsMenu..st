accessing-mutationOperators
mutationOperatorsMenu: aMenu 
	| menu |
	menu := aMenu
		title: ' Mutation Operators';
		yourself.
	^ menu
		add: 'Select all' action: #selectAllMutationOperators;
		add: 'Select inversion' action: #selectInverseMutationOperators;
		add: 'Select none' action: #selectNoMutationOperators;
		addLine;
		add: 'Refresh' action: #updateMutationOperators;
		yourself.