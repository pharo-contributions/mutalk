selecting
testPackageFrom: aTestCollection

	^(aTestCollection collect: [:testCase | testCase class package name]) asSet