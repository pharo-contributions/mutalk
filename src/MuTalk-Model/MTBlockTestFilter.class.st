Class {
	#name : #MTBlockTestFilter,
	#superclass : #MTTestFilter,
	#category : 'MuTalk-Model-Test filters'
}

{ #category : #enumerating }
MTBlockTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: condition
]
