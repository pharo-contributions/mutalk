Class {
	#name : 'MTParseRewriterMutantOperator',
	#superclass : 'MTAbstractMutantOperator',
	#category : 'MuTalk-Model-Operators - Abstract',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Abstract'
}

{ #category : 'testing' }
MTParseRewriterMutantOperator class >> isAbstract [

	^ self == MTParseRewriterMutantOperator
]

{ #category : 'applying' }
MTParseRewriterMutantOperator >> applyTo: anOldNode [

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
MTParseRewriterMutantOperator >> expressionToReplace [
	self subclassResponsibility
]

{ #category : 'private' }
MTParseRewriterMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber newExpression: anExpression [

	
	| rewriter parser number nNode |
	rewriter := RBParseTreeRewriter new.
	number := aNumber.
	parser := aParseTree copy.
	rewriter
		replace: self expressionToReplace
		withValueFrom: [ :oNode |
			nNode := RBParser parseRewriteExpression: anExpression.
			nNode := nNode copyInContext: rewriter context.
			nNode ]
		when: [ :node |
			number := number - 1.
			number = 0 ].
	rewriter executeTree: parser.
	
	parser := rewriter tree.
	^ parser formattedCode
	
]

{ #category : 'private' }
MTParseRewriterMutantOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	accumulator add: (MTMethodMutation
			 for: aCompiledMethod
			 using: self
			 nodeNumber: nodeIndex
			 ofClass: aCompiledMethod methodClass).
	^ accumulator
]

{ #category : 'applying' }
MTParseRewriterMutantOperator >> newExpression [
	self subclassResponsibility
]

{ #category : 'source' }
MTParseRewriterMutantOperator >> nodeToMutateWith: aMTMethodMutation [ 
	
	| n searcher |
	n := 1.
	
	searcher := RBParseTreeSearcher new
		            matches: self expressionToReplace
		            do: [ :node :answer | 
			            n = aMTMethodMutation nodeNumber ifTrue: [ ^ node ].
			            n := n + 1 ];
		            yourself.
	searcher executeTree: aMTMethodMutation originalMethod ast.
	self error: 'Not found'
]

{ #category : 'applying' }
MTParseRewriterMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [ 
	"Evaluates how many times can the operator be applyied"	
	|searcher timesToApply|
	searcher := RBParseTreeSearcher new.
	timesToApply := 0.
	searcher matches:self expressionToReplace do:[:node :answer | timesToApply := timesToApply + 1].
	searcher executeTree: aParseTree copy.
	^timesToApply.
	
]
