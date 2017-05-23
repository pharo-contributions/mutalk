building
buildClassesWith: aBuilder
	^ aBuilder pluggableMultiSelectionListSpec new
		model: self;
		list: #classList;
		menu: #classMenu:;
		getIndex: #classSelected;
		setIndex: #classSelected:;
		getSelectionList: #classAt:;
		setSelectionList: #classAt:put:;
		keyPress: #keyPressed:;
		yourself.