testing
isActive
	^(target isKindOf: OBClassCategoryNode)
		and: [(requestor isSelected: target)
		and: [target classes anySatisfy: [:cls | cls theClass inheritsFrom: TestCase]]]