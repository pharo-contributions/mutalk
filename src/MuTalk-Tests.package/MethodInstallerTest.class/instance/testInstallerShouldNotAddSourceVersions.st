testing
testInstallerShouldNotAddSourceVersions
	"Install a method that produce an Exception. For this. me use an
	Anonimous Class."
	| selector aSourceCode previousNumberOfVersions previousCompiledMethod|
	
	selector := #methodInstalled.
	previousCompiledMethod := self class methodDictionary at: selector.
	previousNumberOfVersions := self numberOfMethodVersionsOf: selector 
		in: self class.
		
	aSourceCode := selector asString , '  ^3+4'.
	[MethodInstaller new installFromSource: aSourceCode in: self class.] 
			ensure:[MethodInstaller new install: previousCompiledMethod for: selector in: self class ].
	
	self assert: (self numberOfMethodVersionsOf: selector in: self class) = previousNumberOfVersions 
			