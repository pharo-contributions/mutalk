building
buildElapsedTimeWith: aBuilder
	^ aBuilder pluggableInputFieldSpec new
		model: self;
		getText: #elapsedTimeText;
		yourself.