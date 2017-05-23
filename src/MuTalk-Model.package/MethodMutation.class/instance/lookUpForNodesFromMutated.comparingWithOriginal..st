private
lookUpForNodesFromMutated: aPossibleMutatedRBMethodNode comparingWithOriginal: anOriginalRBMethodNode 
	(self operator 
		isNodeOfMutation: aPossibleMutatedRBMethodNode
		comparingWith: anOriginalRBMethodNode) ifTrue: 
		[ nodeToMutate := anOriginalRBMethodNode.
		mutatedNode := aPossibleMutatedRBMethodNode ].
	aPossibleMutatedRBMethodNode children isEmpty ifTrue: [ ^ nil ].
	^ self 
		lookUpForNodesFromChildrenOfMutated: aPossibleMutatedRBMethodNode
		comparingWithChildrenOfOriginal: anOriginalRBMethodNode