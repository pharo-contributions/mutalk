building
buildCodeDifferenceWith: aBuilder 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #codeDifference;
		menu: #textMenu:;
		yourself.