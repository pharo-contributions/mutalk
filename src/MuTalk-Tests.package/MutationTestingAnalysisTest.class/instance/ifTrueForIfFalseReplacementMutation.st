accessing
ifTrueForIfFalseReplacementMutation
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be a boolean Replacement (ifTrue for ifFalse)."
	| operator |
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	^ OrderedCollection with: operator