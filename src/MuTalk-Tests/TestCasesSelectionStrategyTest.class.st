Class {
	#name : 'TestCasesSelectionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'as yet unclassified' }
TestCasesSelectionStrategyTest >> allTestsFromPackage [
	^ (OrderedCollection
		with: TestClassForTestingCoverage
		with: AuxiliarTestClassForTestingStrategies
		with: AuxiliarClassForMutationTestingAnalysisTest
		with: AuxiliarTestClassForMutationTestingBudget)
		inject: OrderedCollection new
		into: [:tests :testClass | 
			tests addAll: testClass suite tests.
			tests]
]

{ #category : 'as yet unclassified' }
TestCasesSelectionStrategyTest >> allTestsIn: aCollection areIncludedIn: anotherCollection [

	^ ((aCollection collect: [ :testCase | testCase selector ]) 
		   includesAll:
		   (anotherCollection collect: [ :testCase | testCase selector ])) 
		  and: [ 
			  (anotherCollection collect: [ :testCase | testCase selector ]) 
				  includesAll:
				  (aCollection collect: [ :testCase | testCase selector ]) ]
]

{ #category : 'as yet unclassified' }
TestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategy [
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (ClassTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: TestClassForTestingCoverage suite tests)
]

{ #category : 'testing-class' }
TestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (ClassTestCasesSelectionStrategy new testCasesFor: OrderedCollection new) isEmpty
]

{ #category : 'as yet unclassified' }
TestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategy [
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self assert: (NoneTestCasesSelectionStrategy new
			testCasesFor: (OrderedCollection with: testCase))
			= (OrderedCollection with: testCase)
]

{ #category : 'testing-none' }
TestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (NoneTestCasesSelectionStrategy new testCasesFor: OrderedCollection new ) isEmpty
]

{ #category : 'as yet unclassified' }
TestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategy [
	| testCase |
	testCase := TestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (PackageTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: (self allTestsFromPackage))
]

{ #category : 'testing-package' }
TestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (PackageTestCasesSelectionStrategy new testCasesFor: OrderedCollection new ) isEmpty
]
