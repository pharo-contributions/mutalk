Extension { #name : #TestResult }

{ #category : #'*MuTalk-Model' }
TestResult >> concreteErrors [
    ^ errors
]

{ #category : #'*MuTalk-Model' }
TestResult >> concreteFailures [
    ^ failures
]

{ #category : #'*MuTalk-Model' }
TestResult >> concretePassed [
    ^ passed
]

{ #category : #'*MuTalk-Model' }
TestResult >> errorsSize [
    ^ errors size
]

{ #category : #'*MuTalk-Model' }
TestResult >> failuresSize [
    ^ failures size
]
