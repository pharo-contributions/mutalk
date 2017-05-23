accessing-particularResults
particularResultsSelected: anInteger 
	particularResultsSelected := particularResultsList at: anInteger ifAbsent: nil.
	self changed: #particularResultsSelected.
	particularResultsSelected
		ifNotNil: [
			|class selector|
			class := particularResultsSelected class.
			selector := particularResultsSelected selector.
			(class includesSelector: selector)
				ifTrue: [ToolSet browse: class selector: selector]
				ifFalse: [ToolSet browse: class selector: nil]]