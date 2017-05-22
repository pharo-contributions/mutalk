testing
isActive
	^(target isKindOf: OBMethodCategoryNode) 
	     and: [(target theClass inheritsFrom: TestCase)
	     and: [(target methodReferences anySatisfy: [:ref | ref methodSymbol beginsWith: 'test']) and: [requestor isSelected: target]]]		