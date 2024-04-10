Class {
	#name : 'MTMatrixTest',
	#superclass : 'TestCase',
	#instVars : [
		'matrix',
		'trivialMutant',
		'equivalentMutants',
		'includedMutants'
	],
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'running' }
MTMatrixTest >> setUp [

	super setUp.
	matrix := MTMatrix forClasses: { MTAuxiliarClassForMatrix }.
	matrix setUpAnalysis.
	matrix analysis operators: MTAbstractMutantOperator contents.
	matrix build.
	self setUpVariablesForTest
]

{ #category : 'initialization' }
MTMatrixTest >> setUpVariablesForTest [

	| mutations minusMutants plusMutants |
	mutations := matrix analysis mutations.
	minusMutants := Set withAll: (mutations select: [ :mut |
			                 mut originalMethod
			                 = (MTAuxiliarClassForMatrix >> #minus:) ]).
	plusMutants := Set withAll: (mutations select: [ :mut |
			                mut originalMethod
			                = (MTAuxiliarClassForMatrix >> #plus:) ]).
	trivialMutant := Array with:
		                 (matrix analysis mutations detect: [ :mut |
			                  mut originalMethod
			                  = (MTAuxiliarClassForMatrix >> #reset) ]).
	equivalentMutants := Set with: minusMutants with: plusMutants.
	includedMutants := Dictionary new.
	mutations do: [ :mutant |
		mutant originalMethod = (MTAuxiliarClassForMatrix >> #minus:)
			ifTrue: [ includedMutants at: mutant put: minusMutants ].
		mutant originalMethod = (MTAuxiliarClassForMatrix >> #plus:)
			ifTrue: [ includedMutants at: mutant put: plusMutants ].
		mutant originalMethod = (MTAuxiliarClassForMatrix >> #reset)
			ifTrue: [ includedMutants at: mutant put: mutations asSet ] ]
]

{ #category : 'tests' }
MTMatrixTest >> testEqualBooleanCollections [

	| a1 a2 a3 a4 |
	a1 := #( false false true true true false ).
	a2 := #( false false true true true false ).
	a3 := #( false false true true false false ).
	a4 := #( false true true false ).

	self assert:
		(matrix booleanCollection1: a1 equalsBooleanCollection2: a2).
	self deny:
		(matrix booleanCollection1: a1 equalsBooleanCollection2: a3).
	self deny:
		(matrix booleanCollection1: a1 equalsBooleanCollection2: a4)
]

{ #category : 'tests' }
MTMatrixTest >> testEquivalentMutants [

	self assert: matrix equivalentMutants equals: equivalentMutants
]

{ #category : 'tests' }
MTMatrixTest >> testIncludeBooleanCollections [

	| a1 a2 a3 a4 a5 |
	a1 := #( false false true true true false ).
	a2 := #( false false true true true false ).
	a3 := #( false false true false false false ).
	a4 := #( true false true true false false ).
	a5 := #( false true true false ).

	self assert:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a2).
	self assert:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a3).
	self deny:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a4).
	self deny:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a5).
	self deny:
		(matrix booleanCollection1: a3 includesBooleanCollection2: a1)
]

{ #category : 'tests' }
MTMatrixTest >> testIncludedMutants [

	self assert: matrix includedMutants equals: includedMutants
]

{ #category : 'tests' }
MTMatrixTest >> testTrivialMutants [

	self assert: matrix trivialMutants equals: trivialMutant
]
