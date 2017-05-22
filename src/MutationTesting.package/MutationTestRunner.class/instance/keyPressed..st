utilities
keyPressed: aKey
	| class |
	aKey = $f
		ifTrue: [	
				class := self findTestClass.
				class ifNil: [^ self].
				self selectClass: class.
			]