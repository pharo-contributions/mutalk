Class {
	#name : 'MTMethodInstaller',
	#superclass : 'Object',
	#instVars : [
		'text'
	],
	#category : 'MuTalk-Model-Core',
	#package : 'MuTalk-Model',
	#tag : 'Core'
}

{ #category : 'installing' }
MTMethodInstaller >> install: aMethod for: selector in: aClass withProtocol: methodProtocol [

	aClass compileSilently: aMethod classified: methodProtocol notifying: self
]

{ #category : 'installing' }
MTMethodInstaller >> installFromSource: aSourceCode in: aClass [
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."

	text := aSourceCode.
	[ aClass compile: aSourceCode notifying: self ]
		on: Error
		do: [ :error | MTMethodInstallerException signal ]
]

{ #category : 'installing' }
MTMethodInstaller >> installFromSourceSilently: aSourceCode in: aClass [
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."

	text := aSourceCode.
	[ aClass compileSilently: aSourceCode  classified: 'test' notifying: self ]
		on: Error
		do: [ :error | MTMethodInstallerException signal ]
]

{ #category : 'installing' }
MTMethodInstaller >> notify: aString at: anInteger in: code [

	self error: aString , ' at: ' , anInteger asString , ' in: ' , code
]

{ #category : 'accessing' }
MTMethodInstaller >> text [
	"This method is here only for compatibility with Pharo 9 without impacting Pharo 14+"

	^ text
]

{ #category : 'installing' }
MTMethodInstaller >> uninstall: aSelector from: aClass [ 
	"Uninstall a method referenced by aSelector in aClass. Raise exception in
	case de uninstall is	not posible."
	[aClass removeSelector: aSelector]
		on: Error
		do: [:error | MTMethodInstallerException signal]
]
