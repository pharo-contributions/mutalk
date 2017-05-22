accessing
contents

	^(self allConcreteSubclasses collect: [:class |class new]) 
		asSortedCollection: [:elem1 :elem2 | elem1 description <= elem2 description]