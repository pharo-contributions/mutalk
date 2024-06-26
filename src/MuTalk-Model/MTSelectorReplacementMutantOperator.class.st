Class {
	#name : 'MTSelectorReplacementMutantOperator',
	#superclass : 'MTParseRewriterMutantOperator',
	#category : 'MuTalk-Model-Operators - Abstract',
	#package : 'MuTalk-Model',
	#tag : 'Operators - Abstract'
}

{ #category : 'testing' }
MTSelectorReplacementMutantOperator class >> isAbstract [

	^ self == MTSelectorReplacementMutantOperator
]

{ #category : 'printing' }
MTSelectorReplacementMutantOperator >> description [
	^ 'Replace ' , self oldSelector printString , ' with ' , self newSelector printString
]

{ #category : 'applying' }
MTSelectorReplacementMutantOperator >> expressionToReplace [ 
	| oldString |
	oldString := RBParseTreeSearcher buildSelectorString: self oldSelector.
	^'``@object ' , oldString
	
]

{ #category : 'applying' }
MTSelectorReplacementMutantOperator >> newExpression [ 
	| newString |
	newString := RBParseTreeSearcher buildSelectorString: self newSelector.
	^'``@object ' , newString

]

{ #category : 'accessing' }
MTSelectorReplacementMutantOperator >> newSelector [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTSelectorReplacementMutantOperator >> oldSelector [
	self subclassResponsibility
]
