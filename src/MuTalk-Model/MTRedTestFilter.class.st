Class {
	#name : 'MTRedTestFilter',
	#superclass : 'MTTestFilter',
	#category : 'MuTalk-Model-Test filters',
	#package : 'MuTalk-Model',
	#tag : 'Test filters'
}

{ #category : 'enumerating' }
MTRedTestFilter >> filterTests: aTestCaseCollection withResults: results [

	| dictionary |
	dictionary := Dictionary
		              newFromKeys: aTestCaseCollection
		              andValues: results.
	^ dictionary keys select: [ :key |
		  | result |
		  result := dictionary at: key.
		  result unexpectedFailureCount = 0 and: [
			  result unexpectedErrorCount = 0 ] ]
]
