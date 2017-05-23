private
lookupForNodes
	self lookUpForNodesFromMutated: (RBParser parseMethod: self modifiedSource)
		  comparingWithOriginal: (RBParser parseMethod: self originalSource ).