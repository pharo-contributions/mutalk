Class {
	#name : 'TestClassForTestingCoverage',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
TestClassForTestingCoverage class >> resources [
	^Array with:TestResourceClassForTestingCoverage 
]

{ #category : 'testing' }
TestClassForTestingCoverage >> testCase1 [
	self assert: ClassForTestingCoverage new aCoveredMethod.
]

{ #category : 'testing' }
TestClassForTestingCoverage >> testCase2 [
	self assert: ClassForTestingCoverage new aCoveredMethod.
]

{ #category : 'testing' }
TestClassForTestingCoverage >> testCase3 [
	self assert: true.
]

{ #category : 'testing' }
TestClassForTestingCoverage >> testCaseThatCoversAClassMethod [
	self assert: ClassForTestingCoverage aClassCoveredMethod.
]
