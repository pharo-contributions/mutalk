private
isAPosibleMutatedNode: aRBMethodNode 
	|nodeThatMatches |
	
	nodeThatMatches := (RBParseTreeSearcher treeMatching: self newExpression
												  in: aRBMethodNode). 
	
	^ nodeThatMatches notNil and: [self is: nodeThatMatches equalTo: aRBMethodNode]