Class {
	#name : #MTMutantEvaluationResultKilled,
	#superclass : #MTMutantEvaluationResult,
	#instVars : [
		'result'
	],
	#category : 'MuTalk-Model-Mutant evaluation results'
}

{ #category : #'instance creation' }
MTMutantEvaluationResultKilled class >> canHandle: aMutant withResults: aTestResult [

 	^aTestResult notNil and:[aTestResult errorsSize + aTestResult failuresSize > 0]
	
]

{ #category : #'instance creation' }
MTMutantEvaluationResultKilled class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : #'initialize-release' }
MTMutantEvaluationResultKilled >> initializeFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	mutant := aMutant.
	result := aTestResult.
	mutantEvaluation := aMutantEvaluation
]

{ #category : #testing }
MTMutantEvaluationResultKilled >> killed [
	
	^true
]

{ #category : #accessing }
MTMutantEvaluationResultKilled >> killingSuggestions [ 
	
	^'MUTANT KILLED'
]

{ #category : #browsing }
MTMutantEvaluationResultKilled >> mutantResults [
	
	^result tests
]

{ #category : #printing }
MTMutantEvaluationResultKilled >> printDetailedResultOn: aStream [ 

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
MTMutantEvaluationResultKilled >> result [
	^result
]

{ #category : #browsing }
MTMutantEvaluationResultKilled >> resultClass [
	
	^result tests first class
]

{ #category : #testing }
MTMutantEvaluationResultKilled >> resultString [
	
	^result printString 
]

{ #category : #testing }
MTMutantEvaluationResultKilled >> runCount [

	^result runCount
]

{ #category : #testing }
MTMutantEvaluationResultKilled >> survived [
	
	^false
]

{ #category : #testing }
MTMutantEvaluationResultKilled >> terminated [

	^false
]
