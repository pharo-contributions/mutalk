accessing
aliveMutantList
	^(aliveMutantList asArray sort: [ :a :b | a printString <= b printString ]) 