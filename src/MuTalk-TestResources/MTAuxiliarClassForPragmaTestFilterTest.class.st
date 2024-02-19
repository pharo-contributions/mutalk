Class {
	#name : 'MTAuxiliarClassForPragmaTestFilterTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'tests' }
MTAuxiliarClassForPragmaTestFilterTest >> testWithPragma [

	<aPragma>
	self assert: true
]

{ #category : 'tests' }
MTAuxiliarClassForPragmaTestFilterTest >> testWithoutPragma [

	self assert: true
]
