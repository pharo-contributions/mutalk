Class {
	#name : 'MTTestResourceClassForTestingCoverage',
	#superclass : 'TestResource',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MTTestResourceClassForTestingCoverage >> doSomething [

	^ true
]

{ #category : 'as yet unclassified' }
MTTestResourceClassForTestingCoverage >> setUp [
	self doSomething
]
