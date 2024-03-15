Class {
	#name : #MTTestCasesSelectionStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> allTestsFromPackage [

	^ (OrderedCollection withAll: {
			   MTTestClassForTestingCoverage.
			   MTAuxiliarTestClassForTestingStrategies.
			   MTAuxiliarClassForMTAnalysisTest.
			   MTAuxiliarTestClassForMTBudget.
			   MTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail.
			   MTAuxiliarClassForTimeTestFilterTest.
			   MTAuxiliarTestClassForBlockTestFilter.
			   MTAuxiliarTestClassForPragmaTestFilter.
			   MTAuxiliarTestClassForRedTestFilter.
			   MTAuxiliarParametrizedTestClass })
		  inject: OrderedCollection new
		  into: [ :tests :testClass |
			  tests addAll: testClass suite tests.
			  tests ]
]

{ #category : #'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> allTestsIn: aCollection areIncludedIn: anotherCollection [

	^ ((aCollection collect: [ :testCase | testCase selector ]) 
		   includesAll:
		   (anotherCollection collect: [ :testCase | testCase selector ])) 
		  and: [ 
			  (anotherCollection collect: [ :testCase | testCase selector ]) 
				  includesAll:
				  (aCollection collect: [ :testCase | testCase selector ]) ]
]

{ #category : #'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategy [
	| testCase |
	testCase := MTTestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (MTClassTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: MTTestClassForTestingCoverage suite tests)
]

{ #category : #'testing-class' }
MTTestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (MTClassTestCasesSelectionStrategy new testCasesFor: OrderedCollection new) isEmpty
]

{ #category : #'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategy [

	| testCase |
	testCase := MTTestClassForTestingCoverage selector: #testCase1.
	self
		assert: (MTNoneTestCasesSelectionStrategy new testCasesFor:
				 (OrderedCollection with: testCase))
		equals: (OrderedCollection with: testCase)
]

{ #category : #'testing-none' }
MTTestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (MTNoneTestCasesSelectionStrategy new testCasesFor:
			 OrderedCollection new) isEmpty
]

{ #category : #'as yet unclassified' }
MTTestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategy [

	| testCase |
	testCase := MTTestClassForTestingCoverage selector: #testCase1.
	self assert: (self
			 allTestsIn:
				 (MTPackageTestCasesSelectionStrategy new testCasesFor:
					  (OrderedCollection with: testCase))
			 areIncludedIn: self allTestsFromPackage)
]

{ #category : #'testing-package' }
MTTestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (MTPackageTestCasesSelectionStrategy new testCasesFor:
			 OrderedCollection new) isEmpty
]
