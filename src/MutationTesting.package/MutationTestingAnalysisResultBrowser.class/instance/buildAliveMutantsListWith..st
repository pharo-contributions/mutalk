building
buildAliveMutantsListWith: aBuilder
	^ aBuilder pluggableListSpec new
		model: self;
		name: 'Alive Mutant List';
		list: #aliveMutantList; 
		menu: #aliveMutantListMenu:;
		getIndex: #aliveMutantSelected; 
		setIndex: #aliveMutantSelected:;
		icon: #getIconFor:;
		yourself.