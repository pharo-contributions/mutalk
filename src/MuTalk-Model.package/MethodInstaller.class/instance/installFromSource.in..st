installing
installFromSource: aSourceCode in: aClass 
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."
	| selector |
	[selector  := aClass
		compile: aSourceCode ] 
		on: Error
		do: [ :error | MethodInstallerException signal ].
	
	self install: (aClass>>selector) for: selector in: aClass.