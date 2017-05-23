testing accessing
testAccessingToNodes
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
