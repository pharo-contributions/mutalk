Class {
	#name : #CoveragePropagationPreparation,
	#superclass : #AbstractCoverageInfoPreparation,
	#instVars : [
		'flakyDetection',
		'link',
		'counter',
		'observations',
		'propagationDetected'
	],
	#category : #'MuTalk-CI'
}

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> captureStateNode: aNode context: aContext object: anObject [

	| temps selfobject |
	temps := aNode methodNode allTemporaryVariables collect: [ :temp | 
		         (aContext hasTemporaryVariableNamed: temp)
			         ifTrue: [ temp -> (aContext tempNamed: temp) ]
			         ifFalse: [ temp -> nil ] ].
	temps := (temps collect: [ :temp | 
		         temp key -> (self serializeObject: temp value level: 4) ]) asDictionary.

	selfobject := self serializeObject: anObject level: 4.
	^ { 
		  (#temps -> temps).
		  (#object -> selfobject) } asDictionary
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> checkFlakyState: state [

	| oldState |
	oldState := observations at: counter.
	counter := counter + 1.
	self detectAllStateChangesState1: oldState State2: state andDo: [ :state1 :state2 :key | state1 removeKey: key ]
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> checkPropagationInState: state [

	| oldState |
	oldState := observations at: counter.
	counter := counter + 1.
	self
		detectAllStateChangesState1: oldState
		State2: state
		andDo: [ :state1 :state2 :key | propagationDetected := true ]
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> detectAllStateChangesState1: state1 State2: state2 andDo: aBlock [

	state1 isDictionary ifFalse: [ ^ state1 = state2 ].
	state1 keysAndValuesDo: [ :k :v | 
		(self
			 removeAllStateChangesState1: (state1 at: k)
			 State2: (state2 at: k)) ifFalse: [ 
			aBlock value: state1 value: state2 value: k ] ].
	^ true
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> executeAfterNode: aNode context: aContext object: anObject [

	| newItem state |
	state := self
		         captureStateNode: aNode
		         context: aContext
		         object: anObject.
	
	flakyDetection
		ifTrue: [ self checkFlakyState: state ]
		ifFalse: [ 
			newItem := observations size < counter.
			newItem
				ifTrue: [ self insertState: state ]
				ifFalse: [ self checkPropagationInState: state ] ]
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> generateItemFor: aMutationEvaluation [

	| item |
	item := Dictionary new.
	item at: #mutationEvaluation put: aMutationEvaluation.
	item
		at: #coveredBy
		put: (self methodCoveredByFor: aMutationEvaluation).
	item
		at: #testStateChangedIn
		put: (self testsWithSuccessfulPropagationFor: aMutationEvaluation).
	^ item
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> insertState: state [

	observations add: state.
	counter := counter + 1
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> installMetalinkToNode: statement [

	link ifNil: [ 
		link := MetaLink new
			        metaObject: self;
			        control: #after;
			        selector: #executeAfterNode:context:object:;
			        arguments: #( node context object );
			        yourself ].
	statement link: link
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> installMetalinks: covered [

	| testCase |
	testCase := covered testCase.
	(testCase class >> testCase selector) ast body allStatements do: [ 
		:statement | self installMetalinkToNode: statement ]
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> installMutant: aMutationEvaluation [

	aMutationEvaluation mutant install.
]

{ #category : #testing }
CoveragePropagationPreparation >> isChangesPropagatedTo: covered for: aMutationEvaluation [

	observations := OrderedCollection new.
	propagationDetected := false.
	[ 
	self installMetalinks: covered.
	flakyDetection := false.
	self runTestCase: covered.
	flakyDetection := true.
	3 timesRepeat: [ self runTestCase: covered ].
	flakyDetection := false.
	self installMutant: aMutationEvaluation.
	self runTestCase: covered ] ensure: [ 
		self uninstallMutant: aMutationEvaluation.
		self uninstallMetalinks ].
	self halt.
	^ propagationDetected
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> methodCoveredByFor: aMutationEvaluation [

	^ aMutationEvaluation mutantEvaluation coverageAnalysisResult 
		             testCasesThatCovers:
		             aMutationEvaluation  mutant originalMethod.
	
]

{ #category : #decoration }
CoveragePropagationPreparation >> prepare [

	| allSurvived result |
	result := OrderedCollection new.
	allSurvived := mtResult particularResults select: #survived.
	result addAll:
		(allSurvived collect: [ :survived | self generateItemFor: survived ]).
	^ result 
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> removeAllStateChangesState1: state1 State2: state2 [

	state1 isDictionary ifFalse: [ ^ state1 = state2 ].
	state1 keysAndValuesDo: [ :k :v | 
		(self
			 removeAllStateChangesState1: (state1 at: k)
			 State2: (state2 at: k)) ifFalse: [ state1 removeKey: k ] ].
	^ true
]

{ #category : #controlling }
CoveragePropagationPreparation >> runTestCase: testCaseReference [

	| results |
	counter := 1.
	results := TestAsserter classForTestResult new.
	results addAllResults: testCaseReference runUnchecked.
	^ results
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> serializeObject: anObject level: aLevel [

	| ins |
	aLevel > 0 ifFalse: [ ^ {  } ].
	^ (anObject class allInstVarNames collect: [ :insName | 
		   ins := anObject instVarNamed: insName.
		   ins isLiteral ifFalse: [ 
			          ins := self serializeObject: ins level: aLevel - 1 ].
		   insName -> ins ]) asDictionary
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> testsWithSuccessfulPropagationFor: aMutationEvaluation [

	| allCovered |
	allCovered := aMutationEvaluation mutantEvaluation coverageAnalysisResult 
		              testCasesThatCovers:
		              aMutationEvaluation mutant originalMethod.
	^ allCovered select: [ :covered | 
		self isChangesPropagatedTo: covered for: aMutationEvaluation ]
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> uninstallMetalinks [

	link uninstall 
]

{ #category : #'as yet unclassified' }
CoveragePropagationPreparation >> uninstallMutant: aMutationEvaluation [

	aMutationEvaluation mutant uninstall
]
