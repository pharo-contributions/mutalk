asserts
assertNumberMutantsGeneratedForOneSenderMethod
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithOneSender.
	^mutationsGenerated size = 1.