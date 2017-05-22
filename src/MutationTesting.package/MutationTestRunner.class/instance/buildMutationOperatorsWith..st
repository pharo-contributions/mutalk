building
buildMutationOperatorsWith: aBuilder
	^ aBuilder pluggableMultiSelectionListSpec new
		model: self;
		list: #mutationOperatorsList;
		menu: #mutationOperatorsMenu:;
		getIndex: #mutationOperatorsSelected;
		setIndex: #mutationOperatorsSelected:;
		getSelectionList: #mutationOperatorsAt:;
		setSelectionList: #mutationOperatorsAt:put:;
		keyPress: #keyPressed:;
		yourself.