building
buildTestResultWith: aBuilder 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #testResults;
		yourself.