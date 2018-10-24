Extension { #name : #Boolean }

{ #category : #'*MuTalk-Model' }
Boolean >> bEqv: aBlock [

	^self eqv: aBlock value
]

{ #category : #'*MuTalk-Model' }
Boolean >> bXor: aBlock [

	^self xor: aBlock value
]

{ #category : #'*MuTalk-Model' }
Boolean >> nand: alternativeBlock [ 

	^(self and: alternativeBlock) not
]
