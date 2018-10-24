Class {
	#name : #AuxiliarTestClassForTestingStrategies,
	#superclass : #TestCase,
	#category : 'MuTalk-TestResources'
}

{ #category : #'as yet unclassified' }
AuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod1 [

	self assert: AuxiliarClassForTestingStrategies new method1 = 1. 
	
	
]

{ #category : #'as yet unclassified' }
AuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod2 [

	self assert: AuxiliarClassForTestingStrategies new method2 = 2. 
	
	
]
