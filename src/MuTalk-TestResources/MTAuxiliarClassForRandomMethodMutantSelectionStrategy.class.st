Class {
	#name : 'MTAuxiliarClassForRandomMethodMutantSelectionStrategy',
	#superclass : 'Object',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'accessing' }
MTAuxiliarClassForRandomMethodMutantSelectionStrategy >> method1 [

	| x y z coll |
	x := 1.
	y := 2 * x.
	z := x + y.
	coll := OrderedCollection withAll: {
			        x.
			        y.
			        z }.
	coll addAll: {
			(y + z).
			(x + z).
			(x + y) }.
	y < 3 ifFalse: [ coll empty ].
	z > 2 ifTrue: [ ^ 'ok' ]
]

{ #category : 'accessing' }
MTAuxiliarClassForRandomMethodMutantSelectionStrategy >> method2 [

	| x y z coll |
	x := 1.
	y := 2 * x.
	z := x + y.
	coll := OrderedCollection withAll: {
			        x.
			        y.
			        z }.
	(x < 2 and: [ x > 0 ]) ifTrue: [
		coll addAll: {
				(y + z).
				(x + z).
				(x + y) } ].
	y < 3 ifFalse: [ coll empty ].
	z > 2 ifTrue: [ ^ 'ok' ]
]

{ #category : 'accessing' }
MTAuxiliarClassForRandomMethodMutantSelectionStrategy >> method3 [

	| x y z coll |
	x := 1.
	y := 2 * x.
	z := x + y.
	coll := OrderedCollection withAll: {
			        x.
			        y.
			        z }.
	coll addAll: {
			(y + z).
			(x + z).
			(x + y) }.
	z > 2 ifTrue: [ ^ 'ok' ]
]

{ #category : 'accessing' }
MTAuxiliarClassForRandomMethodMutantSelectionStrategy >> method4 [

	| x y z coll |
	x := 1.
	y := 2 * x.
	z := x + y.
	coll := OrderedCollection withAll: {
			        x.
			        y.
			        z }.
	(x < 2 and: [ x > 0 ]) ifTrue: [
		coll addAll: {
				(y + z).
				(x + z).
				(x + y) } ].
	z > 2 ifTrue: [ ^ 'ok' ]
]
