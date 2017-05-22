accessing-testing
aliveMutantListMenu: aMenu 
	| menu |
	menu := aMenu
		title: 'Alive Mutants';
		yourself.
	^ menu
		add: 'Filter Class...' action: #filterClassFromAliveMutants;
		add: 'Filter Operator...' action: #filterOperatorFromAliveMutants;
		addLine;
		add: 'Remove Filters' action: #removeFiltersFromAliveMutants;
		addLine;
		add: 'Refresh' action: #updateAliveMutantList;
		yourself.