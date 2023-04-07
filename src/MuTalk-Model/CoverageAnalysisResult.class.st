Class {
	#name : #CoverageAnalysisResult,
	#superclass : #Object,
	#instVars : [
		'methodToTestDictionary',
		'timeToRunTests',
		'methodReferences'
	],
	#category : #'MuTalk-Model'
}

{ #category : #'instance creation' }
CoverageAnalysisResult class >> from: aDictionaryOfMethodToTestCasesRelations [ 
	^self new initializeFrom: aDictionaryOfMethodToTestCasesRelations.
]

{ #category : #'instance creation' }
CoverageAnalysisResult class >> from: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [
	^self new initializeFrom: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests.
]

{ #category : #api }
CoverageAnalysisResult >> coveragePerTest: aMutationTestingAnalysis [
	
	| coveragePerTest |
	coveragePerTest := Dictionary new.
	aMutationTestingAnalysis testCases do: [ :testcase | | coveredMethods |
		coveredMethods := methodToTestDictionary associations
			select: [ :association | association value includes: testcase ]
			thenCollect: #key.
		coveragePerTest
			at: testcase
			put: coveredMethods
	].
	^ coveragePerTest
]

{ #category : #accessing }
CoverageAnalysisResult >> coveredMethods [
	^methodToTestDictionary keys asIdentitySet. "select:[:each | (methodToTestDictionary at:each) notEmpty]."
]

{ #category : #'initialize-release' }
CoverageAnalysisResult >> initializeFrom: aDictionaryOfMethodToTestCasesRelations [ 
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations
]

{ #category : #'initialize-release' }
CoverageAnalysisResult >> initializeFrom: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations.
	timeToRunTests := aTimeToRunTests.
]

{ #category : #accessing }
CoverageAnalysisResult >> methodReferences [

	^ methodReferences
]

{ #category : #accessing }
CoverageAnalysisResult >> methodReferences: anObject [

	methodReferences := anObject
]

{ #category : #accessing }
CoverageAnalysisResult >> testCasesThatCovers: aCompiledMethod [ 
	^methodToTestDictionary at:aCompiledMethod ifAbsent:[OrderedCollection new.].
]

{ #category : #accessing }
CoverageAnalysisResult >> timeToRunTests [
	^timeToRunTests
]

{ #category : #accessing }
CoverageAnalysisResult >> uncoveredMethods [

	^ (self methodReferences reject: #isSubclassResponsibility) asSet difference: self coveredMethods
]
