Class {
	#name : #MutationBrowser,
	#superclass : #Object,
	#instVars : [
		'particularResultsList',
		'particularResultsSelected',
		'particularResultsClassFilter',
		'mutantEvaluationResult'
	],
	#category : 'MuTalk-UI'
}

{ #category : #'instance creation' }
MutationBrowser class >> for: aMutationGeneralResut [ 
	^self new initializeFor: aMutationGeneralResut; yourself
]

{ #category : #'open/close' }
MutationBrowser class >> openOn: aMutation [ 
	"Open browser for aMutation."
	^ ToolBuilder
		open: (self for: aMutation)
]

{ #category : #building }
MutationBrowser >> buildButtonsWith: aBuilder [
	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (self buttons collect: [ :each |
			aBuilder pluggableButtonSpec new
				model: self; 
				label: each first;
				action: each second;
				enabled: true;
				yourself ]);
		yourself.
]

{ #category : #building }
MutationBrowser >> buildCodeDifferenceWith: aBuilder [ 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #codeDifference;
		menu: #textMenu:;
		yourself.
]

{ #category : #building }
MutationBrowser >> buildKillingSuggestionsWith: aBuilder [ 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #killingSuggestions;
		yourself.
]

{ #category : #building }
MutationBrowser >> buildParticularResultsWith: aBuilder [
	^ aBuilder pluggableListSpec new
		model: self;
		name: 'Test Results';
		list: #particularResultsList; 
		menu: #particularResultsListMenu:;
		getIndex: #particularResultsSelected; 
		setIndex: #particularResultsSelected:;
		icon: #getIconForResult:;
		yourself.
]

{ #category : #building }
MutationBrowser >> buildTestResultWith: aBuilder [ 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #testResults;
		yourself.
]

{ #category : #building }
MutationBrowser >> buildWith: aBuilder [ 
	| window |
	window := aBuilder pluggableWindowSpec new model: self;
				 label: self label;
				 extent: self extent;
				 children: (OrderedCollection new 
					add: ((self buildCodeDifferenceWith: aBuilder)
						frame: (0.0 @ 0.0 corner: 0.55 @ 0.6);
						 yourself);
					add: ((self buildParticularResultsWith: aBuilder)
						frame: (0.55 @ 0.0 corner: 1.0 @ 0.6);
						 yourself);
					add: ((self buildKillingSuggestionsWith: aBuilder)
						frame: (0.0 @ 0.6 corner: 1.0 @ 0.85);
						 yourself);
					add: ((self buildTestResultWith: aBuilder)
						frame: (0.0 @ 0.85 corner: 0.55 @ 1.0);
						 yourself);
	 			   add: ((self buildButtonsWith: aBuilder)
						frame: (0.55 @ 0.85 corner: 1.0 @ 1.0);
						 yourself);
					 yourself);
				 yourself.
	^ aBuilder build: window
]

{ #category : #building }
MutationBrowser >> buttons [
	^ #(( 'Details' #showDetails ) ( 'Try to kill' #tryToKill ) ( 'Open Browser' #openResultBrowser ))
]

{ #category : #accessing }
MutationBrowser >> codeDifference [
	^ TextDiffBuilder 
		buildDisplayPatchFrom: mutantEvaluationResult mutant modifiedSource
		to: mutantEvaluationResult mutant originalSource
		inClass: mutantEvaluationResult mutant originalClass
		prettyDiffs: true
]

{ #category : #accessing }
MutationBrowser >> defaultBackgroundColor [

	^ Color blue.
]

{ #category : #building }
MutationBrowser >> extent [
	^640 @ 480
]

{ #category : #filtering }
MutationBrowser >> filter: aList with: classFilter [
	| allElementsFiltered |
	allElementsFiltered := aList
				select: [:test | (classFilter isNil
							or: [test class name = classFilter])].
	^ allElementsFiltered asArray
		sort: [:a :b | a printString <= b printString]
]

{ #category : #filtering }
MutationBrowser >> filterClassFrom: aList [
	| pattern |

	pattern := UIManager default chooseFrom: aList asArray message: 'Filter test from:'.
	^(pattern isNil
			or: [pattern = 0])
		ifTrue: [nil]
		ifFalse: [aList at: pattern].
]

{ #category : #filtering }
MutationBrowser >> filterClassFromParticularResults [

	particularResultsClassFilter := self filterClassFrom: self particularResultsClassesList.
	self updateParticularResultsList
]

{ #category : #filtering }
MutationBrowser >> filterParticularResultsList [
	^ self 
		filter: mutantEvaluationResult particularResults
		with: particularResultsClassFilter
]

{ #category : #printing }
MutationBrowser >> getIconForResult: aTest [
	^ UITheme current questionIcon
]

{ #category : #printing }
MutationBrowser >> iconNameFor: aTest [ 
	| testResult |
	testResult := mutantEvaluationResult result.
	(testResult concretePassed includes: aTest) ifTrue: [ ^ #testGreen ].
	(testResult concreteFailures includes: aTest) ifTrue: [ ^ #testOrange ].
	(testResult concreteErrors includes: aTest) ifTrue: [ ^ #testRed ].
	^ #testGray
]

{ #category : #initialization }
MutationBrowser >> initializeFor: aMutantEvaluation [ 
	mutantEvaluationResult := aMutantEvaluation.
	particularResultsList := Array new.
	self updateParticularResultsList
]

{ #category : #accessing }
MutationBrowser >> killingSuggestions [
	^ mutantEvaluationResult killingSuggestions
]

{ #category : #building }
MutationBrowser >> label [
	^'Mutation Result Browser'
]

{ #category : #opening }
MutationBrowser >> openMutatedMethodBrowser [
	mutantEvaluationResult openMutatedMethodBrowser
]

{ #category : #opening }
MutationBrowser >> openResultBrowser [
	mutantEvaluationResult openResultBrowser
]

{ #category : #'accessing-particularResults' }
MutationBrowser >> particularResultsClassesList [
	^ (mutantEvaluationResult particularResults collect: [ :test | test class name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #'accessing-particularResults' }
MutationBrowser >> particularResultsList [

 	^particularResultsList
]

{ #category : #'accessing-particularResults' }
MutationBrowser >> particularResultsListMenu: aMenu [
	| menu |
	menu := aMenu
		title: 'Tests Results';
		yourself.
	^ menu
		add: 'Filter Class...' action: #filterClassFromParticularResults;
		addLine;
		add: 'Remove Filters' action: #removeFiltersFromParticularResults;
		addLine;
		add: 'Refresh' action: #updateParticularResultsList;
		yourself.
]

{ #category : #'accessing-particularResults' }
MutationBrowser >> particularResultsSelected [
	^particularResultsList indexOf: particularResultsSelected
]

{ #category : #'accessing-particularResults' }
MutationBrowser >> particularResultsSelected: anInteger [ 
	particularResultsSelected := particularResultsList at: anInteger ifAbsent: nil.
	self changed: #particularResultsSelected.
	particularResultsSelected
		ifNotNil: [
			|class selector|
			class := particularResultsSelected class.
			selector := particularResultsSelected selector.
			(class includesSelector: selector)
				ifTrue: [ToolSet browse: class selector: selector]
				ifFalse: [ToolSet browse: class selector: nil]]
]

{ #category : #filtering }
MutationBrowser >> removeFiltersFromParticularResults [
	particularResultsClassFilter := nil.
	self updateParticularResultsList
]

{ #category : #opening }
MutationBrowser >> showDetails [
	| string |
	string := (MutantReporter for: mutantEvaluationResult) value.
	Workspace new
		contents: string;
		openLabel: 'Mutation Details' string
]

{ #category : #accessing }
MutationBrowser >> testResults [
	^ mutantEvaluationResult resultString
]

{ #category : #'as yet unclassified' }
MutationBrowser >> testsSelectionStrategies [
	^Array
		with: NoneTestCasesSelectionStrategy new
		with: ClassTestCasesSelectionStrategy new
		with: PackageTestCasesSelectionStrategy new
]

{ #category : #building }
MutationBrowser >> textMenu: aMenuMorph [ 

	^ aMenuMorph
		add: 'Browse method' action: #openMutatedMethodBrowser;
		yourself
]

{ #category : #running }
MutationBrowser >> tryToKill [
	| mutantEvaluation strategy list|
	list := self testsSelectionStrategies collect: [:anStrategy | anStrategy description].
	strategy := UIManager default chooseFrom: list  message: 'Try to kill using:'.
	(strategy isNil
			or: [strategy = 0])
		ifTrue: [^nil].
	^[mutantEvaluationResult mutantEvaluation testCases do: [ :aTestCase | aTestCase run ].
	strategy := self testsSelectionStrategies at: strategy.
	mutantEvaluation := MutantEvaluation 
								for: mutantEvaluationResult mutant 
								using: mutantEvaluationResult mutantEvaluation testCases 
								following:  mutantEvaluationResult mutantEvaluation strategy
								and: strategy.
	mutantEvaluationResult := mutantEvaluation value.
	self update.
	true]
		on: TestsWithErrorsException
		do: [ :anException |
			OBInformRequest message: 'Your tests have Errors or Failures. Please correct them.'.
			anException return: false].
]

{ #category : #updating }
MutationBrowser >> update [

	self updateParticularResultsList; updateTestResults
]

{ #category : #updating }
MutationBrowser >> updateParticularResultsList [

	particularResultsList := self filterParticularResultsList.
	particularResultsSelected := nil.
	self
		changed: #particularResultsList;
		changed: #particularResultsSelected
]

{ #category : #updating }
MutationBrowser >> updateTestResults [
	self changed: #testResults;
		 changed: #killingSuggestions;
		 changed: #codeDifference
]
