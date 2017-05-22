building
buildCategoriesWith: aBuilder 
	^ aBuilder pluggableMultiSelectionListSpec new model: self;
		 list: #categoryList;
		 menu: #categoryMenu:;
		 getIndex: #categorySelected;
		 setIndex: #categorySelected:;
		 getSelectionList: #categoryAt:;
		 setSelectionList: #categoryAt:put:;
		 yourself