building
tearDown
	"Unistall methods that should not be istalled and install method that should be installed."
	
	
	(self class includesSelector: #methodNotInstalled) ifTrue: [
		MethodInstaller new uninstall: #methodNotInstalled from: self class.
		].
	(self class includesSelector: #methodToUninstall) ifFalse: [
		MethodInstaller new installFromSource:  'methodToUninstall ^self' in: self class.
		].
	
