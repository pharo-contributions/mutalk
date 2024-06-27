Class {
	#name : 'MTSmallBankTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'tests' }
MTSmallBankTest >> testDeposit [
	| b |
	b := MTSmallBank new.
	b deposit: 10.
	self assert: b balance equals: 10.
	b deposit: 100.
	self assert: b balance equals: 110
]

{ #category : 'tests' }
MTSmallBankTest >> testInit [
	| b |
	b := MTSmallBank new .self assert: b balance equals: 0
]

{ #category : 'tests' }
MTSmallBankTest >> testWithdraw [
	| b |
	b := MTSmallBank new.
	b deposit: 100.
	self assert: b balance equals: 100.
	b withdraw: 30.
	self assert: b balance equals: 70
]
