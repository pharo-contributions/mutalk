initialize-release
initializeFor: aMethod using: anOperatorApplied result: aModifiedSource ofClass: aClass
	originalMethod := aMethod.
	operator := anOperatorApplied.
	modifiedSource := aModifiedSource.
	originalClass := aClass