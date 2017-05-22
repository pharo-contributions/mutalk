building-private
mutation
	"Build Mock Object that simulates a Mutant"
	| method |
	method := self class >> #methodForBuildingMutant.
	^ MethodMutation 
		for: method
		using: ReplacePlusWithMinusMutantOperator new
		result: 'methodForBuildingMutant  ^ 1 - 2'
		ofClass: self class