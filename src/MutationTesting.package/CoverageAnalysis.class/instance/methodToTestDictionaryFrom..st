private
methodToTestDictionaryFrom: wrappers 
	^ wrappers
		inject: IdentityDictionary new
		into: [:methodToTestDictionary :aWrapper | 
			self addTestsFrom: aWrapper to: methodToTestDictionary.
			methodToTestDictionary]