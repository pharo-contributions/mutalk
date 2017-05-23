*MuTalk-Model
runStoppingOnFirstFailOrError
    | result |
     result := TestResult new.
    self resources do: [ :res |
        res isAvailable ifFalse: [^res signalInitializationError]].
    [self runStoppingOnFirstFailOrError: result] ensure: [self resources do: [:each | each reset]].
    ^result