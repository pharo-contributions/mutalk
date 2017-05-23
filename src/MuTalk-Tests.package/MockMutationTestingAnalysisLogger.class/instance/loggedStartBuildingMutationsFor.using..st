testing
loggedStartBuildingMutationsFor: aCompiledMethod using: aMutantOperator
	^loggedStartBuildingMutations anySatisfy:[:array | (array at:1 ) = aCompiledMethod and:[(array at:2) = aMutantOperator ]]  
	