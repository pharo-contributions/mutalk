Class {
	#name : #SelectorReplacementMutantOperator,
	#superclass : #MutantOperator,
	#category : 'MuTalk-Model-Operators'
}

{ #category : #printing }
SelectorReplacementMutantOperator >> description [
	^ 'Replace ' , self oldSelector printString , ' with ' , self newSelector printString
]

{ #category : #applying }
SelectorReplacementMutantOperator >> expressionToReplace [ 
	| oldString |
	oldString := RBParseTreeSearcher buildSelectorString: self oldSelector.
	^'``@object ' , oldString
	
]

{ #category : #applying }
SelectorReplacementMutantOperator >> newExpression [ 
	| newString |
	newString := RBParseTreeSearcher buildSelectorString: self newSelector.
	^'``@object ' , newString

]

{ #category : #accessing }
SelectorReplacementMutantOperator >> newSelector [
	self subclassResponsibility
]

{ #category : #accessing }
SelectorReplacementMutantOperator >> oldSelector [
	self subclassResponsibility
]
