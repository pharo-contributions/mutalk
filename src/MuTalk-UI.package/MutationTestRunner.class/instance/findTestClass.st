utilities
findTestClass
	"Let the user search for a test class in the system. Answer the class or nil."
	
	| pattern class |
	pattern := UIManager default request: 'Class name or fragment?'.
	class := Utilities classFromPattern: pattern withCaption: 'Select a class:'.
	class ifNil: [^ nil].

	^ (class inheritsFrom: TestCase)
		ifTrue: class
		ifFalse: [Smalltalk at: (class name, 'Test') asSymbol ifAbsent: nil].
	
