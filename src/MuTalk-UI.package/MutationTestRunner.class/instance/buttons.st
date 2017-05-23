accessing-ui
buttons
	^ #(( 'Mutate All, Run All' #runAllMutantAndAllTests #hasRunnable )
		( 'Mutate All, Run Covering' #runAllMutantAndCoveredTests #hasRunnable )
		( 'Mutate Covered, Run All' #runCoveredMutantAndAllTests #hasRunnable )
		( 'Mutate Covered, Run Covering' #runCoveredMutantAndCoveredTests #hasRunnable )).