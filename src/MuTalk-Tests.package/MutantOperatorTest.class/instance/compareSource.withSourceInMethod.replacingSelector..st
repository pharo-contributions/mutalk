formatting
compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector
	"Compare both source replacing the selector of CompiledMethod for aSelector (to make then equal) 
	and formatting both sources equally."
	| sourceSelector secondString methodSelectorString secondStringModified|
	sourceSelector := aSelector asString.
	secondString := aCompiledMethod getSource asString.
	methodSelectorString := aCompiledMethod selector asString.
	secondStringModified := (secondString copyReplaceAll: methodSelectorString with: sourceSelector).
	^(self formattedStringFor: aSource) =  (self formattedStringFor: secondStringModified)
