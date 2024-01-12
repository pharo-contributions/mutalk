Class {
	#name : 'MTMethodMutationTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'tests' }
MTMethodMutationTest >> simpleTestCaseRessource [
	self assert: 1 + 1 equals: 2
]

{ #category : 'testing accessing' }
MTMethodMutationTest >> testAccessing [

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
		                  nodeNumber: 1
		                  ofClass: AuxiliarClassForMutationTestingAnalysis.
	self
		assert: methodMutation originalSource
		equals: compiledMethod sourceCode asString.
	self assert:
		methodMutation originalClass
		= AuxiliarClassForMutationTestingAnalysis.
	self assert: methodMutation modifiedSource equals: modifiedSource
]

{ #category : 'testing accessing' }
MTMethodMutationTest >> testAccessingToNodes [
	|compiledMethod operator modifiedSource methodMutation|
	
	compiledMethod := AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender.
	operator := ReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator modifiedSourceFor: compiledMethod number: 1. 
	methodMutation := MethodMutation 
		for: compiledMethod 
		using: operator 
		nodeNumber: 1
		ofClass: AuxiliarClassForMutationTestingAnalysis.
		
	self assert: methodMutation nodeToMutate formattedCode = '1 + 2'.
	self assert: methodMutation mutatedNode formattedCode = '1 - 2'.

]

{ #category : 'tests' }
MTMethodMutationTest >> testMutatedNodeBugFix [
	| method m |
	method := ClassForTestingCoverage class>>#new:.

	m := (ReplaceIdentityWithNegationOfIdentity new mutationsFor: method) first.
	self shouldnt: [ m mutatedNode ] raise:  SubscriptOutOfBounds 
	
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutationInfiniteLoop [

	| compiledMethod operator modifiedSource methodMutation res |
	
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.
	
	compiledMethod := FakeInfiniteLoopForTest >> #iterativeFactorial:.
	operator := ReplaceLessOrEqualWithTrueOperator new.
	
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: FakeInfiniteLoopForTest.

	methodMutation testCaseReferences: { (TestCaseReference
			 for: #testIterativeFactorial
			 in: FakeInfiniteLoopsTest) }.

	res := methodMutation runMutantStoppingOnError: true.

	self assert: res errors size equals: 1
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutationInfiniteRecursion [

	| compiledMethod operator modifiedSource methodMutation res |
	
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.
	
	compiledMethod := FakeInfiniteLoopForTest >> #recursiveFactorial:.
	operator := ReplaceIfTrueReceiverWithFalseOperator new.
	
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: FakeInfiniteLoopForTest.

	methodMutation testCaseReferences: { (TestCaseReference
			 for: #testRecursiveFactorial
			 in: FakeInfiniteLoopsTest) }.

	res := methodMutation runMutantStoppingOnError: true.

	self assert: res errors size equals: 1
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutationRun [
	| compiledMethod operator modifiedSource methodMutation res |
	compiledMethod := AuxiliarClassForMutationTestingAnalysis
		>> #methodWithOnePlusSender.
	operator := ReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		modifiedSourceFor: compiledMethod
		number: 1.
	methodMutation := MethodMutation
		for: compiledMethod
		using: operator
		nodeNumber: 1
		ofClass: AuxiliarClassForMutationTestingAnalysis.
	methodMutation testCaseReferences: { TestCaseReference for: #simpleTestCaseRessource in: self class }.
	res := methodMutation runMutantStoppingOnError: true.

	self assert: res runCount equals: 1
]
