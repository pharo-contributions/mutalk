asserts
assertNumberMutantsGeneratedForNonSenderMethod
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithNoSenders.
	^mutationsGenerated size = 0.