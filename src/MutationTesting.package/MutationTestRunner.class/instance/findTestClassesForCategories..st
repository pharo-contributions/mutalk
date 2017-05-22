updating
findTestClassesForCategories: aCollection 

	| theCategories items |

	theCategories := aCollection isEmpty
		ifTrue: [ categories ]
		ifFalse: [ aCollection ].

	items := theCategories gather: [ :category |
		((Smalltalk organization listAtCategoryNamed: category)
			collect: [ :each | Smalltalk at: each ])
			select: [ :each | self testBaseClasses anySatisfy: [ :bc | each includesBehavior: bc ] ] ].

	^items asSet.