execution
buildTestCases
	| selectorUnderTheCategory tests |
	selectorUnderTheCategory := target theClass organization listAtCategoryNamed: target category.
	tests := target theClass suite tests select: [:each| selectorUnderTheCategory includes: each selector].
	^tests