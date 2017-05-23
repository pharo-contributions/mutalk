testing - printing
testPrintingMutationResultKilledByError
	"printing a mutation result killed by error."
	| result stream |
	result := resource evaluationResultForKilledMutantByError.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents