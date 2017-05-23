testing - printing
testPrintingOnEmptyResult
	"Test printing an empty general result"
	| emptyResult stream|
	emptyResult := self mutationEngineGeneralEmptyResult.
	stream := WriteStream with: '0 mutants, 0 killed, 0 alive, 0 terminated. Mutation Score: 0%.'.
	self assert: emptyResult printString = stream contents.