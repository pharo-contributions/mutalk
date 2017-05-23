logging
logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator 
	self writeLineToFile: 'Generating mutations for '
			, (self methodNameOf: aCompiledMethod) , '  With operator:' , aMutantOperator description