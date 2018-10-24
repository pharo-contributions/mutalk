Class {
	#name : #TestSuiteWrappedForCoverage,
	#superclass : #TestSuite,
	#instVars : [
		'coverageAnalysis'
	],
	#category : 'MuTalk-Model'
}

{ #category : #'instance creation' }
TestSuiteWrappedForCoverage class >> for: aCoverageAnalysis named: aString [ 
	^self new initializeFor: aCoverageAnalysis named: aString.
]

{ #category : #initialization }
TestSuiteWrappedForCoverage >> initializeFor: aCoverageAnalysis named: aString [
	self name: aString.
	coverageAnalysis := aCoverageAnalysis.
]

{ #category : #running }
TestSuiteWrappedForCoverage >> run: aResult [ 
	self tests do: [:each |coverageAnalysis currentTest: each.
								self changed: each.
								each run: aResult.
								coverageAnalysis currentTest: nil]
				 displayingProgress: 'Analysing Coverage'.
]
