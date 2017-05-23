asserts
assertApplyingMutantToFirstSenderInOneSenderMethod
	^ self compareSource: 
				(self operator 
						modifiedSourceFor: self class >> #methodWithOneSender
						number: 1) 
			withSourceInMethod: self class >> #methodWithOneSenderModified
			replacingSelector: #methodWithOneSender