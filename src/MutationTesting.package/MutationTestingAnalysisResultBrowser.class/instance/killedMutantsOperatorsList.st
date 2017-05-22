accessing
killedMutantsOperatorsList
	^ (result killedOrTerminatedMutants collect: [ :mutantResult | mutantResult mutant operator description]) asSet asSortedCollection: [ :a :b | a <= b ]