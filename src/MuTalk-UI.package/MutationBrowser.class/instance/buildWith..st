building
buildWith: aBuilder 
	| window |
	window := aBuilder pluggableWindowSpec new model: self;
				 label: self label;
				 extent: self extent;
				 children: (OrderedCollection new 
					add: ((self buildCodeDifferenceWith: aBuilder)
						frame: (0.0 @ 0.0 corner: 0.55 @ 0.6);
						 yourself);
					add: ((self buildParticularResultsWith: aBuilder)
						frame: (0.55 @ 0.0 corner: 1.0 @ 0.6);
						 yourself);
					add: ((self buildKillingSuggestionsWith: aBuilder)
						frame: (0.0 @ 0.6 corner: 1.0 @ 0.85);
						 yourself);
					add: ((self buildTestResultWith: aBuilder)
						frame: (0.0 @ 0.85 corner: 0.55 @ 1.0);
						 yourself);
	 			   add: ((self buildButtonsWith: aBuilder)
						frame: (0.55 @ 0.85 corner: 1.0 @ 1.0);
						 yourself);
					 yourself);
				 yourself.
	^ aBuilder build: window