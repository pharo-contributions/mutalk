accessing-testClasses
testClassMenu: aMenu 
	| menu |
	menu := aMenu
		title: ' Test Classes';
		yourself.
	^ menu
		add: 'Select all' action: #selectAllTestClasses;
		add: 'Select inversion' action: #selectInverseTestClasses;
		add: 'Select none' action: #selectNoTestClasses;
		addLine;
		add: 'Filter...' action: #filterTestClasses;
		addLine;
		add: 'Refresh' action: #updateTestClasses;
		yourself.