Extension { #name : 'TestSuite' }

{ #category : '*MuTalk-Model' }
TestSuite >> runStoppingOnFirstFailOrError [
    | result |
     result := TestResult new.
    self resources do: [ :res |
        res isAvailable ifFalse: [^res signalInitializationError]].
    [self runStoppingOnFirstFailOrError: result] ensure: [self resources do: [:each | each reset]].
    ^result
]

{ #category : '*MuTalk-Model' }
TestSuite >> runStoppingOnFirstFailOrError: aResult [
    self tests do: [:each |
        self changed: each.
        each run: aResult.
        (aResult failuresSize > 0 or: [ aResult errorsSize > 0]) ifTrue: [ ^ self ]]
]
