installing
installFromSource: aSourceCode in: aClass 
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."
	| methodAndNode |
	[methodAndNode  := aClass
		compile: aSourceCode ] 
		on: Error
		do: [ :error | MethodInstallerException signal ].
	
	"self install: methodAndNode method for: methodAndNode selector in: aClass."