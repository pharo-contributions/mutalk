as yet unclassified
allTestsIn: aCollection areIncludedIn: anotherCollection 
	^ ((aCollection
			collect: [:testCase | testCase selector])
			includesAllOf: (anotherCollection
					collect: [:testCase | testCase selector]))
		and: [(anotherCollection
				collect: [:testCase | testCase selector])
				includesAllOf: (aCollection
						collect: [:testCase | testCase selector])]