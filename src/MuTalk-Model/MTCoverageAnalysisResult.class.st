Class {
	#name : #MTCoverageAnalysisResult,
	#superclass : #Object,
	#instVars : [
		'methodToTestDictionary',
		'timeToRunTests',
		'methodReferences'
	],
	#category : 'MuTalk-Model-Coverage'
}

{ #category : #'instance creation' }
MTCoverageAnalysisResult class >> from: aDictionaryOfMethodToTestCasesRelations [ 
	^self new initializeFrom: aDictionaryOfMethodToTestCasesRelations.
]

{ #category : #'instance creation' }
MTCoverageAnalysisResult class >> from: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [
	^self new initializeFrom: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests.
]

{ #category : #api }
MTCoverageAnalysisResult >> coveragePerTest: aMutationTestingAnalysis [
	
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
MTCoverageAnalysisResult >> coveredMethods [
	^methodToTestDictionary keys asIdentitySet. "select:[:each | (methodToTestDictionary at:each) notEmpty]."
]

{ #category : #'initialize-release' }
MTCoverageAnalysisResult >> initializeFrom: aDictionaryOfMethodToTestCasesRelations [ 
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations
]

{ #category : #'initialize-release' }
MTCoverageAnalysisResult >> initializeFrom: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations.
	timeToRunTests := aTimeToRunTests.
]

{ #category : #accessing }
MTCoverageAnalysisResult >> methodReferences [

	^ methodReferences
]

{ #category : #accessing }
MTCoverageAnalysisResult >> methodReferences: anObject [

	methodReferences := anObject
]

{ #category : #accessing }
MTCoverageAnalysisResult >> testCasesThatCovers: aCompiledMethod [ 
	^methodToTestDictionary at:aCompiledMethod ifAbsent:[OrderedCollection new.].
]

{ #category : #accessing }
MTCoverageAnalysisResult >> timeToRunTests [
	^timeToRunTests
]

{ #category : #accessing }
MTCoverageAnalysisResult >> uncoveredMethods [

	^ (self methodReferences reject: #isSubclassResponsibility) asSet difference: self coveredMethods
]
