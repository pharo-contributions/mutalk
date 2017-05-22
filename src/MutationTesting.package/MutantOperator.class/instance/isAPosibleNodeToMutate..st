private
isAPosibleNodeToMutate: aRBMethodNode 
	| nodeThatMatches |
	nodeThatMatches := RBParseTreeSearcher treeMatching: self expressionToReplace
												in: aRBMethodNode.
	
	^ nodeThatMatches notNil and: [ self is: aRBMethodNode equalTo: nodeThatMatches ]