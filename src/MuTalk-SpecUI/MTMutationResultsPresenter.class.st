"
I am a presenter that show the results of the mutation testing
"
Class {
	#name : #MTMutationResultsPresenter,
	#superclass : #SpPresenter,
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'diffPresenter',
		'tablePresenter'
	],
	#category : 'MuTalk-SpecUI'
}

{ #category : #accessing }
MTMutationResultsPresenter class >> initialExtent [

	^ 800 @ 600
]

{ #category : #specs }
MTMutationResultsPresenter class >> title [

	^ 'Mutation Results'
]

{ #category : #initialization }
MTMutationResultsPresenter >> connectPresenters [

	tablePresenter whenSelectionChangedDo: [ :selection | 
		| selectedItem |
		selectedItem := selection selectedItem.
		diffPresenter
			leftText: selectedItem mutant originalMethod ast formattedCode;
			rightText: selectedItem mutant modifiedSource;
			contextClass: selectedItem mutant originalClass ]
]

{ #category : #layout }
MTMutationResultsPresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		add: tablePresenter;
		add: diffPresenter;
		yourself
]

{ #category : #initialization }
MTMutationResultsPresenter >> initializePresenters [

	tablePresenter := self newTable.
	tablePresenter
		items: model;
		activateOnSingleClick;
		addColumn: (SpIndexTableColumn new
			title: '#';
			beNotExpandable;
			yourself);
		addColumn: (SpStringTableColumn
			title: 'Results'
			evaluated: [ :each | each printString ]).
	
	diffPresenter := self newDiff.
	diffPresenter showOptions: false
]

{ #category : #initialization }
MTMutationResultsPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self class title;
		initialExtent: self class initialExtent
]
