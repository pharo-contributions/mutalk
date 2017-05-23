private
testResults 

	^ [ self runTests ] valueWithin: (strategy timeoutForTestsOf: self) milliSeconds onTimeout: [ nil ]