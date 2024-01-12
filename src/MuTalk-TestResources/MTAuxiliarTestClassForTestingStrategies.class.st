Class {
	#name : 'MTAuxiliarTestClassForTestingStrategies',
	#superclass : 'TestCase',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MTAuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod1 [

	self assert: AuxiliarClassForTestingStrategies new method1 = 1. 
	
	
]

{ #category : 'as yet unclassified' }
MTAuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod2 [

	self assert: AuxiliarClassForTestingStrategies new method2 = 2. 
	
	
]
