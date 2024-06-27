Class {
	#name : 'MTSmallBank2Test',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'tests' }
MTSmallBank2Test >> testDeposit [
	| b |
	b := MTSmallBank2 with: 10.
	self assert: b balance equals: 10.
	b deposit: 100.
	self assert: b balance equals: 110
]

{ #category : 'tests' }
MTSmallBank2Test >> testInit [
	| b |
	b := MTSmallBank2 new.
	self assert: b balance equals: 0
]

{ #category : 'tests' }
MTSmallBank2Test >> testPercent [
	MTSmallBank2 calculateRate: 10 amount: 1000
]

{ #category : 'tests' }
MTSmallBank2Test >> testWithdraw [
	| b |
	b := MTSmallBank2 new.
	b deposit: 100.
	self assert: b balance equals: 100.
	b withdraw: 30.
	self assert: b balance equals: 70
]
