accessing
aliveMutantsClassesList
	^ (result aliveMutants collect: [ :mutantResult | mutantResult mutant originalClass name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]