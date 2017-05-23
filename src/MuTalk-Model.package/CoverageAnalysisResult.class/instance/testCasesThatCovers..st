accessing
testCasesThatCovers: aCompiledMethod 
	^methodToTestDictionary at:aCompiledMethod ifAbsent:[OrderedCollection new.].