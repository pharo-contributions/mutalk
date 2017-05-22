asserts
assertTimesToApplyOperatorToNonSenderMethod
	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders) = 0