applying
timesToApplyIn: aCompiledMethod with: aParseTree 

	"ignore methods that contain only ^self"
	(aParseTree statements asArray = { RBParseTreeSearcher treeMatching: '^ self' in: aParseTree })
		ifTrue: [ ^ 0 ].
	
	^ super timesToApplyIn: aCompiledMethod with: aParseTree 