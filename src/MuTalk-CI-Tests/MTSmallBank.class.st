Class {
	#name : 'MTSmallBank',
	#superclass : 'Object',
	#instVars : [
		'balance'
	],
	#category : 'MuTalk-CI-Tests',
	#package : 'MuTalk-CI-Tests'
}

{ #category : 'accessing' }
MTSmallBank >> balance [
	^ balance
]

{ #category : 'accessing' }
MTSmallBank >> deposit: amount [
	balance := balance + amount
]

{ #category : 'initialization' }
MTSmallBank >> initialize [ 
	balance := 0
]

{ #category : 'accessing' }
MTSmallBank >> rand [
	" Flaky detection "
	^ (1 to: 1000) atRandom

]

{ #category : 'accessing' }
MTSmallBank >> withdraw: amount [
	balance >= amount
		ifTrue: [ 
			balance := balance - amount.
			^ true ].
	^ false
]
