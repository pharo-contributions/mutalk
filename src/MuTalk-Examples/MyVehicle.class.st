"
This class serves only as an example in the MuTalk chapter.
"
Class {
	#name : 'MyVehicle',
	#superclass : 'Object',
	#instVars : [
		'numberOfWheels'
	],
	#category : 'MuTalk-Examples',
	#package : 'MuTalk-Examples'
}

{ #category : 'instance creation' }
MyVehicle class >> newBike [

	^ self new initializeWithNumberOfWheels: 2
]

{ #category : 'instance creation' }
MyVehicle class >> newSimpleCar [

	^ self new initializeWithNumberOfWheels: 4
]

{ #category : 'instance creation' }
MyVehicle class >> newWithWheels: aNumber [

	^ self new initializeWithNumberOfWheels: aNumber
]

{ #category : 'as yet unclassified' }
MyVehicle >> emptyMethod [

	
]

{ #category : 'testing' }
MyVehicle >> hasFourWheels [

	^ self numberOfWheels = 4
]

{ #category : 'initialization' }
MyVehicle >> initializeWithNumberOfWheels: aNumberOfWheels [

	self numberOfWheels: aNumberOfWheels
]

{ #category : 'accessing' }
MyVehicle >> numberOfWheels [

	^ numberOfWheels
]

{ #category : 'accessing' }
MyVehicle >> numberOfWheels: aNumber [

	numberOfWheels := aNumber
]
