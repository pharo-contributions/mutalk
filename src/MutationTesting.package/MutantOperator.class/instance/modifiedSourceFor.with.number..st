private
modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber 
	| rewriter parser number |
	rewriter := RBParseTreeRewriter new.
	number := aNumber.
	parser := aParseTree copy.
	rewriter 
		replace: self expressionToReplace
		with: self newExpression
		when: 
			[ :node | number := number - 1.
						number = 0 ].
	rewriter executeTree: parser.
	^ rewriter tree formattedCode