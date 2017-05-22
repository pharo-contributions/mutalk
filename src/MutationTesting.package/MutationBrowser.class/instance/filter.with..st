filtering
filter: aList with: classFilter
	| allElementsFiltered |
	allElementsFiltered := aList
				select: [:test | (classFilter isNil
							or: [test class name = classFilter])].
	^ allElementsFiltered asArray
		sort: [:a :b | a printString <= b printString]