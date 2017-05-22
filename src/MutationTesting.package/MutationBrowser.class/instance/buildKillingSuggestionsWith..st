building
buildKillingSuggestionsWith: aBuilder 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #killingSuggestions;
		yourself.