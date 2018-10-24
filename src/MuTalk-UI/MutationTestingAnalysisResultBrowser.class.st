Class {
	#name : #MutationTestingAnalysisResultBrowser,
	#superclass : #Object,
	#instVars : [
		'result',
		'aliveMutantSelected',
		'killedMutantSelected',
		'analysis',
		'aliveMutantClassFilter',
		'aliveMutantOperatorFilter',
		'killedMutantClassFilter',
		'killedMutantOperatorFilter',
		'aliveMutantList',
		'killedMutantList'
	],
	#category : 'MuTalk-UI'
}

{ #category : #'instance creation' }
MutationTestingAnalysisResultBrowser class >> for: mutationAnalysis [ 
	^self new initializeFor: mutationAnalysis
]

{ #category : #'instance creation' }
MutationTestingAnalysisResultBrowser class >> openOn: mutationAnalysis [
	ToolBuilder open: (MutationTestingAnalysisResultBrowser for: mutationAnalysis) 
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> aliveMutantList [
	^(aliveMutantList asArray sort: [ :a :b | a printString <= b printString ]) 
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> aliveMutantListMenu: aMenu [ 
	| menu |
	menu := aMenu
		title: 'Alive Mutants';
		yourself.
	^ menu
		add: 'Filter Class...' action: #filterClassFromAliveMutants;
		add: 'Filter Operator...' action: #filterOperatorFromAliveMutants;
		addLine;
		add: 'Remove Filters' action: #removeFiltersFromAliveMutants;
		addLine;
		add: 'Refresh' action: #updateAliveMutantList;
		yourself.
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> aliveMutantSelected [
	^ self aliveMutantList indexOf: aliveMutantSelected
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> aliveMutantSelected: anInteger [ 
	aliveMutantSelected := self aliveMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #aliveMutantSelected.
	aliveMutantSelected ifNotNil: [ MutationBrowser openOn: aliveMutantSelected]
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> aliveMutantsClassesList [
	^ (result aliveMutants collect: [ :mutantResult | mutantResult mutant originalClass name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> aliveMutantsOperatorsList [
	^ (result aliveMutants collect: [ :mutantResult | mutantResult mutant operator description]) asSet asSortedCollection: [ :a :b | a <= b ]
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buildAliveMutantsListWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		name: 'Alive Mutant List';
		list: #aliveMutantList; 
		menu: #aliveMutantListMenu:;
		getIndex: #aliveMutantSelected; 
		setIndex: #aliveMutantSelected:;
		icon: #getIconFor:;
		yourself.
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buildButtonsWith: aBuilder [
	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (self buttons collect: [ :each |
			aBuilder pluggableButtonSpec new
				model: self; 
				label: each first;
				action: each second;
				yourself ]);
		yourself.
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buildElapsedTimeWith: aBuilder [
	^ aBuilder pluggableInputFieldSpec new
		model: self;
		getText: #elapsedTimeText;
		yourself.
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buildKilledMutantsListWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		name: 'Killed Mutant List';
		list: #killedMutantList; 
		menu: #killedMutantListMenu:;
		getIndex: #killedMutantSelected; 
		setIndex: #killedMutantSelected:;
		icon: #getIconFor:;
		yourself.
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buildStatusWith: aBuilder [
	^ aBuilder pluggableInputFieldSpec new
		model: self;
		color: #statusColor;
		getText: #statusText;
		yourself.
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buildWith: aBuilder [ 
	| window |
	window := aBuilder pluggableWindowSpec new model: self;
				 label: self label;
				 extent: self extent;
				 children: (OrderedCollection new 
					 add: ((self buildStatusWith: aBuilder)
						frame: (0.0 @ 0.0 corner: 1.0 @ 0.08);
						 yourself);
					 add: ((self buildAliveMutantsListWith: aBuilder)
						frame: (0.0 @ 0.08 corner: 1.0 @ 0.6);
						 yourself);
					 add: ((self buildKilledMutantsListWith: aBuilder)
						frame: (0.0 @ 0.6 corner: 1.0 @ 0.85);
						 yourself);
					 add: ((self buildElapsedTimeWith: aBuilder)
						frame: (0.0 @ 0.85 corner: 0.7 @ 1);
						 yourself);
					 add: ((self buildButtonsWith: aBuilder)
						frame: (0.7 @ 0.85 corner: 1.0 @ 1.0);
						 yourself);
					 yourself);
				 yourself.
	^ aBuilder build: window
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> buttons [
	^ #(( 'Inspect' #inspectResult ) ( 'Re-Run' #reRun ))
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> elapsedTimeText [
	^ 'Elapsed Time: ', self result elapsedTime printString
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> extent [
	^500 @ 480
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filter: aList with: classFilter and: mutantFilter [ 
	| allElementsFiltered |
	allElementsFiltered := aList
				select: [:mutantResult | (classFilter isNil
							or: [mutantResult mutant originalClass name = classFilter])
						and: [mutantFilter isNil
								or: [mutantResult mutant operator description = mutantFilter]]].
	^ allElementsFiltered asArray
		sort: [:a :b | a printString <= b printString]
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterAliveMutantsList [
	^self filter: result aliveMutants with: aliveMutantClassFilter and: aliveMutantOperatorFilter

]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterClassFrom: aList [
	| pattern |

	pattern := UIManager default chooseFrom: aList asArray message: 'Filter mutants of classes:'.
	^(pattern isNil
			or: [pattern = 0])
		ifTrue: [nil]
		ifFalse: [aList at: pattern].
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterClassFromAliveMutants [
	aliveMutantClassFilter := self filterClassFrom: self aliveMutantsClassesList.
	self updateAliveMutantList
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterClassFromKilledMutants [
	killedMutantClassFilter := self filterClassFrom: self killedMutantsClassesList.
	self updateKilledMutantList
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterKilledMutantsList [
	^self filter: result killedOrTerminatedMutants with: killedMutantClassFilter and: killedMutantOperatorFilter
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterOperatorFrom: aList [
	| pattern  |

	pattern := UIManager default chooseFrom: aList asArray message: 'Filter mutants of operators:'.
	^(pattern isNil
			or: [pattern = 0])
		ifTrue: [nil]
		ifFalse: [aList at: pattern].
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterOperatorFromAliveMutants [
	aliveMutantOperatorFilter := self filterOperatorFrom: self aliveMutantsOperatorsList.
	self updateAliveMutantList
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> filterOperatorFromKilledMutants [
	killedMutantOperatorFilter := self filterOperatorFrom: self killedMutantsOperatorsList.
	self updateKilledMutantList
]

{ #category : #building }
MutationTestingAnalysisResultBrowser >> getIconFor: aResult [
	^aResult icon
]

{ #category : #initialize }
MutationTestingAnalysisResultBrowser >> initializeFor: aMutationAnalisys [ 
	analysis := aMutationAnalisys.
	result := aMutationAnalisys generalResult.
	aliveMutantList := result aliveMutants.
	killedMutantList := result killedOrTerminatedMutants.
	self refresh
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> inspectResult [
	^ self result inspect.
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> killedMutantList [
	^killedMutantList
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> killedMutantListMenu: aMenu [ 
	| menu |
	menu := aMenu
		title: 'Killed Mutants';
		yourself.
	^ menu
		add: 'Filter Class...' action: #filterClassFromKilledMutants;
		add: 'Filter Operator...' action: #filterOperatorFromKilledMutants;
		addLine;
		add: 'Remove Filters' action: #removeFiltersFromKilledMutants;
		addLine;
		add: 'Refresh' action: #updateKilledMutantList;
		yourself.
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> killedMutantSelected [
	^ self killedMutantList indexOf: killedMutantSelected
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> killedMutantSelected: anInteger [ 
	killedMutantSelected := self killedMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #killedMutantSelected.
	killedMutantSelected ifNotNil: [MutationBrowser openOn: killedMutantSelected]
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> killedMutantsClassesList [
	^ (result killedOrTerminatedMutants collect: [ :mutantResult | mutantResult mutant originalClass name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> killedMutantsOperatorsList [
	^ (result killedOrTerminatedMutants collect: [ :mutantResult | mutantResult mutant operator description]) asSet asSortedCollection: [ :a :b | a <= b ]
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> label [
	^'Mutation Testing Analysis Result'
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> reRun [
	analysis run.
	result := analysis generalResult.
	aliveMutantList := result aliveMutants.
	killedMutantList := result killedOrTerminatedMutants.
	self refresh.
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> refresh [

	self changed: #aliveMutantList; changed: #elapsedTimeText; changed: #killedMutantList; changed: #statusColor.
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> removeFiltersFromAliveMutants [
	aliveMutantClassFilter := nil.
	aliveMutantOperatorFilter := nil.
	self updateAliveMutantList
]

{ #category : #filtering }
MutationTestingAnalysisResultBrowser >> removeFiltersFromKilledMutants [
	killedMutantClassFilter := nil.
	killedMutantOperatorFilter := nil.
	self updateKilledMutantList
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> result [
	^result
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> statusColor [
	self result isAcceptableScore ifTrue: [ ^ Color green ].
	self result isNonAcceptableScore ifTrue: [ ^ Color red ].
	^ Color yellow
]

{ #category : #accessing }
MutationTestingAnalysisResultBrowser >> statusText [
	^ self result printString.
]

{ #category : #updating }
MutationTestingAnalysisResultBrowser >> updateAliveMutantList [
	aliveMutantList := self filterAliveMutantsList.
	aliveMutantSelected := nil.
	self
		changed: #aliveMutantList;
		changed: #aliveMutantSelected
]

{ #category : #updating }
MutationTestingAnalysisResultBrowser >> updateKilledMutantList [
	killedMutantList := self filterKilledMutantsList.
	killedMutantSelected := nil.
	self
		changed: #killedMutantList;
		changed: #killedMutantSelected
]
