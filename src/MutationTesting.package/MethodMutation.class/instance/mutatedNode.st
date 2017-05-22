accessing
mutatedNode
	mutatedNode ifNil:[self lookupForNodes ].
	^mutatedNode. 