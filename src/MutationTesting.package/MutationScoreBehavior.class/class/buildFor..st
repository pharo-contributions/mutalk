instance creation
buildFor: aMutationGeneralResult
	|handler|
	handler := self allSubclasses detect: [:class | class canHandle: aMutationGeneralResult] ifNone: [].
	^handler scoreFor: aMutationGeneralResult
	