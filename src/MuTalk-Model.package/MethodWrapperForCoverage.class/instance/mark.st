private
mark
	|currentTest|
	super mark.
	currentTest := coverageAnalysis currentTest.
	currentTest ifNotNil: [tests add: currentTest]. 
	
