evaluation
value
	| testResults |
	self initializeCoverageResultIfNil.
	[ mutation install.
	testResults := self	testResults ] 
		ensure: [ mutation uninstall ].
	^ MutantEvaluationResult 
		for: mutation
		results: testResults
		producedBy: self