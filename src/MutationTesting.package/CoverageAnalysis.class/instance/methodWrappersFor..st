private
methodWrappersFor: methodReferences 
	^ methodReferences collect: [ :each | MethodWrapperForCoverage on: each for: self ]