accessing
minusForPlusReplacementMutation
	"Return a Collection with a Mutation Operation to be applied to the method in MutationTestingAuxiliarClass. 
	In this case, the operation will be an Arithmetic Replacement (Minus for Plus)."
	| operator |
	operator := ReplaceMinusWithPlusMutantOperator new.
	^ OrderedCollection with: operator