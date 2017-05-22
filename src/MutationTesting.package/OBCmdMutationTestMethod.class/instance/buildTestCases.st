execution
buildTestCases
	| selector tests |

	selector := target selector.
	tests := target theClass suite tests select: [ :each | selector = each selector ].
	^tests
