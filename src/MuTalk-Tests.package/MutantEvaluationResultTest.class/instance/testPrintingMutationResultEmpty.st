testing - printing
testPrintingMutationResultEmpty
	"printing a mutation result empty."
	| result stream |
	result := resource evaluationResultEmpty.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents