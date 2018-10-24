Class {
	#name : #MutantEvaluationResultTerminated,
	#superclass : #MutantEvaluationResult,
	#category : 'MuTalk-Model-Mutant evaluation results'
}

{ #category : #'instance creation' }
MutantEvaluationResultTerminated class >> canHandle: aMutant withResults: aTestResult [

	^aTestResult isNil
]

{ #category : #'instance creation' }
MutantEvaluationResultTerminated class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : #'initialize-release' }
MutantEvaluationResultTerminated >> initializeFor: aMutation producedBy: aMutantEvaluation [ 
	mutant := aMutation.
	mutantEvaluation := aMutantEvaluation
]

{ #category : #testing }
MutantEvaluationResultTerminated >> killed [
	^false
]

{ #category : #accessing }
MutantEvaluationResultTerminated >> killingSuggestions [ 
	
	^'MUTANT KILLED'
]

{ #category : #testing }
MutantEvaluationResultTerminated >> particularResults [
	
	^OrderedCollection new
]

{ #category : #printing }
MutantEvaluationResultTerminated >> printDetailedResultOn: aStream [

		aStream cr; nextPutAll: 'TEST EXECUTION TERMINATED'; cr.
]

{ #category : #accessing }
MutantEvaluationResultTerminated >> result [
	^nil
]

{ #category : #browsing }
MutantEvaluationResultTerminated >> resultClass [
	
	^mutant originalClass
]

{ #category : #testing }
MutantEvaluationResultTerminated >> resultString [
	^'Mutation TERMINATED'
]

{ #category : #testing }
MutantEvaluationResultTerminated >> runCount [

	^0
]

{ #category : #testing }
MutantEvaluationResultTerminated >> survived [
	^false
]

{ #category : #testing }
MutantEvaluationResultTerminated >> terminated [

	^true
]
