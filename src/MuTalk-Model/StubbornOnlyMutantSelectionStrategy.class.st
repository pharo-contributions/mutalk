Class {
	#name : 'StubbornOnlyMutantSelectionStrategy',
	#superclass : 'SelectingFromCoverageMutantSelectionStrategy',
	#category : 'MuTalk-Model-Mutant selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'Mutant selection strategies'
}

{ #category : 'generating' }
StubbornOnlyMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations subSuite trivialAnalysis |
	mutations := super mutationsFor: aMutationTestingAnalysis loggingIn: aLogger.
	
	
	1halt.
	subSuite := CoverageTestSuiteSelector new
		selectTestsFrom: aMutationTestingAnalysis.
	
	"subSuite := (1 to: 15) collect: [ :e | aMutationTestingAnalysis testCases atRandom ]."
	trivialAnalysis := aMutationTestingAnalysis copy.
	trivialAnalysis
		testClasses: subSuite;
		mutations: mutations;
		testSelectionStrategy: AllTestsMethodsRunningTestSelectionStrategy new.
	trivialAnalysis generateResults.
	1halt.
	
	^ mutations
]
