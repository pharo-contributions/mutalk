building
buildWith: aBuilder 
	| window |
	window := aBuilder pluggableWindowSpec new model: self;
				 label: self label;
				 extent: self extent;
				 children: (OrderedCollection new 
					 add: ((self buildStatusWith: aBuilder)
						frame: (0.0 @ 0.0 corner: 1.0 @ 0.08);
						 yourself);
					 add: ((self buildAliveMutantsListWith: aBuilder)
						frame: (0.0 @ 0.08 corner: 1.0 @ 0.6);
						 yourself);
					 add: ((self buildKilledMutantsListWith: aBuilder)
						frame: (0.0 @ 0.6 corner: 1.0 @ 0.85);
						 yourself);
					 add: ((self buildElapsedTimeWith: aBuilder)
						frame: (0.0 @ 0.85 corner: 0.7 @ 1);
						 yourself);
					 add: ((self buildButtonsWith: aBuilder)
						frame: (0.7 @ 0.85 corner: 1.0 @ 1.0);
						 yourself);
					 yourself);
				 yourself.
	^ aBuilder build: window