Extension { #name : #TestResult }

{ #category : #'*MuTalk-Model' }
TestResult >> addAllResults: aTestResult [

	failures addAll: aTestResult failures.
	errors addAll: aTestResult errors.
	passed addAll: aTestResult passed.
	skipped addAll: aTestResult skipped.
]

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
