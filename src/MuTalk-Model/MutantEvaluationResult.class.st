Class {
	#name : #MutantEvaluationResult,
	#superclass : #Object,
	#instVars : [
		'mutant',
		'mutantEvaluation'
	],
	#category : 'MuTalk-Model-Mutant evaluation results'
}

{ #category : #'instance creation' }
MutantEvaluationResult class >> canHandle: aMutant withResults: aTestResult [

	self subclassResponsibility 
]

{ #category : #'instance creation' }
MutantEvaluationResult class >> for: aMutant results: aTestResult [ 
	"This method is use for running tests. That's the reason why it sends nil as argument"
	^ self 
		for: aMutant
		results: aTestResult
		producedBy: nil
]

{ #category : #'instance creation' }
MutantEvaluationResult class >> for: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	| handler |
	handler := self subclasses 
		detect: 
			[ :class | 
			class 
				canHandle: aMutant
				withResults: aTestResult ]
		ifNone: [ self error: 'There are missing classes' ].
	^ handler 
		newFor: aMutant
		results: aTestResult
		producedBy: aMutantEvaluation
]

{ #category : #'instance creation' }
MutantEvaluationResult class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	self subclassResponsibility
]

{ #category : #testing }
MutantEvaluationResult >> killed [
	self subclassResponsibility
]

{ #category : #accessing }
MutantEvaluationResult >> killingSuggestions [ 
	
	self subclassResponsibility 
]

{ #category : #accessing }
MutantEvaluationResult >> mutant [
	^ mutant
]

{ #category : #accessing }
MutantEvaluationResult >> mutantEvaluation [ 
	^mutantEvaluation
]

{ #category : #accessing }
MutantEvaluationResult >> particularResults [ 
	
	self subclassResponsibility 
]

{ #category : #printing }
MutantEvaluationResult >> printDetailedResultOn: aStream [ 
	self subclassResponsibility 
]

{ #category : #printing }
MutantEvaluationResult >> printOn: aStream [ 
	aStream nextPutAll: self mutant printString
]

{ #category : #browsing }
MutantEvaluationResult >> resultClass [
	self subclassResponsibility
]

{ #category : #accessing }
MutantEvaluationResult >> resultString [ 
	self subclassResponsibility 
]

{ #category : #testing }
MutantEvaluationResult >> runCount [
	self subclassResponsibility
]

{ #category : #testing }
MutantEvaluationResult >> survived [
	self subclassResponsibility
]

{ #category : #testing }
MutantEvaluationResult >> terminated [
	self subclassResponsibility
]
