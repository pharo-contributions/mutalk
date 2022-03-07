"
I am a presenter that show the results of the mutation testing
"
Class {
	#name : #MutationResultsPresenter,
	#superclass : #SpPresenter,
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'diffPresenter',
		'tablePresenter'
	],
	#category : #'MuTalk-SpecUI'
}

{ #category : #accessing }
MutationResultsPresenter class >> initialExtent [

	^ 800 @ 600
]

{ #category : #specs }
MutationResultsPresenter class >> title [

	^ 'Mutation Results'
]

{ #category : #initialization }
MutationResultsPresenter >> connectPresenters [

	tablePresenter whenSelectionChangedDo: [ :selection | 
		| selectedItem |
		selectedItem := selection selectedItem.
		diffPresenter
			leftText: selectedItem mutant originalMethod ast formattedCode;
			rightText: selectedItem mutant modifiedSource;
			contextClass: selectedItem mutant originalClass ]
]

{ #category : #layout }
MutationResultsPresenter >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		add: tablePresenter;
		add: diffPresenter;
		yourself
]

{ #category : #initialization }
MutationResultsPresenter >> initializePresenters [

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
MutationResultsPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self class title;
		initialExtent: self class initialExtent
]
