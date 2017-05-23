building
buildLogTextBoxWith: aBuilder
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #loggingText;
		"action: #activateLogging;"
		yourself.