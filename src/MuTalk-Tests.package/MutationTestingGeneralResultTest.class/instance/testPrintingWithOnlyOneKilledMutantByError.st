testing - printing
testPrintingWithOnlyOneKilledMutantByError
	"printing a mutation general result with one mutant killed by error."
	| oneKilledMutantResult stream|
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneKilledMutantByError.
	stream := WriteStream with: '1 mutants, 1 killed, 0 alive, 0 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents.