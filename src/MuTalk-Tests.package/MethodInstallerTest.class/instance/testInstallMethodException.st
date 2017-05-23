testing
testInstallMethodException
	"Try to install a method that produce an Exception."
	| selector aSourceCode |
	selector := #methodWithError.
	self deny: (self class includesSelector: selector).
	aSourceCode := selector asString , '  ^3+'.
	self should: 
		[ MethodInstaller new installFromSource: aSourceCode in: self class]
		raise: MethodInstallerException