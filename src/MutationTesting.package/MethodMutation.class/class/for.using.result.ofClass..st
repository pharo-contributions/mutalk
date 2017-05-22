instance creation
for: aMethod using: anOperatorApplied result: aModifiedSource ofClass: aClass
	^ self new
		initializeFor: aMethod
		using: anOperatorApplied
		result: aModifiedSource
		ofClass: aClass;
		 yourself