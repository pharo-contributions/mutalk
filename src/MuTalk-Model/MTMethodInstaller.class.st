Class {
	#name : 'MTMethodInstaller',
	#superclass : 'Object',
	#category : 'MuTalk-Model',
	#package : 'MuTalk-Model'
}

{ #category : 'installing' }
MTMethodInstaller >> install: aMethod for: selector in: aClass withProtocol: methodProtocol [

	aClass
		addAndClassifySelector: selector
		withMethod: aMethod
		inProtocol: methodProtocol
]

{ #category : 'installing' }
MTMethodInstaller >> installFromSource: aSourceCode in: aClass [
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."

	[ aClass compile: aSourceCode ]
		on: Error , SyntaxErrorNotification
		do: [ :error | MTMethodInstallerException signal ]
]

{ #category : 'installing' }
MTMethodInstaller >> installFromSourceSilently: aSourceCode in: aClass [
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."

	[ aClass compileSilently: aSourceCode ]
		on: Error , SyntaxErrorNotification
		do: [ :error | MTMethodInstallerException signal ]
]

{ #category : 'installing' }
MTMethodInstaller >> uninstall: aSelector from: aClass [ 
	"Uninstall a method referenced by aSelector in aClass. Raise exception in
	case de uninstall is	not posible."
	[aClass removeSelector: aSelector]
		on: Error
		do: [:error | MTMethodInstallerException signal]
]
