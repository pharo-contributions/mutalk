testing
isNodeOfMutation: posibleMutatedRBMethodNode comparingWith: originalRBMethodNode 
	^ (self isAPosibleNodeToMutate: originalRBMethodNode) 
		and: [ self isAPosibleMutatedNode: posibleMutatedRBMethodNode ]