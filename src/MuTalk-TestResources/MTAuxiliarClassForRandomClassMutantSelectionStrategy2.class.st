Class {
	#name : #MTAuxiliarClassForRandomClassMutantSelectionStrategy2,
	#superclass : #Object,
	#category : 'MuTalk-TestResources'
}

{ #category : #accessing }
MTAuxiliarClassForRandomClassMutantSelectionStrategy2 >> method2 [

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
