Class {
	#name : 'MTTestClassForTestingCoverage',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MTTestClassForTestingCoverage class >> resources [
	^Array with:TestResourceClassForTestingCoverage 
]

{ #category : 'testing' }
MTTestClassForTestingCoverage >> testCase1 [
	self assert: ClassForTestingCoverage new aCoveredMethod.
]

{ #category : 'testing' }
MTTestClassForTestingCoverage >> testCase2 [
	self assert: ClassForTestingCoverage new aCoveredMethod.
]

{ #category : 'testing' }
MTTestClassForTestingCoverage >> testCase3 [
	self assert: true.
]

{ #category : 'testing' }
MTTestClassForTestingCoverage >> testCaseThatCoversAClassMethod [
	self assert: ClassForTestingCoverage aClassCoveredMethod.
]
