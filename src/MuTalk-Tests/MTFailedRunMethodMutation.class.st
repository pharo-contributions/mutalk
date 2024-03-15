Class {
	#name : #MTFailedRunMethodMutation,
	#superclass : #MTMethodMutation,
	#category : 'MuTalk-Tests'
}

{ #category : #private }
MTFailedRunMethodMutation >> runTestsStoppingOnError: aBoolean [

	self error
]
