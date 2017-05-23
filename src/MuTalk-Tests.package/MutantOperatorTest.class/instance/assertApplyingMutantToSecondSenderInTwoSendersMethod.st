asserts
assertApplyingMutantToSecondSenderInTwoSendersMethod
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 2) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedSecond
		replacingSelector: #methodWithTwoSenders