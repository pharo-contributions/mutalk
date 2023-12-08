Extension { #name : 'CompiledMethod' }

{ #category : '*MuTalk-Model' }
CompiledMethod >> ignoredMutationOperators [

	^ (self pragmaAt: #ignoreForMutations:)
		ifNil: [ Array new ] 
		ifNotNil: [ :aPragma |
			aPragma arguments first 
				collect: [:each | Smalltalk globals at: each ifAbsent: [ nil ] ]
				thenSelect: #notNil ]
]
