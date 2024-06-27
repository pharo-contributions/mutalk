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

	| results alive killed terminated builder contentMD |
	results := mtResult generalResult.
	alive := results numberOfAliveMutants.
	killed := results numberOfKilledMutants.
	terminated := results numberOfTerminatedMutants.

	builder := Microdown builder.
	contentMD := builder
		           header: [ builder text: 'Mutation results' ]
		           withLevel: 1;
		           unorderedListDuring: [
			           {
				           ('Commit: ' , commit asString).
				           ('Pull Request: ' , pull_request_id asString) } do: [
					           :each | builder item: [ builder text: each ] ] ];
		           text: Character lf asString;
		           text: Character lf asString;
		           cell: [ builder text: 'Mutants' ];
		           cell: [ builder text: 'Number of Mutants' ];
		           text: ' |';
		           text: Character lf asString;
		           headCell;
		           headCell;
		           text: ' |';
		           text: Character lf asString;
		           cell: [ builder text: self greenIcon , ' Alive' ];
		           cell: [ builder text: alive asString ];
		           text: ' |';
		           text: Character lf asString;
		           cell: [ builder text: self redIcon , ' Killed' ];
		           cell: [ builder text: killed asString ];
		           text: ' |';
		           text: Character lf asString;
		           cell: [ builder text: self brownIcon , ' Terminated' ];
		           cell: [ builder text: terminated asString ];
		           text: ' |';
		           text: Character lf asString;
		           header: [
			           builder text:
					           'Mutation score: ' , results mutationScore asString ]
		           withLevel: 3;
		           contents.


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
