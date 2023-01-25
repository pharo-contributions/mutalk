Class {
	#name : #MethodInstallerTest,
	#superclass : #TestCase,
	#instVars : [
		'anonymousClass',
		'anonymousClassWithMethod'
	],
	#category : #'MuTalk-Tests'
}

{ #category : #accessing }
MethodInstallerTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : #testProtocol }
MethodInstallerTest >> methodInstalled [
	"this method is used to test installation,"
	^ 3 + 4

]

{ #category : #'as yet unclassified' }
MethodInstallerTest >> methodToUninstall [ ^self
]

{ #category : #accessing }
MethodInstallerTest >> numberOfMethodVersionsOf: aSelector in: aClass [ 
	
	| aMethod |
	
	aMethod := aClass>>aSelector.
	
	^ (SourceFiles
		changeRecordsFrom: aMethod sourcePointer
		className: aMethod origin
		isMeta: aMethod origin isClassSide) size
]

{ #category : #building }
MethodInstallerTest >> tearDown [
	"Unistall methods that should not be istalled and install method that should be installed."

	(self class includesSelector: #methodNotInstalled) ifTrue: [ 
		MethodInstaller new uninstall: #methodNotInstalled from: self class ].
	(self class includesSelector: #methodToUninstall) ifFalse: [ 
		MethodInstaller new
			installFromSource: 'methodToUninstall ^self'
			in: self class ].
	super tearDown
]

{ #category : #testing }
MethodInstallerTest >> testInstallMethodException [
	"Try to install a method that produce an Exception."

	| selector aSourceCode |
	selector := #methodWithError.
	self deny: (self class includesSelector: selector).
	aSourceCode := selector asString , '  ^3+'.
	self
		should: [ 
			MethodInstaller new
				installFromSourceSilently: aSourceCode
				in: self class ]
		raise: MethodInstallerException
]

{ #category : #testing }
MethodInstallerTest >> testInstallMethodOnEmptyClass [
	"Install a method on Self"

	| selector aSourceCode |
	selector := #methodNotInstalled.
	self deny: (self class includesSelector: selector).
	aSourceCode := selector asString , '  ^3+4'.
	MethodInstaller new
		installFromSourceSilently: aSourceCode
		in: self class.
	self assert: (self class includesSelector: selector)
]

{ #category : #testing }
MethodInstallerTest >> testInstallerShouldNotAddSourceVersions [
	"Install a method that produce an Exception. For this. me use an
	Anonimous Class."

	| selector aSourceCode previousNumberOfVersions previousCompiledMethod |
	selector := #methodInstalled.
	previousCompiledMethod := self class methodDictionary at: selector.
	previousNumberOfVersions := self
		                            numberOfMethodVersionsOf: selector
		                            in: self class.

	aSourceCode := selector asString , '  ^3+4'.
	[ 
	MethodInstaller new
		installFromSourceSilently: aSourceCode
		in: self class ] ensure: [ 
		MethodInstaller new
			install: previousCompiledMethod
			for: selector
			in: self class
			withProtocol: 'testProtocol' ].

	self assert:
		(self numberOfMethodVersionsOf: selector in: self class)
		= previousNumberOfVersions
]

{ #category : #testing }
MethodInstallerTest >> testUnInstallMethodOnClass [
	"Uninstall a method from a class that has the method implemented."
	|selector|
	selector := #methodToUninstall.
	self assert: (self class includesSelector: selector).
	MethodInstaller new uninstall: selector from: self class.
	self deny: (self class includesSelector: selector)
		
]
