testing
testInstallMethodOnEmptyClass
	"Install a method on Self"
	| selector aSourceCode |
	selector := #methodNotInstalled.
	self deny: (self class includesSelector: selector).
	aSourceCode := selector asString , '  ^3+4'.
	MethodInstaller new installFromSource: aSourceCode in: self class.
	self assert: (self class includesSelector: selector).