Class {
	#name : #ClassForTestingCoverage,
	#superclass : #Object,
	#category : 'MuTalk-TestResources'
}

{ #category : #'as yet unclassified' }
ClassForTestingCoverage class >> aClassCoveredMethod [
	^true.
]

{ #category : #'as yet unclassified' }
ClassForTestingCoverage >> aCoveredMethod [
	^ true
]

{ #category : #'as yet unclassified' }
ClassForTestingCoverage >> anUncoveredMethod [
	^ true
]
