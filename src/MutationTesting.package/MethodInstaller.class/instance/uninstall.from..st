installing
uninstall: aSelector from: aClass 
	"Uninstall a method referenced by aSelector in aClass. Raise exception in
	case de uninstall is	not posible."
	[aClass basicRemoveSelector: aSelector]
		on: Error
		do: [:error | MethodInstallerException signal]