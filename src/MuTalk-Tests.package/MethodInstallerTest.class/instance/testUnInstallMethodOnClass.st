testing
testUnInstallMethodOnClass
	"Uninstall a method from a class that has the method implemented."
	|selector|
	selector := #methodToUninstall.
	self assert: (self class includesSelector: selector).
	MethodInstaller new uninstall: selector from: self class.
	self deny: (self class includesSelector: selector)
		