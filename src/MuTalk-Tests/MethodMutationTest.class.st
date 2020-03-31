Class {
	#name : #MethodMutationTest,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #'testing accessing' }
MethodMutationTest >> testAccessing [
	| compiledMethod operator modifiedSource methodMutation |
	compiledMethod := AuxiliarClassForMutationTestingAnalysis
		>> #methodWithOnePlusSender.
	operator := ReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		modifiedSourceFor: compiledMethod
		number: 1.
	methodMutation := MethodMutation
		for: compiledMethod
		using: operator
		result: modifiedSource
		ofClass: AuxiliarClassForMutationTestingAnalysis.
	self
		assert: methodMutation originalSource = compiledMethod sourceCode asString.
	self
		assert: methodMutation originalClass = AuxiliarClassForMutationTestingAnalysis.
	self assert: methodMutation modifiedSource = modifiedSource
]

{ #category : #'testing accessing' }
MethodMutationTest >> testAccessingToNodes [
	|compiledMethod operator modifiedSource methodMutation|
	
	compiledMethod := AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender.
	operator := ReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator modifiedSourceFor: compiledMethod number: 1. 
	methodMutation := MethodMutation 
		for: compiledMethod 
		using: operator 
		result: modifiedSource 
		ofClass: AuxiliarClassForMutationTestingAnalysis.
		
	self assert: methodMutation nodeToMutate formattedCode = '1 + 2'.
	self assert: methodMutation mutatedNode formattedCode = '1 - 2'.

]

{ #category : #tests }
MethodMutationTest >> testMutatedNodeBugFix [
	| method m |
	method := ClassForTestingCoverage class>>#new:.

	m := (ReplaceIdentityWithNegationOfIdentity new mutationsFor: method) first.
	self shouldnt: [ m mutatedNode ] raise:  SubscriptOutOfBounds 
	
]
