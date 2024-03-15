Class {
	#name : #MTAuxiliarTestClassForRedTestFilter,
	#superclass : #TestCase,
	#category : 'MuTalk-TestResources'
}

{ #category : #tests }
MTAuxiliarTestClassForRedTestFilter >> testWithError [

	self error
]

{ #category : #tests }
MTAuxiliarTestClassForRedTestFilter >> testWithoutError [

	self assert: true
]
