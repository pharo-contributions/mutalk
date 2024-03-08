Class {
	#name : #MTFamixRelationsOperator,
	#superclass : #MTSelectorReplacementMutantOperator,
	#category : #'MuTalk-Model-Operators-Moose'
}

{ #category : #testing }
MTFamixRelationsOperator class >> isAbstract [

	^ self == MTFamixRelationsOperator
]

{ #category : #accessing }
MTFamixRelationsOperator >> allRelationsExcept: aRelation [

	^ { #'*-'. #'*-*'. #'*-<>'. #-. #'-*'. #'-<>'. #'<>-'. #'<>-*' }
		  asOrderedCollection
		  remove: aRelation;
		  yourself
]

{ #category : #printing }
MTFamixRelationsOperator >> description [

	^ 'Replace ' , self oldSelector
	  , ' relation with all other relations'
]

{ #category : #private }
MTFamixRelationsOperator >> mutationsFor: aCompiledMethod with: aParseTree number: nodeIndex storeIn: accumulator [

	| newRelations |
	newRelations := self allRelationsExcept: self oldSelector.

	accumulator addAll: (newRelations collect: [ :relation |
			 | newString newExpression |
			 newString := RBParseTreeSearcher buildSelectorString: relation.
			 newExpression := '``@object ' , newString.
			 MTMethodMutation
				 for: aCompiledMethod
				 using: self
				 nodeNumber: nodeIndex
				 ofClass: aCompiledMethod methodClass
				 withData: newExpression ]).
	^ accumulator
]
