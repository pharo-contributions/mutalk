accessing
ifFalseForIfTrueReplacementMutation
	"Return a Collection with a Mutation Operation to be applied to the AuxiliarClass. 
	In this case, the operation will be a boolean Replacement (ifFalse for ifTrue)."
	| operator |
	operator := ReplaceIfFalseWithIfTrueMutantOperator new.
	^ OrderedCollection with: operator