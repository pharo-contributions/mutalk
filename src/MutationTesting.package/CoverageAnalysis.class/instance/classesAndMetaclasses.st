private
classesAndMetaclasses
	classesAndMetaclasses isNil ifTrue:[
		classesAndMetaclasses := (classes collect:[:aClass | aClass class]) asOrderedCollection.
		classesAndMetaclasses addAll: classes.].
	^classesAndMetaclasses.
