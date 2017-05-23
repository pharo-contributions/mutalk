building
buildWith: aBuilder 
	| window |
	window := aBuilder pluggableWindowSpec new model: self;
				 label: self label;
				 extent: self extent;
				 children: (OrderedCollection new add: ((self buildCategoriesWith: aBuilder)
						frame: (0.0 @ 0.0 corner: 0.2 @ 0.90);
						 yourself);
					 add: ((self buildClassesWith: aBuilder)
						frame: (0.2 @ 0.0 corner: 0.4 @ 0.90);
						 yourself);
					 add: ((self buildTestClassesWith: aBuilder)
						frame: (0.4 @ 0.0 corner: 0.6 @ 0.90);
						 yourself);
					 add: ((self buildMutationOperatorsWith: aBuilder)
						frame: (0.6 @ 0.0 corner: 0.75 @ 0.90);
						 yourself);
					 add: ((self buildStatusWith: aBuilder)
						frame: (0.75 @ 0.0 corner: 1.0 @ 0.08);
						 yourself);
					 add: ((self buildAliveMutantsListWith: aBuilder)
						frame: (0.75 @ 0.08 corner: 1.0 @ 0.55);
						 yourself);
					 add: ((self buildKilledMutantsListWith: aBuilder)
						frame: (0.75 @ 0.55 corner: 1.0 @ 0.80);
						 yourself);
					 add: ((self buildElapsedTimeWith: aBuilder)
						frame: (0.75 @ 0.80 corner: 1.0 @ 0.85);
						 yourself);
					 add: ((self buildLogCheckBoxWith: aBuilder)
						frame: (0.75 @ 0.85 corner: 0.80 @ 0.90);
						 yourself);
					 add: ((self buildLogTextBoxWith: aBuilder)
						frame: (0.80 @ 0.85 corner: 1.0 @ 0.90);
						 yourself);
					 add: ((self buildButtonsWith: aBuilder)
						frame: (0.0 @ 0.90 corner: 1.0 @ 1.0);
						 yourself);
					
					 yourself);
				 yourself.
	^ aBuilder build: window