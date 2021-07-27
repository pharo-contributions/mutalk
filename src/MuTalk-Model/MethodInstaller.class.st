Class {
	#name : #MethodInstaller,
	#superclass : #Object,
	#category : #'MuTalk-Model'
}

{ #category : #installing }
MethodInstaller >> install: aMethod for: selector in: aClass [ 
	aClass addSelectorSilently: selector withMethod: aMethod
]

{ #category : #installing }
MethodInstaller >> installFromSource: aSourceCode in: aClass [ 
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."
	| selector |
	[selector := aClass
		compile: aSourceCode ] 
		on: Error, SyntaxErrorNotification 
		do: [ :error | MethodInstallerException signal ].
	
	self install: (aClass>>selector) for: selector in: aClass.
]

{ #category : #installing }
MethodInstaller >> uninstall: aSelector from: aClass [ 
	"Uninstall a method referenced by aSelector in aClass. Raise exception in
	case de uninstall is	not posible."
	[aClass removeSelector: aSelector]
		on: Error
		do: [:error | MethodInstallerException signal]
]
