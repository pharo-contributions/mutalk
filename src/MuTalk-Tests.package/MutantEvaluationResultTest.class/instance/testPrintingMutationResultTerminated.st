testing - printing
testPrintingMutationResultTerminated
	"printing a mutation result terminated."
	| result stream |
	result := resource evaluationResultForTerminatedMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents