selecting
testClassesFrom: aTestCollection 
	^ (aTestCollection collect: [ :testCase | testCase class ]) asSet