private
addTestsFrom: aWrapper to: methodToTestDictionary 
	aWrapper tests notEmpty
		ifTrue: [(methodToTestDictionary
				at: aWrapper reference compiledMethod
				ifAbsentPut: [IdentitySet new])
				addAll: aWrapper tests]