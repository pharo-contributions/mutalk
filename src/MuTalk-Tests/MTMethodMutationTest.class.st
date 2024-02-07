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
	compiledMethod := MTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	operator := MTReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTAuxiliarClassForMTAnalysis.
	self
		assert: methodMutation originalSource
		equals: compiledMethod sourceCode asString.
	self
		assert: methodMutation originalClass
		equals: MTAuxiliarClassForMTAnalysis.
	self assert: methodMutation modifiedSource equals: modifiedSource
]

{ #category : 'testing accessing' }
MTMethodMutationTest >> testAccessingToNodes [

	| compiledMethod operator modifiedSource methodMutation |
	compiledMethod := MTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	operator := MTReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTAuxiliarClassForMTAnalysis.
	self
		assert: methodMutation nodeToMutate formattedCode
		equals: '1 + 2'.
	self assert: methodMutation mutatedNode formattedCode equals: '1 - 2'
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutatedNodeBugFix [
	| method m |
	method := MTClassForTestingCoverage class>>#new:.

	m := (MTReplaceIdentityWithNegationOfIdentity new mutationsFor: method) first.
	self shouldnt: [ m mutatedNode ] raise:  SubscriptOutOfBounds 
	
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutationInfiniteLoop [

	| compiledMethod operator modifiedSource methodMutation res |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	compiledMethod := MTFakeInfiniteLoopForTest >> #iterativeFactorial:.
	operator := MTReplaceLessOrEqualWithTrueOperator new.

	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.

	methodMutation testCaseReferences: { (MTTestCaseReference
			 for: #testIterativeFactorial
			 in: MTFakeInfiniteLoopsTest) }.

	res := methodMutation runMutantStoppingOnError: true.

	self assert: res errors size equals: 1
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutationInfiniteRecursion [

	| compiledMethod operator modifiedSource methodMutation res |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	compiledMethod := MTFakeInfiniteLoopForTest >> #recursiveFactorial:.
	operator := MTReplaceIfTrueReceiverWithFalseOperator new.

	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.

	methodMutation testCaseReferences: { (MTTestCaseReference
			 for: #testRecursiveFactorial
			 in: MTFakeInfiniteLoopsTest) }.

	res := methodMutation runMutantStoppingOnError: true.

	self assert: res errors size equals: 1
]

{ #category : 'tests' }
MTMethodMutationTest >> testMutationRun [

	| compiledMethod operator modifiedSource methodMutation res |
	compiledMethod := MTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	operator := MTReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTAuxiliarClassForMTAnalysis.
	methodMutation testCaseReferences:
		{ (MTTestCaseReference for: #simpleTestCaseRessource in: self class) }.
	res := methodMutation runMutantStoppingOnError: true.

	self assert: res runCount equals: 1
]
