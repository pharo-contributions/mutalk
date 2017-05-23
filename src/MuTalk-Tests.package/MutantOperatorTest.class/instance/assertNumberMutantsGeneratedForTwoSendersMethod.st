asserts
assertNumberMutantsGeneratedForTwoSendersMethod
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithTwoSenders.
	^mutationsGenerated size = 2.