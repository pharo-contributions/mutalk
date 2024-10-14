Class {
	#name : 'MyVehicleTest',
	#superclass : 'TestCase',
	#category : 'MuTalk-Examples',
	#package : 'MuTalk-Examples'
}

{ #category : 'tests' }
MyVehicleTest >> testHasFiveSeats [

	| aVehicle |
	aVehicle := MyVehicle newWithSeats: 5.
	self assert: aVehicle numberOfSeats equals: 5
]

{ #category : 'tests' }
MyVehicleTest >> testHasFourWheels [

	| aVehicle |
	aVehicle := MyVehicle newWithWheels: 4.
	self assert: aVehicle hasFourWheels
]

{ #category : 'tests' }
MyVehicleTest >> testSimpleCarHasFourWheelsAndFiveSeats [

	| car |
	car := MyVehicle newSimpleCar.
	self assert: car hasFourWheels.
	self assert: car numberOfSeats equals: 5
]
