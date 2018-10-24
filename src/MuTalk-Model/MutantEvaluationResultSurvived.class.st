Class {
	#name : #MutantEvaluationResultSurvived,
	#superclass : #MutantEvaluationResult,
	#instVars : [
		'result'
	],
	#category : 'MuTalk-Model-Mutant evaluation results'
}

{ #category : #'instance creation' }
MutantEvaluationResultSurvived class >> canHandle: aMutant withResults: aTestResult [ 
	^ aTestResult notNil
		and: [aTestResult errorsSize + aTestResult failuresSize = 0]
]

{ #category : #'instance creation' }
MutantEvaluationResultSurvived class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : #'initialize-release' }
MutantEvaluationResultSurvived >> initializeFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	mutant := aMutant.
	result := aTestResult.
	mutantEvaluation := aMutantEvaluation
]

{ #category : #testing }
MutantEvaluationResultSurvived >> killed [
	^false
]

{ #category : #accessing }
MutantEvaluationResultSurvived >> killingSuggestions [
	^ (MutantKillingSuggestionGenerator new suggestionFor: mutant)
]

{ #category : #testing }
MutantEvaluationResultSurvived >> particularResults [
	^result tests
]

{ #category : #printing }
MutantEvaluationResultSurvived >> printDetailedResultOn: aStream [ 

		aStream cr; nextPutAll: 'PASSED'; cr.
		result passed do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr; nextPutAll: 'FAILURES'; cr.
		result failures do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr; nextPutAll: 'ERRORS'; cr.
		result errors do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr.
]

{ #category : #accessing }
MutantEvaluationResultSurvived >> result [
	^result
]

{ #category : #browsing }
MutantEvaluationResultSurvived >> resultClass [
	
	^result tests isEmpty 
		ifTrue: [mutant originalClass] 
		ifFalse: [result tests first class] 
]

{ #category : #testing }
MutantEvaluationResultSurvived >> resultString [
	
	^result printString
]

{ #category : #testing }
MutantEvaluationResultSurvived >> runCount [

	^result runCount
]

{ #category : #testing }
MutantEvaluationResultSurvived >> survived [
	^true
]

{ #category : #testing }
MutantEvaluationResultSurvived >> terminated [

	^false
]
