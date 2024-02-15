Class {
	#name : 'MTMatrix',
	#superclass : 'Dictionary',
	#instVars : [
		'mutations',
		'testCases',
		'analysis',
		'classesToMutate',
		'testClasses'
	],
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'instance creation' }
MTMatrix class >> forClasses: aCollectionOfClasses [

	^ self
		  forClasses: aCollectionOfClasses
		  andTests: (aCollectionOfClasses collect: [ :class |
				   class name , 'Test' asClassInEnvironment:
					   self class environment ])
]

{ #category : 'instance creation' }
MTMatrix class >> forClasses: aCollectionOfClasses andTests: aCollectionOfTests [

	^ self new
		  classesToMutate: aCollectionOfClasses;
		  testClasses: aCollectionOfTests
]

{ #category : 'instance creation' }
MTMatrix class >> forPackages: aCollectionOfPackages [

	^ self
		  forPackages: aCollectionOfPackages
		  andTestPackages:
		  (aCollectionOfPackages collect: [ :package | package , '-Tests' ])
]

{ #category : 'instance creation' }
MTMatrix class >> forPackages: aCollectionOfPackages andTestPackages: aCollectionOfTestPackages [

	^ self new
		  classesToMutate: (aCollectionOfPackages
				   inject: OrderedCollection new
				   into: [ :coll :package |
					   coll addAll: package asPackage definedClasses.
					   coll ]);
		  testClasses: (aCollectionOfTestPackages
				   inject: OrderedCollection new
				   into: [ :testColl :testPackage |
					   testColl addAll:
							   (testPackage asPackage definedClasses select: #isTestCase) ])
]

{ #category : 'adding' }
MTMatrix >> addMutantSetsIn: aCollection using: aSymbol [

	mutations do: [ :mutant1 |
		| mutantSet |
		mutantSet := Set with: mutant1.
		mutations do: [ :mutant2 |
			(self mutantOperation: aSymbol with: mutant1 and: mutant2) ifTrue: [
				mutantSet add: mutant2 ] ].
		mutantSet size > 1 ifTrue: [
			aCollection species = Dictionary
				ifTrue: [ aCollection at: mutant1 put: mutantSet ]
				ifFalse: [ aCollection add: mutantSet ] ] ]
]

{ #category : 'accessing' }
MTMatrix >> analysis [

	^ analysis
]

{ #category : 'comparing' }
MTMatrix >> booleanCollection1: collection1 equalsBooleanCollection2: collection2 [

	collection1 size = collection2 size ifFalse: [ ^ false ].
	1 to: collection1 size do: [ :i |
		((collection1 at: i) eqv: (collection2 at: i)) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'comparing' }
MTMatrix >> booleanCollection1: collection1 includesBooleanCollection2: collection2 [

	collection1 size = collection2 size ifFalse: [ ^ false ].
	(collection2 select: [ :bool | bool ]) isEmpty ifTrue: [ ^ false ].
	1 to: collection1 size do: [ :i |
		((collection1 at: i) and: [ (collection2 at: i) not ]) ifFalse: [
			((collection1 at: i) eqv: (collection2 at: i)) ifFalse: [ ^ false ] ] ].
	^ true
]

{ #category : 'building' }
MTMatrix >> build [

	self runAnalysis.
	mutations do: [ :mut |
		self
			at: mut
			put:
			(testCases collect: [ :test |
				 (self failuresFor: mut) includes: test ]) ]
]

{ #category : 'accessing' }
MTMatrix >> classesToMutate [

	^ classesToMutate
]

{ #category : 'accessing' }
MTMatrix >> classesToMutate: aClass [

	classesToMutate := aClass
]

{ #category : 'as yet unclassified' }
MTMatrix >> dataForTests: testCollection andMutations: mutationCollection [

	| totalNumberOfTests numberOfFailuresCollection killedCount |
	totalNumberOfTests := testCollection size * mutationCollection size.
	numberOfFailuresCollection := mutationCollection collect: [ :mutation |
		                              ((self failuresFor: mutation) select: [
			                               :testCase |
			                               testCase testCaseClass
			                               =
			                               (testCollection at: 1) testCaseClass ])
			                              size ].
	killedCount := numberOfFailuresCollection fold: [ :num1 :num2 |
		               num1 + num2 ].
	^ (killedCount / totalNumberOfTests * 100) asInteger
]

{ #category : 'as yet unclassified' }
MTMatrix >> dataMatrixForTests: testDictionary andMutations: mutationDictionary [

	^ (mutationDictionary collect: [ :mutationCollection |
		   (testDictionary collect: [ :testCollection |
			    self
				    dataForTests: testCollection
				    andMutations: mutationCollection ]) asArray ]) asArray
]

{ #category : 'accessing' }
MTMatrix >> equivalentMutants [

	| equivalentMutants |
	equivalentMutants := Set new.

	self addMutantSetsIn: equivalentMutants using: #equals.

	^ equivalentMutants
]

{ #category : 'computing' }
MTMatrix >> evaluationResultFor: aMutant [

	^ (analysis mutantResults detect: [ :evaluationResult |
		   evaluationResult mutant = aMutant ]) result
]

{ #category : 'rendering' }
MTMatrix >> failingTestsFor: aMutation [

	| indicies testResults |
	indicies := OrderedCollection new.
	testResults := self at: aMutation.
	1 to: testResults size do: [ :i |
	(testResults at: i) ifTrue: [ indicies add: i ] ].

	^ testCases select: [ :test |
		  indicies includes: (testCases indexOf: test) ]
]

{ #category : 'computing' }
MTMatrix >> failuresFor: aMutant [

	^ (self evaluationResultFor: aMutant) defects asOrderedCollection collect: [ :each |
		  MTTestCaseReference for: each selector in: each class ]
]

{ #category : 'rendering' }
MTMatrix >> generateHeatmap [

	| heatmap mutationDictionary testDictionary |
	mutationDictionary := mutations groupedBy: [ :mutation |
		                      mutation operator species ].
	testDictionary := testCases groupedBy: #testCaseClass.

	heatmap := self initializeHeatmap.

	heatmap objectsX: testClasses.
	heatmap objectsY: mutationDictionary keys.
	heatmap dataMatrix: (self
			 dataMatrixForTests: testDictionary
			 andMutations: mutationDictionary).

	heatmap open
]

{ #category : 'rendering' }
MTMatrix >> generateMatrix [

	| matrix |
	matrix := RSDSM new.
	matrix objectsX: testCases.
	matrix objectsY: mutations.
	matrix setShouldFeedY.
	matrix dependency: [ :mutation | self failingTestsFor: mutation ].
	matrix open
]

{ #category : 'accessing' }
MTMatrix >> includedMutants [

	| includedMutants |
	includedMutants := Dictionary new.

	self addMutantSetsIn: includedMutants using: #includes.

	^ includedMutants
]

{ #category : 'initialization' }
MTMatrix >> initializeHeatmap [

	| heatmap |
	heatmap := RSHeatmap new.
	heatmap labelShapeCell labelShape bold.
	heatmap shape extent: 50 @ 20.
	^ heatmap
]

{ #category : 'comparing' }
MTMatrix >> mutant1: mutant1 equalsMutant2: mutant2 [

	^ self
		  booleanCollection1: (self at: mutant1)
		  equalsBooleanCollection2: (self at: mutant2)
]

{ #category : 'comparing' }
MTMatrix >> mutant1: mutant1 includesMutant2: mutant2 [

	^ self
		  booleanCollection1: (self at: mutant1)
		  includesBooleanCollection2: (self at: mutant2)
]

{ #category : 'computing' }
MTMatrix >> mutantOperation: aSymbol with: mutant1 and: mutant2 [

	aSymbol = #equals ifTrue: [
		^ self mutant1: mutant1 equalsMutant2: mutant2 ].
	aSymbol = #includes ifTrue: [
		^ self mutant1: mutant1 includesMutant2: mutant2 ]
]

{ #category : 'accessing' }
MTMatrix >> mutations [

	^ mutations
]

{ #category : 'accessing' }
MTMatrix >> mutations: anObject [

	mutations := anObject
]

{ #category : 'running' }
MTMatrix >> runAnalysis [

	analysis := MTAnalysis new
		            classesToMutate: classesToMutate;
		            testClasses: testClasses;
		            doNotStopOnErrorOrFail.
	analysis run.
	testCases := analysis testCases.
	mutations := analysis mutations
]

{ #category : 'accessing' }
MTMatrix >> testCases [

	^ testCases
]

{ #category : 'accessing' }
MTMatrix >> testClasses [

	^ testClasses
]

{ #category : 'accessing' }
MTMatrix >> testClasses: aTestClass [

	testClasses := aTestClass
]

{ #category : 'accessing' }
MTMatrix >> trivialMutants [

	^ self keys select: [ :mutant |
		  (self at: mutant) fold: [ :bool1 :bool2 | bool1 and: bool2 ] ]
]
