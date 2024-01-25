Class {
	#name : 'MTMutantOperatorAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'tests' }
MTMutantOperatorAnalysisTest >> testGetAllOperators [

	| actual expected |
	actual := (MTMutantOperatorAnalysis new
		           operatorsProducingOver: 0
		           mutantsFor: { 'MuTalk-Utilities-Tests' }) keys asSet.
	expected := (MTMutantOperator contentsAll collect: #species) asSet.

	self assert: actual equals: expected
]

{ #category : 'tests' }
MTMutantOperatorAnalysisTest >> testOperatorsProducingOver [

	| actual expected |
	actual := (MTMutantOperatorAnalysis new
		           operatorsProducingOver: 3
		           mutantsFor: { 'MuTalk-Utilities-Tests' }) keys asSet.
	expected := Set
		            with: MTEmptyMethodOperator
		            with: MTRemoveCaretOperator
		            with: MTMessageSendToYourselfOperator.

	self assert: actual equals: expected
]

{ #category : 'tests' }
MTMutantOperatorAnalysisTest >> testOperatorsProducingUnder [

	| actual expected |
	actual := (MTMutantOperatorAnalysis new
		           operatorsProducingUnder: 3
		           mutantsFor: { 'MuTalk-Utilities-Tests' }) keys asSet.
	expected := (MTMutantOperator contentsAll collect: #species) asSet
		            reject: [ :operator |
			            {
				            MTEmptyMethodOperator.
				            MTMessageSendToYourselfOperator } includes: operator ].

	self assert: actual equals: expected
]
