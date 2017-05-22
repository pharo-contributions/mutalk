private
modifiedSourceFor: aCompiledMethod number: aNumber 
	"this method must be removed, it is only added because some tests send this message - Gabo"
		^self modifiedSourceFor: aCompiledMethod with: aCompiledMethod parseTree number: aNumber 