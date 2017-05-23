testing - printing
testPrintingWithOnlyOneTerminatedMutant
	"printing a mutation general result with one mutant terminated."
	| oneKilledMutantResult stream |
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneTerminatedMutant.
	stream := WriteStream with: '1 mutants, 0 killed, 0 alive, 1 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents