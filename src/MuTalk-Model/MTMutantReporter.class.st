Class {
	#name : 'MTMutantReporter',
	#superclass : 'Object',
	#instVars : [
		'mutantEvaluationResult'
	],
	#category : 'MuTalk-Model-Reporting',
	#package : 'MuTalk-Model',
	#tag : 'Reporting'
}

{ #category : 'instance creation' }
MTMutantReporter class >> for: aMutantEvaluationResult [ 
	^self new 
		initializeFor: aMutantEvaluationResult;
		yourself 
]

{ #category : 'initialize-release' }
MTMutantReporter >> initializeFor: aMutantEvaluationResult [ 

	mutantEvaluationResult := aMutantEvaluationResult 
]

{ #category : 'evaluating' }
MTMutantReporter >> value [
	| stream |
	stream := String
		streamContents: [ :str | 
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Mutant Generated: ';
				nextPutAll: mutantEvaluationResult printString;
				cr.
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Result --> ';
				nextPutAll: mutantEvaluationResult resultString;
				cr.
			mutantEvaluationResult printDetailedResultOn: str.
			str cr ].
	^ stream contents
]
