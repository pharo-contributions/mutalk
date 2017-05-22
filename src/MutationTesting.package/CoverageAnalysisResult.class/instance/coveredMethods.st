accessing
coveredMethods
	^methodToTestDictionary keys asIdentitySet. "select:[:each | (methodToTestDictionary at:each) notEmpty]."