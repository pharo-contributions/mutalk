accessing-particularResults
particularResultsClassesList
	^ (mutantEvaluationResult particularResults collect: [ :test | test class name ]) asSet asSortedCollection: [ :a :b | a name <= b name ]