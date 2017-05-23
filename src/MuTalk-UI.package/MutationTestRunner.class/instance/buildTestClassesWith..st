building
buildTestClassesWith: aBuilder
	^ aBuilder pluggableMultiSelectionListSpec new
		model: self;
		list: #testClassList;
		menu: #testClassMenu:;
		getIndex: #testClassSelected;
		setIndex: #testClassSelected:;
		getSelectionList: #testClassAt:;
		setSelectionList: #testClassAt:put:;
		keyPress: #keyPressed:;
		yourself.