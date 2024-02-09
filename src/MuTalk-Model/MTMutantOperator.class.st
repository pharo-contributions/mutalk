Class {
	#name : 'MTMutantOperator',
	#superclass : 'MTAbstractMutantOperator',
	#category : 'MuTalk-Model-Operators',
	#package : 'MuTalk-Model',
	#tag : 'Operators'
}

{ #category : 'testing' }
MTMutantOperator class >> isAbstract [

	^ self == MTMutantOperator
]

{ #category : 'applying' }
MTMutantOperator >> applyTo: anOldNode [

	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace: self expressionToReplace
		withValueFrom: [ :oNode | | aNewNode |
			aNewNode := RBParser parseRewriteExpression: self newExpression.
			aNewNode copyInContext: rewriter context ].
	rewriter executeTree: anOldNode copy.
	^ rewriter tree
]

{ #category : 'applying' }
MTMutantOperator >> expressionToReplace [
	self subclassResponsibility
]

{ #category : 'private' }
MTMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	| rewriter parser number nNode |
	rewriter := RBParseTreeRewriter new.
	number := aNumber.
	parser := aParseTree copy.
	rewriter
		replace: self expressionToReplace
		withValueFrom: [ :oNode |
			| oldNode newNode |
			nNode := RBParser parseRewriteExpression: anExpression.
			nNode := nNode copyInContext: rewriter context.
			oldNode := oNode.
			newNode := nNode.
			newNode ]
		when: [ :node |
			number := number - 1.
			number = 0 ].
	rewriter executeTree: parser.
	parser := rewriter tree.
	^ parser formattedCode
]

{ #category : 'applying' }
MTMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [ 
	"Evaluates how many times can the operator be applyied"	
	|searcher timesToApply|
	searcher := RBParseTreeSearcher new.
	timesToApply := 0.
	searcher matches:self expressionToReplace do:[:node :answer | timesToApply := timesToApply + 1].
	searcher executeTree: aParseTree copy.
	^timesToApply.
	
]
