Class {
	#name : 'MTMutantEvaluationResultSurvived',
	#superclass : 'MTMutantEvaluationResult',
	#instVars : [
		'result'
	],
	#category : 'MuTalk-Model-Mutant evaluation results',
	#package : 'MuTalk-Model',
	#tag : 'Mutant evaluation results'
}

{ #category : 'instance creation' }
MTMutantEvaluationResultSurvived class >> canHandle: aMutant withResults: aTestResult [ 
	^ aTestResult notNil
		and: [aTestResult errorsSize + aTestResult failuresSize = 0]
]

{ #category : 'instance creation' }
MTMutantEvaluationResultSurvived class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : 'initialize-release' }
MTMutantEvaluationResultSurvived >> initializeFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	mutant := aMutant.
	result := aTestResult.
	mutantEvaluation := aMutantEvaluation
]

{ #category : 'testing' }
MTMutantEvaluationResultSurvived >> killed [
	^false
]

{ #category : 'accessing' }
MTMutantEvaluationResultSurvived >> killingSuggestions [
	^ (MutantKillingSuggestionGenerator new suggestionFor: mutant)
]

{ #category : 'testing' }
MTMutantEvaluationResultSurvived >> mutantResults [
	^result tests
]

{ #category : 'printing' }
MTMutantEvaluationResultSurvived >> printDetailedResultOn: aStream [ 

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

{ #category : 'accessing' }
MTMutantEvaluationResultSurvived >> result [
	^result
]

{ #category : 'browsing' }
MTMutantEvaluationResultSurvived >> resultClass [
	
	^result tests isEmpty 
		ifTrue: [mutant originalClass] 
		ifFalse: [result tests first class] 
]

{ #category : 'testing' }
MTMutantEvaluationResultSurvived >> resultString [
	
	^result printString
]

{ #category : 'testing' }
MTMutantEvaluationResultSurvived >> runCount [

	^result runCount
]

{ #category : 'testing' }
MTMutantEvaluationResultSurvived >> survived [
	^true
]

{ #category : 'testing' }
MTMutantEvaluationResultSurvived >> terminated [

	^false
]
