Class {
	#name : #MTMetamodelMethodMutation,
	#superclass : #MTMethodMutation,
	#category : #'MuTalk-Moose-Core'
}

{ #category : #private }
MTMetamodelMethodMutation >> runTestsStoppingOnError: aBoolean [

	| testSuite |
	originalClass generate.
	testSuite := TestSuite named: 'Tests cases for: ' , self printString.
	testSuite addTests: testCaseReferences.
	^ aBoolean
		  ifTrue: [ testSuite runStoppingOnFirstFailOrError ]
		  ifFalse: [ testSuite run ]
]
