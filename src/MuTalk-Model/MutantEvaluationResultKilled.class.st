Class {
	#name : 'MutantEvaluationResultKilled',
	#superclass : 'MutantEvaluationResult',
	#instVars : [
		'result'
	],
	#category : 'MuTalk-Model-Mutant evaluation results',
	#package : 'MuTalk-Model',
	#tag : 'Mutant evaluation results'
}

{ #category : 'instance creation' }
MutantEvaluationResultKilled class >> canHandle: aMutant withResults: aTestResult [

 	^aTestResult notNil and:[aTestResult errorsSize + aTestResult failuresSize > 0]
	
]

{ #category : 'instance creation' }
MutantEvaluationResultKilled class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : 'initialize-release' }
MutantEvaluationResultKilled >> initializeFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	mutant := aMutant.
	result := aTestResult.
	mutantEvaluation := aMutantEvaluation
]

{ #category : 'testing' }
MutantEvaluationResultKilled >> killed [
	
	^true
]

{ #category : 'accessing' }
MutantEvaluationResultKilled >> killingSuggestions [ 
	
	^'MUTANT KILLED'
]

{ #category : 'browsing' }
MutantEvaluationResultKilled >> particularResults [
	
	^result tests
]

{ #category : 'printing' }
MutantEvaluationResultKilled >> printDetailedResultOn: aStream [ 

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
MutantEvaluationResultKilled >> result [
	^result
]

{ #category : 'browsing' }
MutantEvaluationResultKilled >> resultClass [
	
	^result tests first class
]

{ #category : 'testing' }
MutantEvaluationResultKilled >> resultString [
	
	^result printString 
]

{ #category : 'testing' }
MutantEvaluationResultKilled >> runCount [

	^result runCount
]

{ #category : 'testing' }
MutantEvaluationResultKilled >> survived [
	
	^false
]

{ #category : 'testing' }
MutantEvaluationResultKilled >> terminated [

	^false
]
