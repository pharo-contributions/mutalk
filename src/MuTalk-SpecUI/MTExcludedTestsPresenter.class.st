Class {
	#name : 'MTExcludedTestsPresenter',
	#superclass : 'MTMutationResultsPresenter',
	#instVars : [
		'testCodePresenter'
	],
	#category : 'MuTalk-SpecUI',
	#package : 'MuTalk-SpecUI'
}

{ #category : 'initialization' }
MTExcludedTestsPresenter >> connectPresenters [

	tablePresenter whenSelectionChangedDo: [ :selection |
		| selectedItem |
		selectedItem := selection selectedItem.
		testCodePresenter
			beForMethod: selectedItem key method;
			text: selectedItem key method sourceCode;
			beNotEditable ]
]

{ #category : 'layout' }
MTExcludedTestsPresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  add: tablePresenter;
		  add: testCodePresenter;
		  yourself
]

{ #category : 'initialization' }
MTExcludedTestsPresenter >> initializePresenters [

	tablePresenter := self newTable.
	tablePresenter
		items: model;
		activateOnSingleClick;
		addColumn: (SpStringTableColumn
				 title: 'ExcludedTests'
				 evaluated: [ :each | each key ]);
		addColumn:
			(SpStringTableColumn
				 title: 'Reason'
				 evaluated: [ :each | each value ]).
				
	testCodePresenter := self newCode.
]
