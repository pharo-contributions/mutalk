Class {
	#name : #MTMethodMutationTest,
	#superclass : #TestCase,
	#category : 'MuTalk-Tests'
}

{ #category : #tests }
MTMethodMutationTest >> simpleTestCaseRessource [
	self assert: 1 + 1 equals: 2
]

{ #category : #'testing accessing' }
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

{ #category : #'testing accessing' }
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

{ #category : #tests }
MTMethodMutationTest >> testMutatedNodeBugFix [
	| method m |
	method := MTClassForTestingCoverage class>>#new:.

	m := (MTReplaceIdentityWithNegationOfIdentity new mutationsFor: method) first.
	self shouldnt: [ m mutatedNode ] raise:  SubscriptOutOfBounds 
	
]

{ #category : #tests }
MTMethodMutationTest >> testMutationInfiniteLoop [

	| compiledMethod operator modifiedSource methodMutation res testCase |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit + (Duration milliSeconds: 10).

	compiledMethod := MTFakeInfiniteLoopForTest >> #iterativeFactorial:.
	testCase := MTFakeInfiniteLoopsTest selector: #testIterativeFactorial.
	operator := MTReplaceLessOrEqualWithTrueOperator new.

	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.

	methodMutation testCaseReferences:
		{ (MTTestCaseReference for: testCase) }.

	res := methodMutation runMutantStoppingOnError: true in: nil.

	self assert: res result errors size equals: 1
]

{ #category : #tests }
MTMethodMutationTest >> testMutationInfiniteRecursion [

	| compiledMethod operator modifiedSource methodMutation res testCase |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit + (Duration milliSeconds: 10).

	compiledMethod := MTFakeInfiniteLoopForTest >> #recursiveFactorial:.
	testCase := MTFakeInfiniteLoopsTest selector: #testRecursiveFactorial.
	operator := MTReplaceIfTrueReceiverWithFalseOperator new.

	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.

	methodMutation testCaseReferences:
		{ (MTTestCaseReference for: testCase) }.

	res := methodMutation runMutantStoppingOnError: true in: nil.

	self assert: res result errors size equals: 1
]

{ #category : #tests }
MTMethodMutationTest >> testMutationNotInstalling [

	| methodMutation res mutantEvaluation testCase |
	testCase := MTFakeInfiniteLoopsTest selector: #testRecursiveFactorial.
	methodMutation := MTFailedInstallMethodMutation
		                  for:
		                  MTFakeInfiniteLoopForTest >> #iterativeFactorial:
		                  using: MTReplaceLessOrEqualWithTrueOperator new
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.


	mutantEvaluation := MTMutantEvaluation
		                    for: methodMutation
		                    using: { (MTTestCaseReference for: testCase) }
		                    following:
		                    MTAllTestsMethodsRunningTestSelectionStrategy
			                    new
		                    andConsidering: nil.
	res := mutantEvaluation valueStoppingOnError: true.

	self assert: res terminated
]

{ #category : #tests }
MTMethodMutationTest >> testMutationNotRunning [

	| methodMutation res mutantEvaluation testCase |
	testCase := MTFakeInfiniteLoopsTest selector: #testRecursiveFactorial.
	methodMutation := MTFailedRunMethodMutation
		                  for:
		                  MTFakeInfiniteLoopForTest >> #iterativeFactorial:
		                  using: MTReplaceLessOrEqualWithTrueOperator new
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.


	mutantEvaluation := MTMutantEvaluation
		                    for: methodMutation
		                    using: { (MTTestCaseReference for: testCase) }
		                    following:
		                    MTAllTestsMethodsRunningTestSelectionStrategy
			                    new
		                    andConsidering: nil.
	res := mutantEvaluation valueStoppingOnError: true.

	self assert: res terminated
]

{ #category : #tests }
MTMethodMutationTest >> testMutationNotUninstalling [

	| methodMutation res mutantEvaluation testCase |
	testCase := MTFakeInfiniteLoopsTest selector: #testRecursiveFactorial.
	methodMutation := MTFailedUninstallMethodMutation
		                  for:
		                  MTFakeInfiniteLoopForTest >> #iterativeFactorial:
		                  using: MTReplaceLessOrEqualWithTrueOperator new
		                  nodeNumber: 1
		                  ofClass: MTFakeInfiniteLoopForTest.


	mutantEvaluation := MTMutantEvaluation
		                    for: methodMutation
		                    using: { (MTTestCaseReference for: testCase) }
		                    following:
		                    MTAllTestsMethodsRunningTestSelectionStrategy
			                    new
		                    andConsidering: nil.
	res := mutantEvaluation valueStoppingOnError: true.

	self assert: res terminated
]

{ #category : #tests }
MTMethodMutationTest >> testMutationRun [

	| compiledMethod operator modifiedSource methodMutation res testCase |
	compiledMethod := MTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	testCase := self class selector: #simpleTestCaseRessource.
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
		{ (MTTestCaseReference for: testCase) }.
	res := methodMutation runMutantStoppingOnError: true in: nil.

	self assert: res runCount equals: 1
]
