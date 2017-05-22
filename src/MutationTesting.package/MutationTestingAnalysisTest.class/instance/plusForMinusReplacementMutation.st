accessing
plusForMinusReplacementMutation
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be an Arithmetic
	Replacement (Plus for Minus)."
	| operator |
	operator := ReplacePlusWithMinusMutantOperator new.
	^ OrderedCollection with: operator