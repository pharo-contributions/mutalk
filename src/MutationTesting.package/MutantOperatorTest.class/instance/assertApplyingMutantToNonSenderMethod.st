asserts
assertApplyingMutantToNonSenderMethod
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithNoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithNoSenders
		replacingSelector: #methodWithNoSenders