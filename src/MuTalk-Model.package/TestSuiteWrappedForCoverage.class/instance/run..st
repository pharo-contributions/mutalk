running
run: aResult 
	self tests do: [:each |coverageAnalysis currentTest: each.
								self changed: each.
								each run: aResult.
								coverageAnalysis currentTest: nil]
				 displayingProgress: 'Analysing Coverage'.