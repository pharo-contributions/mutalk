testing accessing
testAccessing
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