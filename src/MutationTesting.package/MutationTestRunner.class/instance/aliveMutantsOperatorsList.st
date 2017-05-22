accessing-testing
aliveMutantsOperatorsList
	^ (result aliveMutants collect: [ :mutantResult | mutantResult mutant operator description]) asSet asSortedCollection: [ :a :b | a <= b ]