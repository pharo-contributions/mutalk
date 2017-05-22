testing
isActive
	^ (target isKindOf: OBClassNode)
		and: [(requestor isSelected: target)
		and: [target theClass inheritsFrom: TestCase]]