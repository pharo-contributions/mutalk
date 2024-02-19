Class {
	#name : 'MTMethodWrapperForCoverage',
	#superclass : 'TestCoverage',
	#instVars : [
		'tests',
		'coverageAnalysis'
	],
	#category : 'MuTalk-Model-Coverage',
	#package : 'MuTalk-Model',
	#tag : 'Coverage'
}

{ #category : 'instance creation' }
MTMethodWrapperForCoverage class >> on: aMethodReference for: aCoverageAnalysis [
	^ self new initializeOn: aMethodReference for: aCoverageAnalysis
]

{ #category : 'initialization' }
MTMethodWrapperForCoverage >> initializeOn: aMethodReference for: aCoverageAnalysis [
	self initializeOn: aMethodReference.
	coverageAnalysis := aCoverageAnalysis.
	tests := Set new
]

{ #category : 'private' }
MTMethodWrapperForCoverage >> mark [
	|currentTest|
	super mark.
	currentTest := coverageAnalysis currentTest.
	currentTest ifNotNil: [tests add: currentTest]. 
	

]

{ #category : 'evaluation' }
MTMethodWrapperForCoverage >> run: aSelector with: anArray in: aReceiver [
	self mark.
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : 'accessing' }
MTMethodWrapperForCoverage >> tests [
	^tests
]
