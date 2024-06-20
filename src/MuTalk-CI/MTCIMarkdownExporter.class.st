Class {
	#name : 'MTCIMarkdownExporter',
	#superclass : 'MTAbstractExporter',
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTCIMarkdownExporter >> brownIcon [
   ^ (Character value: 128996) asString
]

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

	| columnSpaces results alive numberOfSpacesOfAlive killed numberOfSpacesOfKilled terminated numberOfSpacesOfTerminated contentMD spacesOfAlive spacesOfKilled spacesOfTerminated |
	columnSpaces := 17.
	results := mtResult generalResult.
	alive := results numberOfAliveMutants.
	killed := results numberOfKilledMutants.
	terminated := results numberOfTerminatedMutants.
	
	numberOfSpacesOfAlive := columnSpaces - ( alive asString size ).
	
	numberOfSpacesOfKilled := columnSpaces - ( killed asString size ).
	numberOfSpacesOfTerminated := columnSpaces - ( terminated asString size ).
	
	spacesOfAlive := String new: numberOfSpacesOfAlive.
	1 to: numberOfSpacesOfAlive do: [:i | spacesOfAlive at: i put: Character space ].
	
	spacesOfKilled := String new: numberOfSpacesOfKilled.
	1 to: numberOfSpacesOfKilled do: [:i | spacesOfKilled at: i put: Character space ].
	
	spacesOfTerminated := String new: numberOfSpacesOfTerminated.
	1 to: numberOfSpacesOfTerminated do: [:i | spacesOfTerminated at: i put: Character space ].
	
	
	contentMD := 
'# Mutation Results
- Commit: ', commit asString, '
- Pull Request: ', pull_request_id asString, '

| Mutants              | Number Of Mutants |
| -------------------- | ----------------- |
| ', self redIcon, ' Mutants alive      | ', alive asString, spacesOfAlive, ' |
| ', self greenIcon, ' Mutants killed      | ', killed asString, spacesOfKilled, ' |
| ', self brownIcon, ' Mutants terminated | ', terminated asString, spacesOfTerminated, ' |
### Mutation Score: ', results mutationScore asString, '%'.

	^ contentMD
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> greenIcon [
   ^ (Character value: 128994) asString
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> redIcon [
   ^ (Character value: 128308) asString
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> root [

	^ root
]

{ #category : 'accessing' }
MTCIMarkdownExporter >> root: anObject [

	root := anObject
]
