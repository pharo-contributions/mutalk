Class {
	#name : 'MTMutantEvaluationResultTerminated',
	#superclass : 'MTMutantEvaluationResult',
	#category : 'MuTalk-Model-Mutant evaluation results',
	#package : 'MuTalk-Model',
	#tag : 'Mutant evaluation results'
}

{ #category : 'instance creation' }
MTMutantEvaluationResultTerminated class >> canHandle: aMutant withResults: aTestResult [

	^aTestResult isNil
]

{ #category : 'instance creation' }
MTMutantEvaluationResultTerminated class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : 'initialize-release' }
MTMutantEvaluationResultTerminated >> initializeFor: aMutation producedBy: aMutantEvaluation [ 
	mutant := aMutation.
	mutantEvaluation := aMutantEvaluation
]

{ #category : 'testing' }
MTMutantEvaluationResultTerminated >> killed [
	^false
]

{ #category : 'accessing' }
MTMutantEvaluationResultTerminated >> killingSuggestions [ 
	
	^'MUTANT KILLED'
]

{ #category : 'testing' }
MTMutantEvaluationResultTerminated >> mutantResults [
	
	^OrderedCollection new
]

{ #category : 'printing' }
MTMutantEvaluationResultTerminated >> printDetailedResultOn: aStream [

		aStream cr; nextPutAll: 'TEST EXECUTION TERMINATED'; cr.
]

{ #category : 'accessing' }
MTMutantEvaluationResultTerminated >> result [
	^nil
]

{ #category : 'browsing' }
MTMutantEvaluationResultTerminated >> resultClass [
	
	^mutant originalClass
]

{ #category : 'testing' }
MTMutantEvaluationResultTerminated >> resultString [
	^'Mutation TERMINATED'
]

{ #category : 'testing' }
MTMutantEvaluationResultTerminated >> runCount [

	^0
]

{ #category : 'testing' }
MTMutantEvaluationResultTerminated >> survived [
	^false
]

{ #category : 'testing' }
MTMutantEvaluationResultTerminated >> terminated [

	^true
]
