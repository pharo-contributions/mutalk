Class {
	#name : 'MTTestCasesSelectionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> allTestsFromPackage [
	^ (OrderedCollection
		with: TestClassForTestingCoverage
		with: AuxiliarTestClassForTestingStrategies
		with: AuxiliarClassForMutationTestingAnalysisTest
		with: AuxiliarTestClassForMTBudget
		with: AuxiliarTestClassForContinuingTestsExecutionAfterFirstFail)
		inject: OrderedCollection new
		into: [:tests :testClass | 
			tests addAll: testClass suite tests.
			tests]
]

{ #category : 'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> allTestsIn: aCollection areIncludedIn: anotherCollection [

	^ ((aCollection collect: [ :testCase | testCase selector ]) 
		   includesAll:
		   (anotherCollection collect: [ :testCase | testCase selector ])) 
		  and: [ 
			  (anotherCollection collect: [ :testCase | testCase selector ]) 
				  includesAll:
				  (aCollection collect: [ :testCase | testCase selector ]) ]
]

{ #category : 'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategy [
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (ClassTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: TestClassForTestingCoverage suite tests)
]

{ #category : 'testing-class' }
MTTestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (ClassTestCasesSelectionStrategy new testCasesFor: OrderedCollection new) isEmpty
]

{ #category : 'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategy [
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self assert: (NoneTestCasesSelectionStrategy new
			testCasesFor: (OrderedCollection with: testCase))
			= (OrderedCollection with: testCase)
]

{ #category : 'testing-none' }
MTTestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (NoneTestCasesSelectionStrategy new testCasesFor: OrderedCollection new ) isEmpty
]

{ #category : 'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategy [
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (PackageTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: (self allTestsFromPackage))
]

{ #category : 'testing-package' }
MTTestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (PackageTestCasesSelectionStrategy new testCasesFor: OrderedCollection new ) isEmpty
]
