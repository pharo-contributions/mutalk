*MuTalk-Model
runStoppingOnFirstFailOrError: aResult
    self tests do: [:each |
        self changed: each.
        each run: aResult.
        (aResult failuresSize > 0 or: [ aResult errorsSize > 0]) ifTrue: [ ^ self ]].