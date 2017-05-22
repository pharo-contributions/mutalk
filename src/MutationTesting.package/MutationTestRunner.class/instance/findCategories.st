updating
findCategories
	^ Array
		streamContents: [:stream | Smalltalk organization categories
				do: [:each | stream nextPut: each]]