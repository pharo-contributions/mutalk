Class {
	#name : 'MTTestResourceClassForTestingCoverage',
	#superclass : 'TestResource',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MTTestResourceClassForTestingCoverage >> doSomething [
	^ClassForTestingCoverage new anUncoveredMethod.
]

{ #category : 'as yet unclassified' }
MTTestResourceClassForTestingCoverage >> setUp [
	self doSomething
]
