Class {
	#name : #MTAuxiliarTestClassForTestingStrategies,
	#superclass : #TestCase,
	#category : 'MuTalk-TestResources'
}

{ #category : #tests }
MTAuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod1 [

	self
		assert: MTAuxiliarClassForTestingStrategies new method1
		equals: 1
]

{ #category : #tests }
MTAuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod2 [

	self
		assert: MTAuxiliarClassForTestingStrategies new method2
		equals: 2
]
