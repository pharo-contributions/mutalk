Class {
	#name : 'MTSmallBank2',
	#superclass : 'Object',
	#instVars : [
		'balance'
	],
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'as yet unclassified' }
MTSmallBank2 class >> calculateRate: aPercent amount: anInt [
	" I expect it profiled"
	aPercent < 0 ifTrue: [ self error: 'negetive ' ].
	^ (anInt * aPercent / 100) asInteger
]

{ #category : 'as yet unclassified' }
MTSmallBank2 class >> calculateRate: aPercent amount: anInt month: monthes [
	"I expect it not profiled."
	^ (self calculateRate: aPercent amount: anInt) / monthes asInteger
]

{ #category : 'as yet unclassified' }
MTSmallBank2 class >> calculateRateExample [
	"I expect it added in  input amplification"

	^ self calculateRate: 2 amount: 1000000 month: 12
]

{ #category : 'instance creation' }
MTSmallBank2 class >> with: amount [
	^ self new
		deposit:  amount;
		yourself
]

{ #category : 'accessing' }
MTSmallBank2 >> balance [
	^ balance
]

{ #category : 'accessing' }
MTSmallBank2 >> deposit: amount [
	amount < 0
		ifTrue: [ Error new signal ].
	balance := balance + amount
]

{ #category : 'initialization' }
MTSmallBank2 >> initialize [
	balance := 0
]

{ #category : 'accessing' }
MTSmallBank2 >> withdraw: amount [
	balance >= amount
		ifTrue: [ balance := balance - amount ]
		ifFalse: [ Error new signal ]
]
