Class {
	#name : 'MTCIMarkdownExporter',
	#superclass : 'MTAbstractExporter',
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTCIMarkdownExporter >> cloneLocation [

	^ cloneLocation
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> cloneLocation: anObject [

	cloneLocation := anObject
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> export [

	| results alive killed terminated contentMD |
	results := mtResult generalResult.
	alive := results numberOfAliveMutants.
	killed := results numberOfKilledMutants.
	terminated := results numberOfTerminatedMutants.
	
	contentMD := 
'# Mutation Results
- Commit: ', commit asString, '
- Pull Request: ', pull_request_id asString, '
| Mutants            | Number Of Mutants |
| ------------------ | ----------------- |
| Mutants alive      | ', alive asString, ' |
| Mutants killed     | ', killed asString, ' |
| Mutants terminated | ', terminated asString, ' |
### Mutation Score: ', results mutationScore asString, '%'.

	^ contentMD
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> root [

	^ root
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> root: anObject [

	root := anObject
]
