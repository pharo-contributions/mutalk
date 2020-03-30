Class {
	#name : #ClassForTestingCoverage,
	#superclass : #Object,
	#category : #'MuTalk-TestResources'
}

{ #category : #'as yet unclassified' }
ClassForTestingCoverage class >> aClassCoveredMethod [
	^true.
]

{ #category : #'instance creation' }
ClassForTestingCoverage class >> new: aSize [
	" from UUID class>> #new:"
	(aSize == 16) ifFalse: [ self error: 'Wrong UUID size' ].
	
	^ super new: aSize
]

{ #category : #'as yet unclassified' }
ClassForTestingCoverage >> aCoveredMethod [
	^ true
]

{ #category : #'as yet unclassified' }
ClassForTestingCoverage >> anUncoveredMethod [
	^ true
]
