Class {
	#name : 'MTMutantEvaluationResult',
	#superclass : 'Object',
	#instVars : [
		'mutant',
		'mutantEvaluation'
	],
	#category : 'MuTalk-Model-Mutant evaluation results',
	#package : 'MuTalk-Model',
	#tag : 'Mutant evaluation results'
}

{ #category : 'instance creation' }
MTMutantEvaluationResult class >> canHandle: aMutant withResults: aTestResult [

	self subclassResponsibility 
]

{ #category : 'instance creation' }
MTMutantEvaluationResult class >> for: aMutant results: aTestResult [ 
	"This method is use for running tests. That's the reason why it sends nil as argument"
	^ self 
		for: aMutant
		results: aTestResult
		producedBy: nil
]

{ #category : 'instance creation' }
MTMutantEvaluationResult class >> for: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
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

{ #category : 'instance creation' }
MTMutantEvaluationResult class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	self subclassResponsibility
]

{ #category : 'testing' }
MTMutantEvaluationResult >> killed [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantEvaluationResult >> killingSuggestions [ 
	
	self subclassResponsibility 
]

{ #category : 'accessing' }
MTMutantEvaluationResult >> mutant [
	^ mutant
]

{ #category : 'accessing' }
MTMutantEvaluationResult >> mutantEvaluation [ 
	^mutantEvaluation
]

{ #category : 'accessing' }
MTMutantEvaluationResult >> mutantResults [ 
	
	self subclassResponsibility 
]

{ #category : 'printing' }
MTMutantEvaluationResult >> printDetailedResultOn: aStream [ 
	self subclassResponsibility 
]

{ #category : 'printing' }
MTMutantEvaluationResult >> printOn: aStream [ 
	aStream nextPutAll: self mutant printString
]

{ #category : 'browsing' }
MTMutantEvaluationResult >> resultClass [
	self subclassResponsibility
]

{ #category : 'accessing' }
MTMutantEvaluationResult >> resultString [ 
	self subclassResponsibility 
]

{ #category : 'testing' }
MTMutantEvaluationResult >> runCount [
	self subclassResponsibility
]

{ #category : 'testing' }
MTMutantEvaluationResult >> survived [
	self subclassResponsibility
]

{ #category : 'testing' }
MTMutantEvaluationResult >> terminated [
	self subclassResponsibility
]
