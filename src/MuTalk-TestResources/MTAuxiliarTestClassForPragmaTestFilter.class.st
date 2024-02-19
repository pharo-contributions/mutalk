Class {
	#name : 'MTAuxiliarTestClassForPragmaTestFilter',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'tests' }
MTAuxiliarTestClassForPragmaTestFilter >> testWithPragma [

	<aPragma>
	self assert: true
]

{ #category : 'tests' }
MTAuxiliarTestClassForPragmaTestFilter >> testWithoutPragma [

	self assert: true
]
