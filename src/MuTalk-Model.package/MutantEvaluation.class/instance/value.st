evaluation
value
	| testResults |
	self initializeCoverageResultIfNil.
	testResults := [ mutation install.
	self testResults ]
		ensure: [ mutation uninstall ].
	^ MutantEvaluationResult
		for: mutation
		results: testResults
		producedBy: self