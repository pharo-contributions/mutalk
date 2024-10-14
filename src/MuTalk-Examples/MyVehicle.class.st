"
This class serves only as an example in the MuTalk chapter.
"
Class {
	#name : 'MyVehicle',
	#superclass : 'Object',
	#instVars : [
		'numberOfWheels',
		'numberOfSeats'
	],
	#category : 'MuTalk-Examples',
	#package : 'MuTalk-Examples'
}

{ #category : 'instance creation' }
MyVehicle class >> newSimpleCar [

	^ self new initializeWithNumberOfWheels: 4 andNumberOfSeats: 5
]

{ #category : 'instance creation' }
MyVehicle class >> newWithSeats: aNumber [

	^ self new initializeWithNumberOfWheels: 0 andNumberOfSeats: aNumber
]

{ #category : 'instance creation' }
MyVehicle class >> newWithWheels: aNumber [

	^ self new initializeWithNumberOfWheels: aNumber andNumberOfSeats: 0
]

{ #category : 'testing' }
MyVehicle >> hasFourWheels [

	^ self numberOfWheels = 4
]

{ #category : 'initialization' }
MyVehicle >> initializeWithNumberOfWheels: aNumberOfWheels andNumberOfSeats: aNumberOfSeats [

	self numberOfWheels: aNumberOfWheels.
	self numberOfSeats: aNumberOfSeats
]

{ #category : 'accessing' }
MyVehicle >> numberOfSeats [

	^ numberOfSeats
]

{ #category : 'accessing' }
MyVehicle >> numberOfSeats: aNumber [

	numberOfSeats := aNumber
]

{ #category : 'accessing' }
MyVehicle >> numberOfWheels [

	^ numberOfWheels
]

{ #category : 'accessing' }
MyVehicle >> numberOfWheels: aNumber [

	numberOfWheels := aNumber
]
