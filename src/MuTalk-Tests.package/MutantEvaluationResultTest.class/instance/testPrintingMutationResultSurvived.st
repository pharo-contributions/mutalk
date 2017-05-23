testing - printing
testPrintingMutationResultSurvived
	"printing a mutation result alive."
	| result stream |
	result := resource evaluationResultForAliveMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents