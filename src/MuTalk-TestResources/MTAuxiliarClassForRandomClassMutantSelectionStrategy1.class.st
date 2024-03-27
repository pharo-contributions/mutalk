Class {
	#name : #MTAuxiliarClassForRandomClassMutantSelectionStrategy1,
	#superclass : #Object,
	#category : 'MuTalk-TestResources'
}

{ #category : #accessing }
MTAuxiliarClassForRandomClassMutantSelectionStrategy1 >> method1 [

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
