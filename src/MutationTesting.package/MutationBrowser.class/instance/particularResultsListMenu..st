accessing-particularResults
particularResultsListMenu: aMenu
	| menu |
	menu := aMenu
		title: 'Tests Results';
		yourself.
	^ menu
		add: 'Filter Class...' action: #filterClassFromParticularResults;
		addLine;
		add: 'Remove Filters' action: #removeFiltersFromParticularResults;
		addLine;
		add: 'Refresh' action: #updateParticularResultsList;
		yourself.