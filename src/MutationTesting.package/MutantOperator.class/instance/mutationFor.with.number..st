private
mutationFor: aCompiledMethod with: aParseTree number: aNumberOfSelector 
	^ MethodMutation 
		for: aCompiledMethod
		using: self
		result: (self 
				modifiedSourceFor: aCompiledMethod
				with: aParseTree
				number: aNumberOfSelector)
		ofClass: aCompiledMethod methodClass