testing - printing
testPrintingWithOnlyOneAliveMutant
	"printing a mutation general result with only one alive mutant."
	| oneKilledMutantResult stream|
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneAliveMutant.
	stream := WriteStream with: '1 mutants, 0 killed, 1 alive, 0 terminated. Mutation Score: 0%.'.
	self assert: oneKilledMutantResult printString = stream contents.