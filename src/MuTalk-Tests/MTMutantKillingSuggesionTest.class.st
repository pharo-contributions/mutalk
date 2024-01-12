Class {
	#name : 'MTMutantKillingSuggesionTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests',
	#package : 'MuTalk-Tests'
}

{ #category : 'accessing' }
MTMutantKillingSuggesionTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> killedMutant [

	^resource evaluationResultForKilledMutantByError
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRAO [

	^2 = (1 + 1) and: [ Set new isEmpty ].

]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRAOWithAssignments [
	|firstCondition secondCondition|
	firstCondition := 2 = (1 + 1).
	secondCondition := Set new isEmpty.
	^firstCondition and: [secondCondition ]
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRCOWithAssignments [
	|aValue anotherValue|
	aValue := 1.
	anotherValue :=2.
	^aValue + anotherValue.

]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillROA [

	^2 = (1 + 1) or: [ Set new isEmpty ].

]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillROAWithAssignments [
	|firstCondition secondCondition|
	firstCondition := 2 = (1 + 1).
	secondCondition := Set new isEmpty.
	^firstCondition or: [secondCondition ]
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRemoveExceptionHandler [

	[1/0] on:Exception do:[:ex | Transcript show:'error'].
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceDoBlockWithEmptyBlock [
	OrderedCollection new do: [:each | Transcript show: each]
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceIfFalseReceiver [
	^ 1 = 1 ifFalse: [ 8 ]
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver [
	^ 1 = 1
		ifTrue: [1]
		ifFalse: [8]
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceIfTrueReceiver [
	^ 1 = 1 ifTrue: [ 8 ]
]

{ #category : 'running' }
MTMutantKillingSuggesionTest >> setUp [
	resource := MutationTestingResource current
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> survivedMutant [

	^resource evaluationResultForAliveMutant
]

{ #category : 'accessing' }
MTMutantKillingSuggesionTest >> terminatedMutant [

	^resource evaluationResultForTerminatedMutant
]

{ #category : 'testing-results' }
MTMutantKillingSuggesionTest >> testSuggestionForKilledMutant [

	self assert: self killedMutant killingSuggestions = 'MUTANT KILLED'
]

{ #category : 'testing-results' }
MTMutantKillingSuggesionTest >> testSuggestionForSurvivedMutant [

	self assert: self survivedMutant killingSuggestions
			= (MutantKillingSuggestionGenerator new suggestionFor: self survivedMutant mutant)
]

{ #category : 'testing-results' }
MTMutantKillingSuggesionTest >> testSuggestionForTerminatedMutant [

	self assert: self terminatedMutant killingSuggestions = 'MUTANT KILLED'
]

{ #category : 'testing-operators' }
MTMutantKillingSuggesionTest >> testSuggestionToKillRemoveCaret [
	| operator mutation |
	operator := RemoveCaretOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRCOWithAssignments) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) equals: 'It is missing a test case to check that the method is returning aValue + anotherValue'
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillRemoveExceptionHandler [
	| operator mutation |
	operator := RemoveExceptionHandlerOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRemoveExceptionHandler) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when an exception of kind Exception is signaled, it is handled evaluating the block [ :ex | Transcript show: ''error'' ]'.
]

{ #category : 'testing-operators' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceAndForOr [
	| operator mutation mutationWithAssignment |
	operator := ReplaceAndWithOrMutantOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRAO) first.
	mutationWithAssignment := (operator mutationsFor: self class >> #methodToTestSuggestionToKillRAOWithAssignments) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) = 'It is missing a test case where only one of the conditions 2 = (1 + 1) and [ Set new isEmpty ] is True.'.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutationWithAssignment) = 'It is missing a test case where only one of the conditions firstCondition and [ secondCondition ] is True.'
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceDoBlockWithEmptyBlock [
	| operator mutation |
	operator := ReplaceDoBlockWithEmptyBlockOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceDoBlockWithEmptyBlock) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that there is an iteration doing [ :each | Transcript show: each ] on each element of OrderedCollection new'.
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfFalseReceiverWithFalse [
	| operator mutation |
	operator := ReplaceIfFalseReceiverWithFalseOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is true, [ 8 ] is not evaluated'.
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfFalseReceiverWithTrue [
	| operator mutation |
	operator := ReplaceIfFalseReceiverWithTrueOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is evaluated'.
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueReceiverWithFalse [
	| operator mutation |
	operator := ReplaceIfTrueReceiverWithFalseOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is true, [ 8 ] is evaluated'.
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueReceiverWithTrue [
	| operator mutation |
	operator := ReplaceIfTrueReceiverWithTrueOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is not evaluated'.
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueifFalseReceiverWithFalse [
	| operator mutation |
	operator := ReplaceIfTrueIfFalseReceiverWithFalseOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is true, [ 1 ] is evaluated and [ 8 ] is not'.
]

{ #category : 'testing' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueifFalseReceiverWithTrue [
	| operator mutation |
	operator := ReplaceIfTrueIfFalseReceiverWithTrueOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) string = 'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is evaluated and [ 1 ] is not'.
]

{ #category : 'testing-operators' }
MTMutantKillingSuggesionTest >> testSuggestionToKillReplaceOrForAnd [
	| operator mutation mutationWithAssignment |
	operator := ReplaceOrWithAndMutantOperator new.
	mutation := (operator mutationsFor: self class >> #methodToTestSuggestionToKillROA) first.
	mutationWithAssignment := (operator mutationsFor: self class >> #methodToTestSuggestionToKillROAWithAssignments) first.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutation) = 'It is missing a test case where only one of the conditions 2 = (1 + 1) and [ Set new isEmpty ] is True.'.
	self assert: (MutantKillingSuggestionGenerator new suggestionFor: mutationWithAssignment) = 'It is missing a test case where only one of the conditions firstCondition and [ secondCondition ] is True.'
]
