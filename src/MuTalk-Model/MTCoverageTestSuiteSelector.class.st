Class {
	#name : 'MTCoverageTestSuiteSelector',
	#superclass : 'Object',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'selecting' }
MTCoverageTestSuiteSelector >> selectTestsFrom: aMutationTestingAnalysis [
	
	| methodsToCover testCaseCandidates selectedTests |
	methodsToCover := aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
	selectedTests := Set new.
	
	"Take all test case candidates except those that take too much to run.
	Decide that by sorting and filtering out the 2% more costly"
	testCaseCandidates := aMutationTestingAnalysis coverageAnalysisResult coveragePerTest: aMutationTestingAnalysis.
	testCaseCandidates := ((testCaseCandidates associations sorted: [ :a :b |
		a key lastTimeToRun < b key lastTimeToRun ]) allButLast: (testCaseCandidates size * 0.02) ceiling) asDictionary.

	[	| sortedCoverage assoc m |
		m := [ :x | x value intersection: methodsToCover ] memoized.
		sortedCoverage := testCaseCandidates associations sorted: [ :a :b |
			(m value: a) size  > (m value: b) size ].
		assoc := sortedCoverage first.
		
		selectedTests add: assoc key.

		testCaseCandidates removeKey: assoc key.
		assoc value do: [ :e |
			methodsToCover remove: e ifAbsent: [ "Ignore" ] ].
		
		"Reached 80% of coverage?"
		methodsToCover size < (0.2 * aMutationTestingAnalysis coverageAnalysisResult coveredMethods size)
	] whileFalse.


	^ selectedTests
]
