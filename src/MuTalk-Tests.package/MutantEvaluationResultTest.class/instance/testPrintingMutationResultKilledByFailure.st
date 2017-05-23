testing - printing
testPrintingMutationResultKilledByFailure
	"printing a mutation result killed by failure."
	| result stream |
	result := resource evaluationResultForKilledMutantByFailure.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents