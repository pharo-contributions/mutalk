Class {
	#name : 'MTClassForTestingCoverage',
	#superclass : 'Object',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MTClassForTestingCoverage class >> aClassCoveredMethod [
	^true.
]

{ #category : 'instance creation' }
MTClassForTestingCoverage class >> new: aSize [
	" from UUID class>> #new:"
	(aSize == 16) ifFalse: [ self error: 'Wrong UUID size' ].
	
	^ super new: aSize
]

{ #category : 'as yet unclassified' }
MTClassForTestingCoverage >> aCoveredMethod [

	^ true
]

{ #category : 'as yet unclassified' }
MTClassForTestingCoverage >> anUncoveredMethod [
	^ true
]

{ #category : 'as yet unclassified' }
MTClassForTestingCoverage >> anUncoveredMethodSubClassResponsibility [

	self subclassResponsibility 
]
