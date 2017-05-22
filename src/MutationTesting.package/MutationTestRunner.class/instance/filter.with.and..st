filtering
filter: aList with: classFilter and: mutantFilter 
	| allElementsFiltered |
	allElementsFiltered := aList
				select: [:mutantResult | (classFilter isNil
							or: [mutantResult mutant originalClass name = classFilter])
						and: [mutantFilter isNil
								or: [mutantResult mutant operator description = mutantFilter]]].
	^ allElementsFiltered asArray
		sort: [:a :b | a printString <= b printString]