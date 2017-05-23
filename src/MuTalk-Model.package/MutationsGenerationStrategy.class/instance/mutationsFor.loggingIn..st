generating
mutationsFor: aMutationTestingAnalysis loggingIn: aLogger 
	| mutations |
	mutations := OrderedCollection new.
	(self methodsToMutateFrom: aMutationTestingAnalysis) 
		do: 
			[ :aMethod | 
			mutations addAll: (self 
					mutationsFor: aMethod
					usingAll: aMutationTestingAnalysis operators
					logginIn: aLogger) ]
		displayingProgress: 'Building Mutants'.
	^ mutations