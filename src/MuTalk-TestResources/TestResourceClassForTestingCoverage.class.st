Class {
	#name : #TestResourceClassForTestingCoverage,
	#superclass : #TestResource,
	#category : 'MuTalk-TestResources'
}

{ #category : #'as yet unclassified' }
TestResourceClassForTestingCoverage >> doSomething [
	^ClassForTestingCoverage new anUncoveredMethod.
]

{ #category : #'as yet unclassified' }
TestResourceClassForTestingCoverage >> setUp [
	self doSomething
]
