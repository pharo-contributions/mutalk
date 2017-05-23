building
buildStatusWith: aBuilder
	^ aBuilder pluggableInputFieldSpec new
		model: self;
		color: #statusColor;
		getText: #statusText;
		yourself.