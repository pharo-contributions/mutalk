private
lookUpForNodesFromChildrenOfMutated: aPossibleMutatedRBMethodNode comparingWithChildrenOfOriginal: anOriginalRBMethodNode 
	| childrenOfMutatedMethod childrenOfOriginalMethod |
	childrenOfMutatedMethod := aPossibleMutatedRBMethodNode children.
	childrenOfOriginalMethod := anOriginalRBMethodNode children.
	1 to: childrenOfMutatedMethod size do: 
		[ :childNumber | 
			self lookUpForNodesFromMutated:  (childrenOfMutatedMethod at: childNumber)
				  comparingWithOriginal: (childrenOfOriginalMethod at: childNumber).
			mutatedNode ifNotNil: [^self]]

	