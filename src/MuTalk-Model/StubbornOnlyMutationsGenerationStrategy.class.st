Class {
	#name : #StubbornOnlyMutationsGenerationStrategy,
	#superclass : #SelectingFromCoverageMutationsGenerationStrategy,
	#category : #'MuTalk-Model-Mutations generation strategies'
}

{ #category : #generating }
StubbornOnlyMutationsGenerationStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations subSuite trivialAnalysis |
	mutations := super mutationsFor: aMutationTestingAnalysis loggingIn: aLogger.
	
	
	1halt.
	subSuite := CoverageTestSuiteSelector new
		selectTestsFrom: aMutationTestingAnalysis.
	
	"subSuite := (1 to: 15) collect: [ :e | aMutationTestingAnalysis testCases atRandom ]."
	trivialAnalysis := aMutationTestingAnalysis copy.
	trivialAnalysis
		testCases: subSuite;
		mutations: mutations;
		mutantsEvaluationStrategy: AllTestsMethodsRunningMutantEvaluationStrategy new.
	trivialAnalysis generateResults.
	1halt.
	
	^ mutations
]
