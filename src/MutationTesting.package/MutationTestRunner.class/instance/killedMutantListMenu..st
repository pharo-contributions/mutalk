accessing-testing
killedMutantListMenu: aMenu 
	| menu |
	menu := aMenu
		title: 'Killed Mutants';
		yourself.
	^ menu
		add: 'Filter Class...' action: #filterClassFromKilledMutants;
		add: 'Filter Operator...' action: #filterOperatorFromKilledMutants;
		addLine;
		add: 'Remove Filters' action: #removeFiltersFromKilledMutants;
		addLine;
		add: 'Refresh' action: #updateKilledMutantList;
		yourself.