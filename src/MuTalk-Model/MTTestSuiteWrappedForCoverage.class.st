Class {
	#name : 'MTTestSuiteWrappedForCoverage',
	#superclass : 'TestSuite',
	#instVars : [
		'coverageAnalysis'
	],
	#category : 'MuTalk-Model-Coverage',
	#package : 'MuTalk-Model',
	#tag : 'Coverage'
}

{ #category : 'instance creation' }
MTTestSuiteWrappedForCoverage class >> for: aCoverageAnalysis named: aString [ 
	^self new initializeFor: aCoverageAnalysis named: aString.
]

{ #category : 'initialization' }
MTTestSuiteWrappedForCoverage >> initializeFor: aCoverageAnalysis named: aString [
	self name: aString.
	coverageAnalysis := aCoverageAnalysis.
]

{ #category : 'running' }
MTTestSuiteWrappedForCoverage >> run: aResult [

	self tests do: [ :each |
		coverageAnalysis currentTest: each.
		self changed: each.
		each run: aResult.
		coverageAnalysis currentTest: nil ]
]
