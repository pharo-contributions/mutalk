Class {
	#name : 'MTClass',
	#superclass : 'Object',
	#category : 'MuTalk-Utilities-Tests',
	#package : 'MuTalk-Utilities-Tests'
}

{ #category : 'accessing' }
MTClass >> method1 [

	| coll dic strategy |
	coll := OrderedCollection new.
	"dic := Dictionary new.
	strategy := MTRandomMutantSelectionStrategy new"
]

{ #category : 'accessing' }
MTClass >> method2 [

	| coll dic strategy |
	coll := WriteStream new.
	"dic := Dictionary new.
	strategy := MTRandomMutantSelectionStrategy new"
]
