selecting
testPackageFrom: aTestCollection

	^(aTestCollection collect: [:testCase | testCase class category]) asSet