Class {
	#name : #MutationTestRunner,
	#superclass : #Object,
	#instVars : [
		'classes',
		'classesSelected',
		'testClasses',
		'testClassesSelected',
		'result',
		'mutationOperators',
		'mutationOperatorsSelected',
		'killedMutantList',
		'killedMutantSelected',
		'aliveMutantList',
		'aliveMutantSelected',
		'categories',
		'categoriesSelected',
		'aliveMutantClassFilter',
		'aliveMutantOperatorFilter',
		'killedMutantClassFilter',
		'killedMutantOperatorFilter',
		'loggingActivated'
	],
	#category : 'MuTalk-UI'
}

{ #category : #'instance-creation' }
MutationTestRunner class >> build [
	^ ToolBuilder build: self new.
]

{ #category : #initialization }
MutationTestRunner class >> initialize [
	self registerInToolsFlap.
]

{ #category : #'as yet unclassified' }
MutationTestRunner class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	(aBuilder item: #'Mutation Testing')
			parent: #Tools;
			action:[self open]; 
			help: 'Mutation Testing Runner'.
]

{ #category : #'instance-creation' }
MutationTestRunner class >> open [
	^ ToolBuilder open: self new.
]

{ #category : #initialization }
MutationTestRunner class >> registerInToolsFlap [
	self environment at: #Flaps ifPresent: [ :class |
		class
			registerQuad: #( MutationTestRunner build 'Mutation Testing Runner' 'mutation testing runner.' ) forFlapNamed: 'Tools';
			replaceToolsFlap ].
]

{ #category : #initialization }
MutationTestRunner class >> unload [

	self environment at: #Flaps ifPresent: [:cl | cl unregisterQuadsWithReceiver: self]. 
	TheWorldMenu unregisterOpenCommandWithReceiver: self.

]

{ #category : #actions }
MutationTestRunner >> activateLogging [
	loggingActivated := loggingActivated not.
	self changed: #loggingActivatedMark 
]

{ #category : #'accessing-testing' }
MutationTestRunner >> aliveMutantList [
	^ aliveMutantList
]

{ #category : #'accessing-testing' }
MutationTestRunner >> aliveMutantListMenu: aMenu [ 
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

{ #category : #'accessing-testing' }
MutationTestRunner >> aliveMutantSelected [
	^ aliveMutantList indexOf: aliveMutantSelected
]

{ #category : #'accessing-testing' }
MutationTestRunner >> aliveMutantSelected: anInteger [ 
	aliveMutantSelected := aliveMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #aliveMutantSelected.
	aliveMutantSelected ifNotNil: [ MutationBrowser openOn: aliveMutantSelected]
]

{ #category : #'accessing-testing' }
MutationTestRunner >> aliveMutantsClassesList [
	^ (result aliveMutants collect: [ :mutantResult | mutantResult mutant originalClass name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #'accessing-testing' }
MutationTestRunner >> aliveMutantsOperatorsList [
	^ (result aliveMutants collect: [ :mutantResult | mutantResult mutant operator description]) asSet asSortedCollection: [ :a :b | a <= b ]
]

{ #category : #private }
MutationTestRunner >> browserEnvironment [
	^ Smalltalk classNamed: #BrowserEnvironment.
]

{ #category : #building }
MutationTestRunner >> buildAliveMutantsListWith: aBuilder [
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
MutationTestRunner >> buildButtonsWith: aBuilder [
	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (self buttons collect: [ :each |
			aBuilder pluggableButtonSpec new
				model: self; 
				label: each first;
				action: each second;
				enabled: each third;
				yourself ]);
		yourself.
]

{ #category : #building }
MutationTestRunner >> buildCategoriesWith: aBuilder [ 
	^ aBuilder pluggableMultiSelectionListSpec new model: self;
		 list: #categoryList;
		 menu: #categoryMenu:;
		 getIndex: #categorySelected;
		 setIndex: #categorySelected:;
		 getSelectionList: #categoryAt:;
		 setSelectionList: #categoryAt:put:;
		 yourself
]

{ #category : #building }
MutationTestRunner >> buildClassesWith: aBuilder [
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
]

{ #category : #building }
MutationTestRunner >> buildElapsedTimeWith: aBuilder [
	^ aBuilder pluggableInputFieldSpec new
		model: self;
		getText: #elapsedTimeText;
		yourself.
]

{ #category : #building }
MutationTestRunner >> buildKilledMutantsListWith: aBuilder [
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
MutationTestRunner >> buildLogCheckBoxWith: aBuilder [
	^aBuilder pluggableButtonSpec new
				model: self; 
				help: 'Activate Logging to File';
				label: #loggingActivatedMark;
				action: #activateLogging;
				enabled: true;
				yourself.
]

{ #category : #building }
MutationTestRunner >> buildLogTextBoxWith: aBuilder [
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #loggingText;
		"action: #activateLogging;"
		yourself.
]

{ #category : #building }
MutationTestRunner >> buildMutationOperatorsWith: aBuilder [
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
]

{ #category : #building }
MutationTestRunner >> buildStatusWith: aBuilder [
	^ aBuilder pluggableInputFieldSpec new
		model: self;
		color: #statusColor;
		getText: #statusText;
		yourself.
]

{ #category : #building }
MutationTestRunner >> buildTestClassesWith: aBuilder [
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
]

{ #category : #building }
MutationTestRunner >> buildWith: aBuilder [ 
	| window |
	window := aBuilder pluggableWindowSpec new model: self;
				 label: self label;
				 extent: self extent;
				 children: (OrderedCollection new add: ((self buildCategoriesWith: aBuilder)
						frame: (0.0 @ 0.0 corner: 0.2 @ 0.90);
						 yourself);
					 add: ((self buildClassesWith: aBuilder)
						frame: (0.2 @ 0.0 corner: 0.4 @ 0.90);
						 yourself);
					 add: ((self buildTestClassesWith: aBuilder)
						frame: (0.4 @ 0.0 corner: 0.6 @ 0.90);
						 yourself);
					 add: ((self buildMutationOperatorsWith: aBuilder)
						frame: (0.6 @ 0.0 corner: 0.75 @ 0.90);
						 yourself);
					 add: ((self buildStatusWith: aBuilder)
						frame: (0.75 @ 0.0 corner: 1.0 @ 0.08);
						 yourself);
					 add: ((self buildAliveMutantsListWith: aBuilder)
						frame: (0.75 @ 0.08 corner: 1.0 @ 0.55);
						 yourself);
					 add: ((self buildKilledMutantsListWith: aBuilder)
						frame: (0.75 @ 0.55 corner: 1.0 @ 0.80);
						 yourself);
					 add: ((self buildElapsedTimeWith: aBuilder)
						frame: (0.75 @ 0.80 corner: 1.0 @ 0.85);
						 yourself);
					 add: ((self buildLogCheckBoxWith: aBuilder)
						frame: (0.75 @ 0.85 corner: 0.80 @ 0.90);
						 yourself);
					 add: ((self buildLogTextBoxWith: aBuilder)
						frame: (0.80 @ 0.85 corner: 1.0 @ 0.90);
						 yourself);
					 add: ((self buildButtonsWith: aBuilder)
						frame: (0.0 @ 0.90 corner: 1.0 @ 1.0);
						 yourself);
					
					 yourself);
				 yourself.
	^ aBuilder build: window
]

{ #category : #'accessing-ui' }
MutationTestRunner >> buttons [
	^ #(( 'Mutate All, Run All' #runAllMutantAndAllTests #hasRunnable )
		( 'Mutate All, Run Covering' #runAllMutantAndCoveredTests #hasRunnable )
		( 'Mutate Covered, Run All' #runCoveredMutantAndAllTests #hasRunnable )
		( 'Mutate Covered, Run Covering' #runCoveredMutantAndCoveredTests #hasRunnable )).
]

{ #category : #'accesing-category' }
MutationTestRunner >> categoryAt: anIndex [
	^ categoriesSelected includes: (categories at: anIndex ifAbsent: [ ^ false ]).
]

{ #category : #'accesing-category' }
MutationTestRunner >> categoryAt: anInteger put: aBoolean [ 
	categoriesSelected := categoriesSelected
				perform: (aBoolean
						ifTrue: [#copyWith:]
						ifFalse: [#copyWithout:])
				with: (categories
						at: anInteger
						ifAbsent: [^ self]).
	self changed: #categorySelected;
		 updateClasses;
		 updateTestClasses
]

{ #category : #'accesing-category' }
MutationTestRunner >> categoryList [
	^ categories
]

{ #category : #'accesing-category' }
MutationTestRunner >> categoryMenu: aMenu [
	^ aMenu
		title: 'Categories';
		add: 'Select all' action: #selectAllCategories;
		add: 'Select inversion' action: #selectInverseCategories;
		add: 'Select none' action: #selectNoCategories;
		addLine;
		add: 'Filter...' action: #filterCategories;
		addLine;
		add: 'Refresh' action: #updateCategories;
		yourself.
]

{ #category : #'accesing-category' }
MutationTestRunner >> categorySelected [
	^ 0
]

{ #category : #'accesing-category' }
MutationTestRunner >> categorySelected: anInteger [
	self changed: #categorySelected.
]

{ #category : #'accessing-classes' }
MutationTestRunner >> classAt: anInteger [
	^ classesSelected includes: (classes at: anInteger ifAbsent: [ ^ false ]).
]

{ #category : #'accessing-classes' }
MutationTestRunner >> classAt: anInteger put: aBoolean [ 
	classesSelected := classesSelected
				perform: (aBoolean
						ifTrue: [#copyWith:]
						ifFalse: [#copyWithout:])
				with: (classes
						at: anInteger
						ifAbsent: [^ self]).
	self changed: #classSelected;
		 changed: #hasRunnable.

]

{ #category : #'accessing-classes' }
MutationTestRunner >> classList [
	| offset ident |
	classes isEmpty ifTrue: [ ^ classes ].
	offset := classes first allSuperclasses size.
	^ classes collect: [ :each |
		ident := String 
			new: 2 * (0 max: each allSuperclasses size - offset) 
			withAll: $ .
		ident , each name].
]

{ #category : #'accessing-classes' }
MutationTestRunner >> classMenu: aMenu [
	| menu |
	menu := aMenu
		title: 'Classes';
		yourself.
	^ menu
		add: 'Select all' action: #selectAllClasses;
		add: 'Select inversion' action: #selectInverseClasses;
		add: 'Select none' action: #selectNoClasses;
		addLine;
		add: 'Filter...' action: #filterClasses;
		addLine;
		add: 'Refresh' action: #updateClasses;
		yourself.
]

{ #category : #'accessing-classes' }
MutationTestRunner >> classSelected [
	^ 0
]

{ #category : #'accessing-classes' }
MutationTestRunner >> classSelected: anInteger [
	self changed: #classSelected.
]

{ #category : #private }
MutationTestRunner >> defaultBackgroundColor [
	
	^ Color blue.
]

{ #category : #'accessing-testing' }
MutationTestRunner >> elapsedTimeText [
	^ 'Elapsed Time: ', result elapsedTime printString
]

{ #category : #'accessing-ui' }
MutationTestRunner >> extent [
	^ 640 @ 480
]

{ #category : #filtering }
MutationTestRunner >> filter: aList with: classFilter and: mutantFilter [ 
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
MutationTestRunner >> filterAliveMutantsList [
	^self filter: result aliveMutants with: aliveMutantClassFilter and: aliveMutantOperatorFilter

]

{ #category : #filtering }
MutationTestRunner >> filterCategories [
	| pattern |
	pattern := UIManager default 
		request: 'Pattern to select categories:' 
		initialAnswer: '*'.
	pattern isNil ifTrue: [ ^ self ].
	categoriesSelected := (categories 
		select: [ :each | pattern match: each ]) asSet.
	self changed: #allSelections; changed: #categorySelected; updateClasses.
]

{ #category : #filtering }
MutationTestRunner >> filterClassFrom: aList [
	| pattern |

	pattern := UIManager default chooseFrom: aList asArray message: 'Filter mutants of classes:'.
	^(pattern isNil
			or: [pattern = 0])
		ifTrue: [nil]
		ifFalse: [aList at: pattern].
]

{ #category : #filtering }
MutationTestRunner >> filterClassFromAliveMutants [
	aliveMutantClassFilter := self filterClassFrom: self aliveMutantsClassesList.
	self updateAliveMutantList
]

{ #category : #filtering }
MutationTestRunner >> filterClassFromKilledMutants [
	killedMutantClassFilter := self filterClassFrom: self killedMutantsClassesList.
	self updateKilledMutantList
]

{ #category : #filtering }
MutationTestRunner >> filterClasses [
	| pattern |
	pattern := UIManager default 
		request: 'Pattern to select Class:' 
		initialAnswer: '*'.
	pattern isNil ifTrue: [ ^ self ].
	classesSelected := (classes select: [ :each | 
		pattern match: each name ]) asSet.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.
]

{ #category : #filtering }
MutationTestRunner >> filterKilledMutantsList [
	^self filter: result killedOrTerminatedMutants with: killedMutantClassFilter and: killedMutantOperatorFilter
]

{ #category : #filtering }
MutationTestRunner >> filterOperatorFrom: aList [
	| pattern  |

	pattern := UIManager default chooseFrom: aList asArray message: 'Filter mutants of operators:'.
	^(pattern isNil
			or: [pattern = 0])
		ifTrue: [nil]
		ifFalse: [aList at: pattern].
]

{ #category : #filtering }
MutationTestRunner >> filterOperatorFromAliveMutants [
	aliveMutantOperatorFilter := self filterOperatorFrom: self aliveMutantsOperatorsList.
	self updateAliveMutantList
]

{ #category : #filtering }
MutationTestRunner >> filterOperatorFromKilledMutants [
	killedMutantOperatorFilter := self filterOperatorFrom: self killedMutantsOperatorsList.
	self updateKilledMutantList
]

{ #category : #filtering }
MutationTestRunner >> filterTestClasses [
	| pattern |
	pattern := UIManager default 
		request: 'Pattern to select tests classes:' 
		initialAnswer: '*'.
	pattern isNil ifTrue: [ ^ self ].
	testClassesSelected := (testClasses select: [ :each | 
		pattern match: each name ]) asSet.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.
]

{ #category : #updating }
MutationTestRunner >> findCategories [
	^ Array
		streamContents: [:stream | Smalltalk organization categories
				do: [:each | stream nextPut: each]]
]

{ #category : #updating }
MutationTestRunner >> findClassesForCategories: aCollection [

	| theCategories items |

	theCategories := aCollection isEmpty
		ifTrue: [ categories ]
		ifFalse: [ aCollection ].

	items := theCategories gather: [ :category |
		((Smalltalk organization listAtCategoryNamed: category)
			collect: [ :each | Smalltalk at: each ])
			select: [ :each | (self testBaseClasses anySatisfy: [ :bc | each includesBehavior: bc ]) not ] ].

	^items asSet.
]

{ #category : #updating }
MutationTestRunner >> findMutationOperators [
	^ MutantOperator contents
]

{ #category : #utilities }
MutationTestRunner >> findTestClass [
	"Let the user search for a test class in the system. Answer the class or nil."
	
	| pattern class |
	pattern := UIManager default request: 'Class name or fragment?'.
	class := Utilities classFromPattern: pattern withCaption: 'Select a class:'.
	class ifNil: [^ nil].

	^ (class inheritsFrom: TestCase)
		ifTrue: class
		ifFalse: [Smalltalk at: (class name, 'Test') asSymbol ifAbsent: nil].
	

]

{ #category : #updating }
MutationTestRunner >> findTestClassesForCategories: aCollection [ 

	| theCategories items |

	theCategories := aCollection isEmpty
		ifTrue: [ categories ]
		ifFalse: [ aCollection ].

	items := theCategories gather: [ :category |
		((Smalltalk organization listAtCategoryNamed: category)
			collect: [ :each | Smalltalk at: each ])
			select: [ :each | self testBaseClasses anySatisfy: [ :bc | each includesBehavior: bc ] ] ].

	^items asSet.
]

{ #category : #'accessing-testing' }
MutationTestRunner >> getIconFor: aResult [
	^aResult icon
]

{ #category : #testing }
MutationTestRunner >> hasRunnable [
	^ classesSelected notEmpty
		and: [testClassesSelected notEmpty
				and: [mutationOperatorsSelected notEmpty]]
]

{ #category : #initialization }
MutationTestRunner >> initialize [
	super initialize.
	killedMutantList := aliveMutantList := Array new.
	loggingActivated := false.
	SystemChangeNotifier uniqueInstance
		notify: self
			ofSystemChangesOfItem: #class
			change: #Added
			using: #update;
		notify: self
			ofSystemChangesOfItem: #class
			change: #Removed
			using: #update;
		notify: self
			ofSystemChangesOfItem: #class
			change: #Renamed
			using: #update;
		notify: self
			ofSystemChangesOfItem: #class
			change: #Recategorized
			using: #update.
	self
		update;
		reset
]

{ #category : #utilities }
MutationTestRunner >> keyPressed: aKey [
	| class |
	aKey = $f
		ifTrue: [	
				class := self findTestClass.
				class ifNil: [^ self].
				self selectClass: class.
			]
]

{ #category : #'accessing-testing' }
MutationTestRunner >> killedMutantList [
	^ killedMutantList
]

{ #category : #'accessing-testing' }
MutationTestRunner >> killedMutantListMenu: aMenu [ 
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

{ #category : #'accessing-testing' }
MutationTestRunner >> killedMutantSelected [
	^ killedMutantList indexOf: killedMutantSelected
]

{ #category : #'accessing-testing' }
MutationTestRunner >> killedMutantSelected: anInteger [ 
	killedMutantSelected := killedMutantList 
		at: anInteger
		ifAbsent: nil.
	self changed: #killedMutantSelected.
	killedMutantSelected ifNotNil: [MutationBrowser openOn: killedMutantSelected]
]

{ #category : #'accessing-testing' }
MutationTestRunner >> killedMutantsClassesList [
	^ (result killedOrTerminatedMutants collect: [ :mutantResult | mutantResult mutant originalClass name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #'accessing-testing' }
MutationTestRunner >> killedMutantsOperatorsList [
	^ (result killedOrTerminatedMutants collect: [ :mutantResult | mutantResult mutant operator description]) asSet asSortedCollection: [ :a :b | a <= b ]
]

{ #category : #'accessing-ui' }
MutationTestRunner >> label [
	^ 'Mutation Testing Runner' 
]

{ #category : #private }
MutationTestRunner >> label: aString forSuite: aTestSuite [
	^ String streamContents: [ :stream |
		stream nextPutAll: 'Running '; print: aTestSuite tests size; space; nextPutAll: aString.
		aTestSuite tests size > 1 ifTrue: [ stream nextPut: $s ] ]. 
]

{ #category : #private }
MutationTestRunner >> logger [
	^ loggingActivated 
		ifTrue: 
			[ MutationTestingAnalysisFileLogger toFileNamed: 'MutationTestingLog.txt' ]
		ifFalse: [ NullMutationTestingAnalysisLogger new ]
]

{ #category : #'accessing-ui' }
MutationTestRunner >> loggingActivatedMark [
	^ loggingActivated
		ifTrue: ['x']
		ifFalse: ['']
]

{ #category : #'accessing-ui' }
MutationTestRunner >> loggingText [
	^ 'Active Log'
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> mutationOperatorsAt: anInteger [ 

	^ mutationOperatorsSelected includes: (mutationOperators at: anInteger ifAbsent: [ ^ false ]).
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> mutationOperatorsAt: anInteger put: aBoolean [ 
	mutationOperatorsSelected := mutationOperatorsSelected
				perform: (aBoolean
						ifTrue: [#copyWith:]
						ifFalse: [#copyWithout:])
				with: (mutationOperators
						at: anInteger
						ifAbsent: [^ self]).
	self changed: #mutationOperatorsSelected;
		 changed: #hasRunnable
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> mutationOperatorsList [
	mutationOperators isEmpty ifTrue: [ ^ mutationOperators ].
	^ mutationOperators collect: [ :each |
		 each description ].
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> mutationOperatorsMenu: aMenu [ 
	| menu |
	menu := aMenu
		title: ' Mutation Operators';
		yourself.
	^ menu
		add: 'Select all' action: #selectAllMutationOperators;
		add: 'Select inversion' action: #selectInverseMutationOperators;
		add: 'Select none' action: #selectNoMutationOperators;
		addLine;
		add: 'Refresh' action: #updateMutationOperators;
		yourself.
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> mutationOperatorsSelected [
	^ 0
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> mutationOperatorsSelected: aInteger [ 
	self changed: #mutationOperatorsSelected.
]

{ #category : #private }
MutationTestRunner >> perform: selector orSendTo: otherTarget [
	
	^ (self respondsTo: selector)
		ifTrue: [ self perform: selector ]
		ifFalse: [ super perform: selector orSendTo: otherTarget ].
]

{ #category : #filtering }
MutationTestRunner >> removeFiltersFromAliveMutants [
	aliveMutantClassFilter := nil.
	aliveMutantOperatorFilter := nil.
	self updateAliveMutantList
]

{ #category : #filtering }
MutationTestRunner >> removeFiltersFromKilledMutants [
	killedMutantClassFilter := nil.
	killedMutantOperatorFilter := nil.
	self updateKilledMutantList
]

{ #category : #actions }
MutationTestRunner >> reset [
	self result: MutationTestingGeneralResult empty;
		 updateResults
]

{ #category : #'accessing-testing' }
MutationTestRunner >> result [
	^ result
]

{ #category : #'accessing-testing' }
MutationTestRunner >> result: aResult [
	result := aResult
]

{ #category : #actions }
MutationTestRunner >> runAllMutantAndAllTests [
	self reset; runSuite: self suiteAllMutantAndAllTests.
]

{ #category : #actions }
MutationTestRunner >> runAllMutantAndCoveredTests [
	self reset; runSuite: self suiteAllMutantAndCoveredTests.
]

{ #category : #actions }
MutationTestRunner >> runCoveredMutantAndAllTests [
	self reset; runSuite: self suiteCoveredMutantAndAllTests.
]

{ #category : #actions }
MutationTestRunner >> runCoveredMutantAndCoveredTests [
	self reset; runSuite: self suiteCoveredMutantAndCoveredTests.
]

{ #category : #actions }
MutationTestRunner >> runSuite: aMutationTestAnalisys [ 
	
	aMutationTestAnalisys run.
	self result: aMutationTestAnalisys generalResult.
	self updateResults
]

{ #category : #'accesing-category' }
MutationTestRunner >> selectAllCategories [
	categoriesSelected := categories asSet.
	self changed: #allSelections; changed: #categorySelected; updateClasses.
]

{ #category : #'accessing-classes' }
MutationTestRunner >> selectAllClasses [
	classesSelected := classes asSet.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> selectAllMutationOperators [
	mutationOperatorsSelected := mutationOperators asSet.
	self changed: #allSelections; changed: #mutationOperatorsSelected; changed: #hasRunnable.
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> selectAllTestClasses [
	testClassesSelected := testClasses asSet.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.
]

{ #category : #'accessing-classes' }
MutationTestRunner >> selectClass: aClass [
	self classAt: (classes indexOf: aClass) put: true.
]

{ #category : #'accesing-category' }
MutationTestRunner >> selectInverseCategories [
	categoriesSelected := categories asSet 
		removeAll: categoriesSelected;
		yourself.
	self changed: #allSelections; changed: #categorySelected; updateClasses.
]

{ #category : #'accessing-classes' }
MutationTestRunner >> selectInverseClasses [
	classesSelected := classes asSet 
		removeAll: classesSelected;
		yourself.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> selectInverseMutationOperators [
	mutationOperatorsSelected := mutationOperators asSet 
		removeAll: mutationOperatorsSelected;
		yourself.
	self changed: #allSelections; changed: #mutationOperatorsSelected; changed: #hasRunnable.
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> selectInverseTestClasses [
	testClassesSelected := testClasses asSet 
		removeAll: testClassesSelected;
		yourself.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.
]

{ #category : #'accesing-category' }
MutationTestRunner >> selectNoCategories [
	categoriesSelected := Set new.
	self changed: #allSelections; changed: #categorySelected;
		 updateClasses
]

{ #category : #'accessing-classes' }
MutationTestRunner >> selectNoClasses [
	classesSelected := Set new.
	self changed: #allSelections; changed: #classSelected; changed: #hasRunnable.
]

{ #category : #'accessing-mutationOperators' }
MutationTestRunner >> selectNoMutationOperators [
	mutationOperatorsSelected := Set new.
	self changed: #allSelections; changed: #mutationOperatorsSelected; changed: #hasRunnable.
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> selectNoTestClasses [
	testClassesSelected := Set new.
	self changed: #allSelections; changed: #testClassSelected; changed: #hasRunnable.
]

{ #category : #utilities }
MutationTestRunner >> sortClass: aFirstClass before: aSecondClass [
	| first second |
	first := aFirstClass withAllSuperclasses reversed.
	second := aSecondClass withAllSuperclasses reversed.
	1 to: (first size min: second size) do: [ :index | 
		(first at: index) == (second at: index)
			ifFalse: [ ^ (first at: index) name <= (second at: index) name ] ].
	^ second includes: aFirstClass.
]

{ #category : #'accessing-testing' }
MutationTestRunner >> statusColor [

	^result mutationScoreModel color
]

{ #category : #'accessing-testing' }
MutationTestRunner >> statusText [
	^ result printString.
]

{ #category : #private }
MutationTestRunner >> suiteAllMutantAndAllTests [
	^ MutationTestingAnalysis
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: AllTestsMethodsRunningMutantEvaluationStrategy new
		loggingIn: self logger
]

{ #category : #private }
MutationTestRunner >> suiteAllMutantAndCoveredTests [
	^ MutationTestingAnalysis
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: SelectingFromCoverageMutantEvaluationStrategy new
		loggingIn: self logger
]

{ #category : #private }
MutationTestRunner >> suiteCoveredMutantAndAllTests [
	^ MutationTestingAnalysis
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: AllTestsMethodsRunningMutantEvaluationStrategy new
		with: SelectingFromCoverageMutationsGenerationStrategy new
		loggingIn: self logger
]

{ #category : #private }
MutationTestRunner >> suiteCoveredMutantAndCoveredTests [
	^ MutationTestingAnalysis 
		testCasesFrom: testClassesSelected
		mutating: classesSelected
		using: mutationOperatorsSelected
		with: SelectingFromCoverageMutantEvaluationStrategy new
		with: SelectingFromCoverageMutationsGenerationStrategy new
		loggingIn: self logger
]

{ #category : #'accesing-category' }
MutationTestRunner >> testBaseClasses [
	^Array with: TestCase with: TestResource
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> testClassAt: anInteger [

	^ testClassesSelected includes: (testClasses at: anInteger ifAbsent: [ ^ false ]).
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> testClassAt: anInteger put: aBoolean [ 

	testClassesSelected := testClassesSelected
				perform: (aBoolean
						ifTrue: [#copyWith:]
						ifFalse: [#copyWithout:])
				with: (testClasses
						at: anInteger
						ifAbsent: [^ self]).
	self changed: #testClassSelected;
		 changed: #hasRunnable.
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> testClassList [
	| offset ident |
	testClasses isEmpty ifTrue: [ ^ testClasses ].
	offset := testClasses first allSuperclasses size.
	^ testClasses collect: [ :each |
		ident := String 
			new: 2 * (0 max: each allSuperclasses size - offset) 
			withAll: $ .
		ident , each name].
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> testClassMenu: aMenu [ 
	| menu |
	menu := aMenu
		title: ' Test Classes';
		yourself.
	^ menu
		add: 'Select all' action: #selectAllTestClasses;
		add: 'Select inversion' action: #selectInverseTestClasses;
		add: 'Select none' action: #selectNoTestClasses;
		addLine;
		add: 'Filter...' action: #filterTestClasses;
		addLine;
		add: 'Refresh' action: #updateTestClasses;
		yourself.
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> testClassSelected [
	^ 0
]

{ #category : #'accessing-testClasses' }
MutationTestRunner >> testClassSelected: aInteger [ 
	self changed: #testClassSelected.
]

{ #category : #updating }
MutationTestRunner >> update [
	self updateCategories; updateClasses; updateTestClasses; updateMutationOperators.
]

{ #category : #updating }
MutationTestRunner >> updateAliveMutantList [
	aliveMutantList := self filterAliveMutantsList.
	aliveMutantSelected := nil.
	self
		changed: #allSelections;
		changed: #aliveMutantList;
		changed: #aliveMutantSelected
]

{ #category : #updating }
MutationTestRunner >> updateCategories [
	categories := self findCategories.
	categoriesSelected := categoriesSelected isNil
		ifTrue: [ Set new ]
		ifFalse: [
			categoriesSelected
				select: [ :each | categories includes: each ] ].
	self changed: #allSelections; changed: #categoryList; changed: #categorySelected.
]

{ #category : #updating }
MutationTestRunner >> updateClasses [
	| classesForCategories |
	classesForCategories := self findClassesForCategories: categoriesSelected.
	classes := classesForCategories asArray
				sort: [:a :b | self sortClass: a before: b].
	classesSelected := classesSelected isNil
				ifTrue: [classesForCategories]
				ifFalse: [classesSelected
						select: [:each | classesForCategories includes: each]].
	self changed: #allSelections; 
		 changed: #classList;
		 changed: #classSelected;
		 changed: #hasRunnable
]

{ #category : #updating }
MutationTestRunner >> updateKilledMutantList [
	killedMutantList := self filterKilledMutantsList.
	killedMutantSelected := nil.
	self changed: #allSelections;
		changed: #killedMutantList;
		changed: #killedMutantSelected
]

{ #category : #updating }
MutationTestRunner >> updateMutationOperators [
	mutationOperators := self findMutationOperators.
	mutationOperatorsSelected := mutationOperatorsSelected isNil
				ifTrue: [Set new]
				ifFalse: [mutationOperatorsSelected
						select: [:each | mutationOperators includes: each]].
	self changed: #allSelections;
	     changed: #mutationOperatorsList;
		 changed: #mutationOperatorsSelected
]

{ #category : #updating }
MutationTestRunner >> updateResults [
	
	self updateStatus: false.
	killedMutantList size = result killedOrTerminatedMutants size ifFalse: [ self updateKilledMutantList ].
	aliveMutantList size = result aliveMutants size ifFalse: [ self updateAliveMutantList ].
	 
]

{ #category : #updating }
MutationTestRunner >> updateStatus: aBoolean [

	self changed: #statusText; changed: #statusColor; changed: #elapsedTimeText.
	
]

{ #category : #updating }
MutationTestRunner >> updateTestClasses [
	| testClassesForCategories |
	testClassesForCategories := self findTestClassesForCategories: categoriesSelected.
	testClasses := testClassesForCategories asArray
				sort: [:a :b | self sortClass: a before: b].
	testClassesSelected := testClassesSelected isNil
				ifTrue: [testClassesForCategories]
				ifFalse: [testClassesSelected
						select: [:each | testClassesForCategories includes: each]].
	self changed: #allSelections;
		 changed: #testClassList;
		 changed: #testClassSelected;
		 changed: #hasRunnable
]

{ #category : #private }
MutationTestRunner >> windowIsClosing [
	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self
]
