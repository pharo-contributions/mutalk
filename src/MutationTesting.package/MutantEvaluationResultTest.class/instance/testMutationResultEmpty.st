testing
testMutationResultEmpty
	"Test the creation of a Mutant Result Empty."
	| result |
	result := resource evaluationResultEmpty.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 0