Class {
	#name : 'MTCIHelperTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'tests' }
MTCIHelperTest >> testMoveX [

	| obj |
	obj := MutalkCIHelper new.
	obj moveX.
	self assert: obj myObject y equals: 20.
	"Missing assertion is:     
	
	
	self assert: obj myObject x equals: 10" 
]
