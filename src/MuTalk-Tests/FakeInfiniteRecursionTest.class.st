Class {
	#name : #FakeInfiniteRecursionTest,
	#superclass : #TestCase,
	#category : #'MuTalk-Tests'
}

{ #category : #tests }
FakeInfiniteRecursionTest >> testFactorial [

	| ins |
	ins := FakeInfiniteRecursion new.
		self assert: (ins factorial: 3 ) equals: 6.
	self assert: (ins factorial: 5 ) equals: 120
]
