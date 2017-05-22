testing
isActive
	^ (target isKindOf: OBMethodNode)
		and: [ 
			(requestor isSelected: target)
				and: [ (target theClass inheritsFrom: TestCase) and: [ (target selector beginsWith: 'test') and: [ target selector isUnary ] ] ] ]