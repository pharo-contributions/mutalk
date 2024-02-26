Class {
	#name : #MTStubbornOnlyMutantSelectionStrategy,
	#superclass : #MTSelectingFromCoverageMutantSelectionStrategy,
	#category : 'MuTalk-Model-Mutant selection strategies'
}

{ #category : #generating }
MTStubbornOnlyMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

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
