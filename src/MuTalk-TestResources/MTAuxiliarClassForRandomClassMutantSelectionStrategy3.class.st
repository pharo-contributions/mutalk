Class {
	#name : #MTAuxiliarClassForRandomClassMutantSelectionStrategy3,
	#superclass : #Object,
	#category : 'MuTalk-TestResources'
}

{ #category : #accessing }
MTAuxiliarClassForRandomClassMutantSelectionStrategy3 >> method3 [

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
