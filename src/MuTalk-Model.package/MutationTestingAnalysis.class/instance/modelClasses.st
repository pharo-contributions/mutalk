accesing
modelClasses
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]