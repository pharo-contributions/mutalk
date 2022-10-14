Class {
	#name : #MutalkCIHelperTest,
	#superclass : #TestCase,
	#category : #'MuTalk-CI-Tests'
}

{ #category : #tests }
MutalkCIHelperTest >> testMoveX [

	| obj |
	obj := MutalkCIHelper new.
	obj moveX.
	self assert: obj myObject y equals: 20.
	"Missing assertion is:     
	
	
	self assert: obj myObject x equals: 10" 
]
