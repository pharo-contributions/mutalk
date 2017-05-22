as yet unclassified
allTestsFromPackage
	^ (OrderedCollection
		with: TestClassForTestingCoverage
		with: AuxiliarTestClassForTestingStrategies
		with: AuxiliarClassForMutationTestingAnalysisTest)
		inject: OrderedCollection new
		into: [:tests :testClass | 
			tests addAll: testClass suite tests.
			tests]