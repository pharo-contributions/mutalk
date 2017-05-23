asserts
assertApplyingMutantToFirstSenderInTwoSendersMethod
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedFirst
		replacingSelector: #methodWithTwoSenders