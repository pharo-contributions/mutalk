Class {
	#name : 'MTStubbornOnlyMutantGenerationStrategy',
	#superclass : 'MTSelectingFromCoverageMutantGenerationStrategy',
	#category : 'MuTalk-Model-Mutant generation strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant generation strategies'
}

{ #category : 'generating' }
MTStubbornOnlyMutantGenerationStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations subSuite trivialAnalysis |
	mutations := super mutationsFor: aMutationTestingAnalysis loggingIn: aLogger.
	
	
	1halt.
	subSuite := MTCoverageTestSuiteSelector new
		selectTestsFrom: aMutationTestingAnalysis.
	
	"subSuite := (1 to: 15) collect: [ :e | aMutationTestingAnalysis testCases atRandom ]."
	trivialAnalysis := aMutationTestingAnalysis copy.
	trivialAnalysis
		testClasses: subSuite;
		mutations: mutations;
		testSelectionStrategy: MTAllTestsMethodsRunningTestSelectionStrategy new.
	trivialAnalysis generateResults.
	1halt.
	
	^ mutations
]
