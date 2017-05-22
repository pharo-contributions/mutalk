accessing-classes
classMenu: aMenu
	| menu |
	menu := aMenu
		title: 'Classes';
		yourself.
	^ menu
		add: 'Select all' action: #selectAllClasses;
		add: 'Select inversion' action: #selectInverseClasses;
		add: 'Select none' action: #selectNoClasses;
		addLine;
		add: 'Filter...' action: #filterClasses;
		addLine;
		add: 'Refresh' action: #updateClasses;
		yourself.