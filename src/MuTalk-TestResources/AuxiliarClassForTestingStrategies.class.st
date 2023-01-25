Class {
	#name : #AuxiliarClassForTestingStrategies,
	#superclass : #Object,
	#category : #'MuTalk-TestResources'
}

{ #category : #'not defined category' }
AuxiliarClassForTestingStrategies >> aNotCoveredMethod [
	true ifTrue: [^2]
]

{ #category : #'not defined category' }
AuxiliarClassForTestingStrategies >> method1 [
	true ifTrue: [^1]
]

{ #category : #'not defined category' }
AuxiliarClassForTestingStrategies >> method2 [
	^2
]
