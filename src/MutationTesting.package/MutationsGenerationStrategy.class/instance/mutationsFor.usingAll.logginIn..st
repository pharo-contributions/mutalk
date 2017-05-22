generating
mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger 
	| parseTree |
	parseTree := aMethod parseTree.
	^ aCollectionOfMutantOperators
		inject: OrderedCollection new
		into: [:mutations :anOperator | 
			aLogger logStartBuildingMutantionsFor: aMethod using: anOperator.
			mutations
				addAll: (anOperator mutationsFor: aMethod with: parseTree);
				 yourself]