Class {
	#name : 'MTFilteredTestsPresenter',
	#superclass : 'MTMutationResultsPresenter',
	#instVars : [
		'testCodePresenter'
	],
	#category : 'MuTalk-SpecUI',
	#package : 'MuTalk-SpecUI'
}

{ #category : 'initialization' }
MTFilteredTestsPresenter >> connectPresenters [

	tablePresenter whenSelectionChangedDo: [ :selection |
		| selectedItem |
		selectedItem := selection selectedItem.
		testCodePresenter
			beForMethod: selectedItem key method;
			text: selectedItem key method sourceCode;
			beNotEditable ]
]

{ #category : 'layout' }
MTFilteredTestsPresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  add: tablePresenter;
		  add: testCodePresenter;
		  yourself
]

{ #category : 'initialization' }
MTFilteredTestsPresenter >> initializePresenters [

	tablePresenter := self newTable.
	tablePresenter
		items: model;
		activateOnSingleClick;
		addColumn: (SpStringTableColumn
				 title: 'FilteredTests'
				 evaluated: [ :each | each key ]);
		addColumn:
			(SpStringTableColumn
				 title: 'Reason'
				 evaluated: [ :each | each value ]).
				
	testCodePresenter := self newCode.
]
