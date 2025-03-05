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

{ #category : 'computing' }
MTMatrix >> dataForTests: testCollection andMutations: mutationCollection [

	| totalNumberOfTestsExecuted numberOfFailuresCollection totalNumberOfFailures |
	totalNumberOfTestsExecuted := testCollection size
	                              * mutationCollection size.
	numberOfFailuresCollection := mutationCollection collect: [ :mutation |
		                              | testClass |
		                              "We know that all tests from testCollection are from the same class"
		                              testClass := testCollection atRandom
			                                           testCaseClass.
		                              (self
			                               failuresFor: mutation
			                               andTestClass: testClass) size ].
	totalNumberOfFailures := numberOfFailuresCollection fold: [ :num1 :num2 |
		                         num1 + num2 ].
	^ (totalNumberOfFailures / totalNumberOfTestsExecuted * 100)
		  asInteger
]

{ #category : 'computing' }
MTMatrix >> dataMatrixForTests: testDictionary andMutations: mutationDictionary [

	^ mutationDictionary values collect: [ :mutationCollection |
		  testDictionary values collect: [ :testCollection |
			  self
				  dataForTests: testCollection
				  andMutations: mutationCollection ] ]
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

	^ (self evaluationResultFor: aMutant) defects asOrderedCollection
		  collect: [ :each | MTTestCaseReference for: each ]
]

{ #category : 'computing' }
MTMatrix >> failuresFor: aMutation andTestClass: aTestClass [

	^ (self failuresFor: aMutation) select: [ :testCase |
		  testCase testCaseClass = aTestClass ]
]

{ #category : 'rendering' }
MTMatrix >> generateHeatmapWithMutationsGroupedBy: aBlock [

	| heatmap mutationDictionary testDictionary |
	mutationDictionary := mutations groupedBy: aBlock.
	testDictionary := testCases groupedBy: #testCaseClass.

	heatmap := self initializeHeatmap.

	heatmap objectsX: testClasses.
	heatmap objectsY: mutationDictionary keys.
	heatmap dataMatrix: (self
			 dataMatrixForTests: testDictionary
			 andMutations: mutationDictionary).
	"the data change the color palette domain, but we want it to be from 0 to 100"
	heatmap colorPalette domain: { 0. 50. 100 }.

	heatmap open
]

{ #category : 'rendering' }
MTMatrix >> generateHeatmapWithMutationsGroupedByClass [

	self generateHeatmapWithMutationsGroupedBy: [ :mutation |
		mutation originalClass ]
]

{ #category : 'rendering' }
MTMatrix >> generateHeatmapWithMutationsGroupedByMethod [

	self generateHeatmapWithMutationsGroupedBy: [ :mutation |
		mutation originalMethod name ]
]

{ #category : 'rendering' }
MTMatrix >> generateHeatmapWithMutationsGroupedByOperator [

	self generateHeatmapWithMutationsGroupedBy: [ :mutation |
		mutation operator species ]
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
	heatmap colorPalette: (NSScale linear range: {
				 Color red.
				 Color yellow.
				 Color green }).
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

	analysis ifNil: [ self setUpAnalysis ].
	analysis run.
	testCases := analysis testCases.
	mutations := analysis mutations
]

{ #category : 'initialization' }
MTMatrix >> setUpAnalysis [

	analysis := MTAnalysis new
		            classesToMutate: classesToMutate;
		            testClasses: testClasses;
		            doNotStopOnErrorOrFail
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
