installing
installFromSource: aSourceCode in: aClass 
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."
	| methodAndNode |
	[methodAndNode  := aClass
		compile: aSourceCode 
		classified: nil
		notifying: nil
		trailer: aClass defaultMethodTrailer
		ifFail: [MethodInstallerException signal]] 
		on: Error
		do: [ :error | MethodInstallerException signal ].
	
	self install: methodAndNode method for: methodAndNode selector in: aClass.