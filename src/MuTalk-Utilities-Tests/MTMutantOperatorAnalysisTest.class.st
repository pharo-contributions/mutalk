Class {
	#name : 'MTMutantOperatorAnalysisTest',
	#superclass : 'TestCase',
	#instVars : [
		'operatorAnalysis'
	],
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'running' }
MTMutantOperatorAnalysisTest >> setUp [

	super setUp.

	operatorAnalysis := MTMutantOperatorAnalysis forClasses:
		                    { MTAuxiliarClassForMutantOperatorAnalysis }
]

{ #category : 'tests' }
MTMutantOperatorAnalysisTest >> testGetAllOperators [

	| actual expected |
	actual := (operatorAnalysis operatorsProducingOverXMutants: 0) keys
		          asSet.
	expected := (MTMutantOperator contentsAll collect: #species) asSet.

	self assert: actual equals: expected
]

{ #category : 'tests' }
MTMutantOperatorAnalysisTest >> testOperatorsProducingOver [

	| actual expected |
	actual := (operatorAnalysis operatorsProducingOverXMutants: 3) keys
		          asSet.
	expected := Set
		            with: MTLiteralIntegersIncreaseOperator
		            with: MTLiteralIntegersToZeroOperator
		            with: MTLiteralIntegersDecreaseOperator.

	self assert: actual equals: expected
]

{ #category : 'tests' }
MTMutantOperatorAnalysisTest >> testOperatorsProducingUnder [

	| actual expected |
	actual := (operatorAnalysis operatorsProducingUnderXMutants: 2) keys
		          asSet.
	expected := (MTMutantOperator contentsAll collect: #species) asSet
		            reject: [ :operator |
			            {
				            MTLiteralIntegersIncreaseOperator.
				            MTLiteralIntegersToZeroOperator.
				            MTLiteralIntegersDecreaseOperator } includes: operator ].

	self assert: actual equals: expected
]
