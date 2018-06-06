evaluation
value
	| testResults |

	Stdio stdout nextPutAll: mutation originalMethod name asString; lf; flush.

	self initializeCoverageResultIfNil.
	testResults := [ mutation install.
	self testResults ]
		ensure: [ mutation uninstall ].
	^ MutantEvaluationResult
		for: mutation
		results: testResults
		producedBy: self