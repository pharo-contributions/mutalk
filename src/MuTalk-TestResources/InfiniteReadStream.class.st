Class {
	#name : #InfiniteReadStream,
	#superclass : #ReadStream,
	#category : #'MuTalk-TestResources'
}

{ #category : #testing }
InfiniteReadStream >> atEnd [

	^ false
]

{ #category : #enumerating }
InfiniteReadStream >> do: aBlock displayingProgress: aStringOrBlock [

	^ self do: aBlock displayingProgress: aStringOrBlock every: 20
]

{ #category : #enumerating }
InfiniteReadStream >> do: aBlock displayingProgress: aStringOrBlock every: msecs [

	| size labelBlock count oldLabel lastUpdate |
	self isEmpty ifTrue: [ ^ self ].
	oldLabel := nil.
	count := lastUpdate := 0.
	size := self size.
	'' displayProgressFrom: 0 to: size during: [ :bar |
		labelBlock := aStringOrBlock isString
			              ifTrue: [
				              bar label: aStringOrBlock.
				              [ :dummyItem | aStringOrBlock ] ]
			              ifFalse: [ aStringOrBlock ].

		self do: [ :each |
			| newLabel |
			"Special handling for first and last element"
			(count = 0 or: [
				 count + 1 = size or: [
					 (Time millisecondsSince: lastUpdate) >= msecs ] ]) ifTrue: [
				bar current: count.
				oldLabel
				= (newLabel := (labelBlock cull: each) ifNil: [ oldLabel ])
					ifFalse: [
						bar label: newLabel.
						oldLabel := newLabel ].
				lastUpdate := Time millisecondClockValue ].
			aBlock value: each.
			count := count + 1 ] ]
]

{ #category : #accessing }
InfiniteReadStream >> next [

	^ position >= readLimit
		  ifTrue: [ collection at: (position := 1) ]
		  ifFalse: [ collection at: (position := position + 1) ]
]
