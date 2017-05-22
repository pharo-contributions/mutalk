private
methodReferences
	^ self classesAndMetaclasses
		inject: OrderedCollection new
		into: [:methodReferences :aClass | 
			methodReferences
				addAll: (aClass selectors
						collect: [:aSelector | RGMethodDefinition class: aClass selector: aSelector]).
			methodReferences]