building
buildParticularResultsWith: aBuilder
	^ aBuilder pluggableListSpec new
		model: self;
		name: 'Test Results';
		list: #particularResultsList; 
		menu: #particularResultsListMenu:;
		getIndex: #particularResultsSelected; 
		setIndex: #particularResultsSelected:;
		icon: #getIconForResult:;
		yourself.