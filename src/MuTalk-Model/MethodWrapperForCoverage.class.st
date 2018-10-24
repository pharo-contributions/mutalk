Class {
	#name : #MethodWrapperForCoverage,
	#superclass : #TestCoverage,
	#instVars : [
		'tests',
		'coverageAnalysis'
	],
	#category : 'MuTalk-Model'
}

{ #category : #'instance creation' }
MethodWrapperForCoverage class >> on: aMethodReference for: aCoverageAnalysis [
	^ self new initializeOn: aMethodReference for: aCoverageAnalysis
]

{ #category : #initialization }
MethodWrapperForCoverage >> initializeOn: aMethodReference for: aCoverageAnalysis [
	self initializeOn: aMethodReference.
	coverageAnalysis := aCoverageAnalysis.
	tests := Set new
]

{ #category : #private }
MethodWrapperForCoverage >> mark [
	|currentTest|
	super mark.
	currentTest := coverageAnalysis currentTest.
	currentTest ifNotNil: [tests add: currentTest]. 
	

]

{ #category : #accessing }
MethodWrapperForCoverage >> run: aSelector with: anArray in: aReceiver [
	self mark.
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #accessing }
MethodWrapperForCoverage >> tests [
	^tests
]
