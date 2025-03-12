Class {
	#name : 'MyVehicleTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Examples-Tests',
	#package : 'MuTalk-Examples-Tests'
}

{ #category : 'tests' }
MyVehicleTest >> testBikeHasTwoWheels [

	| bike |
	bike := MyVehicle newBike.
	self assert: bike numberOfWheels equals: 2
]

{ #category : 'tests' }
MyVehicleTest >> testHasFourWheels [

	| aVehicle |
	aVehicle := MyVehicle newWithWheels: 4.
	self assert: aVehicle hasFourWheels
]

{ #category : 'tests' }
MyVehicleTest >> testSimpleCarHasFourWheels [

	| car |
	car := MyVehicle newSimpleCar.
	self assert: car hasFourWheels
]
