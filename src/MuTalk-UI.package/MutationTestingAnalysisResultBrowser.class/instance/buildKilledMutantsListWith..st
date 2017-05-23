building
buildKilledMutantsListWith: aBuilder
	^ aBuilder pluggableListSpec new
		model: self;
		name: 'Killed Mutant List';
		list: #killedMutantList; 
		menu: #killedMutantListMenu:;
		getIndex: #killedMutantSelected; 
		setIndex: #killedMutantSelected:;
		icon: #getIconFor:;
		yourself.