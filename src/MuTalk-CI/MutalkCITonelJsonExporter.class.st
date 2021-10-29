Class {
	#name : #MutalkCITonelJsonExporter,
	#superclass : #AbstractMutationTestingJsonExporter,
	#instVars : [
		'seqNum',
		'pull_request_id',
		'commit',
		'cloneLocation',
		'root'
	],
	#category : #'MuTalk-CI'
}

{ #category : #accessing }
MutalkCITonelJsonExporter class >> isInTonelFormatCodeLocatedAt: aDirectoryName [
	"The whole file format decision can be better resolver if delegated to the loadSpec, but this is a class method without access to it."

	" copied from SmalltalkCI project"
	Smalltalk globals
		at: #IceRepositoryProperties
		ifPresent: [ :propertiesClass | 
			| propertiesFileReference |
			propertiesFileReference := aDirectoryName asFileReference / propertiesClass propertiesFileName.
			propertiesFileReference exists
				ifTrue: [ propertiesFileReference readStreamDo: [ :stream | (STON fromStream: stream) at: #format ifPresent: [ :value | ^ value = #tonel ] ] ] ].
	^ false
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> classMutations: class [
	| mutations |
	mutations:= mtResult particularResults select: [ :mutationEval | 
		mutationEval mutant originalClass = class ]
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> cloneLocation [

	^ cloneLocation
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> cloneLocation: anObject [

	cloneLocation := anObject
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> commit [

	^ commit
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> commit: anObject [

	commit := anObject
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> defaultProcess [
| projectDirectory |
^ { 1->self coveredMethods. 0->self uncoveredMethods. nil->self excludedMethods }
		gather: [ :ea | ea value collect: [ :method |
			(self directoryFor: method in: projectDirectory) ifNotNil: [ :directory |
				self class
					coverallsDictFor: method
					in: directory
					projectDirectory: projectDirectory
					coverageValue: ea key ]]]
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> export [

	| source_files test_cases json obj |
	source_files := mtResult modelClasses collect: [ :class | 
		                self exportClassMutations: class ].
	test_cases := self exportTestCases.
	obj := { 
		       (#pull_request_id -> pull_request_id).
		       (#commit -> commit).
		       (#test_cases -> test_cases asArray).
		       (#source_files -> source_files asArray) } asDictionary.
	json := STONJSON toStringPretty: obj.
	^ json
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> exportClassMutations: class [

	| mutations path hash file |
	path := self getPathOfClass: class.
	file := self getFileOfClass: class.
	hash := self getHashOfFile: class.
	seqNum := 0.
	mutations := mtResult particularResults select: [ :mutationEval | 
		             mutationEval mutant originalClass = class ].
	mutations := mutations collect: [ :mutationEval | 
		             self
			             exportMutationEvaluation: mutationEval
			             filePath: file ].

	^ { 
		  (#path -> path).
		  (#hash -> hash).
		  (#mutations -> mutations asArray) } asDictionary
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> exportMutationEvaluation: mutationEvaluation filePath: filePath [

	| sequence_number descrption start_line end_line mutated_source result modifiedSource originalSource mutatedNode nodeToMutate offset classToCover selector |
	seqNum := seqNum + 1.
	sequence_number := seqNum.
	descrption := mutationEvaluation mutant asString.
	modifiedSource := mutationEvaluation mutant modifiedSource.
	originalSource := mutationEvaluation mutant originalSource.
	mutatedNode := mutationEvaluation mutant mutatedNode.
	nodeToMutate := mutationEvaluation mutant nodeToMutate.
	classToCover := mutationEvaluation mutant originalClass.
	selector := mutationEvaluation mutant originalMethod selector.

	offset := self
		          lineNumberOffsetClass: classToCover
		          method: selector
		          in: filePath.

	"diff := TextDiffBuilder from:  modifiedSource to: originalSource.
	diff patchSequenceDoIfMatch: [:line | matchBlock] ifInsert: [:line |insertBlock] ifRemove: [:line |removeBlock]."
	"self flag: #todo." "here I suppose that the orginal source is formatted, because I find the mapping in the modified source, which is formatted, and map it in the original."
	start_line := (originalSource copyFrom: 1 to: nodeToMutate start)
		              lines size.
	end_line := (originalSource copyFrom: 1 to: nodeToMutate stop) lines
		            size.
	mutated_source := mutatedNode formattedCode.
	mutationEvaluation killed ifTrue: [ result := 'KILLED' ].
	mutationEvaluation survived ifTrue: [ result := 'SURVIVED' ].
	mutationEvaluation terminated ifTrue: [ result := 'TERMINATED' ].
	^ { 
		  (#sequence_number -> sequence_number).
		  (#descrption -> descrption).
		  (#start_line -> (offset + start_line - 1)).
		  (#end_line -> (offset + end_line - 1)).
		  (#mutated_source -> mutated_source).
		  (#result -> result) } asDictionary
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> exportTestCases [

	^ mtResult testCases collect: [ :tcase | 
		| fileName |
		fileName := self getPathOfClass: tcase testCase class.
		fileName , ':' , tcase testCase selector ]
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> getFileOfClass: class [

	^ (cloneLocation , '/' , (self getPathOfClass: class)) asFileReference
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> getHashOfFile: class [

	^ (self getFileOfClass: class) readStreamDo: [ :stream | 
		  (MD5 hashMessage: stream contents) hex ]
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> getPathOfClass: class [

	"Based on code in SmalltalkCI project"

	| pkg nonMetaClass fileName |
	pkg := (RPackageOrganizer default packageOf: class) packageName.
	nonMetaClass := (class respondsTo: #instanceSide)
		                ifTrue: [ class instanceSide ]
		                ifFalse: [ class theNonMetaClass ].
	fileName := root, '/', pkg , '/' , nonMetaClass name , '.class.st'.
	^ fileName
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> lineNumberOffsetClass: classToCover method: method in: filePath [

	" From smalltalkCI "

	| inComment selector lineNumber |
	lineNumber := 0.
	inComment := false.
	(filePath readStreamDo: [ :stream | stream contents ]) 
		linesDo: [ :line | 
			lineNumber := lineNumber + 1.
			(line beginsWith: $" asString) ifTrue: [ 
				inComment := inComment not ].
			(inComment not and: [ line beginsWith: classToCover name ]) 
				ifTrue: [ "Start of method"
					selector := TonelParser new extractSelector:
						            ((line substrings: '>>') last copyWithout: $]).
					selector = method ifTrue: [ ^ lineNumber ] ] ].
	^ 0
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> pull_request_id [

	^ pull_request_id
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> pull_request_id: anObject [

	pull_request_id := anObject
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> root [

	^ root
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> root: anObject [

	root := anObject
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> seqNum [

	^ seqNum
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> seqNum: anObject [

	seqNum := anObject
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> tonelCoverageFor: classToCover in: filePath [
	"The rationale of this method is to process the file line by line.
	When a method start is found, get the coverage status of this method and apply it to the following lines until the method end. 
	When a method end is found reset the coverage status as excluded"
	
	| coverageByLine coverageStatus inComment |
	coverageByLine := OrderedCollection new.
	coverageStatus := nil. "For coveralls nil represents an excluded line"
	inComment := false.
	(filePath asFileReference readStreamDo: [ :stream | stream contents ])
		linesDo: [ :line |
			(line beginsWith: $" asString ) ifTrue: [ inComment := inComment not ]. 
			(inComment not and: [line beginsWith: classToCover name])
				ifTrue: [ "Start of method" coverageStatus := self tonelMethodCoverageStatusFor: line ].
			coverageByLine add: coverageStatus.
			(inComment not and: [line beginsWith: ']'])
				ifTrue: [ "End Of Method" coverageStatus := nil ] ].
	^ coverageByLine asArray
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> tonelCoverallsSourceFileFor: classToCover in: projectDirectory [

	| sourceDirectory filePath |
	sourceDirectory := self tonelSourceDirectoryFor: projectDirectory.
	filePath := self class
		            tonelFilePathFor: classToCover
		            in: sourceDirectory.
	^ Dictionary newFrom: { 
			  ('name'
			   ->
			   (self class relativeUnixPathOf: filePath to: projectDirectory)).
			  ('source_digest' -> (self  md5Of: filePath)).
			  ('coverage' -> (self tonelCoverageFor: classToCover in: filePath)) }
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> tonelMethodCoverageStatusFor: methodDeclarationLine [

	"See http://docs.coveralls.io/api-reference for value mapping."

	| selector methodDeclarationParts actualClassName includedMethodsByClassName coveredMethodsByClassName |

	methodDeclarationParts := methodDeclarationLine substrings: '>>'.
	actualClassName := methodDeclarationParts first trimBoth.
	selector := (Smalltalk globals at: #TonelParser) new extractSelector: (methodDeclarationParts last copyWithout: $]).

	"Coveralls: 
 	  If the method is excluded -> nil
	  If the method is included and covered -> 1
	  If the method is inlcuded and uncovered -> 0"
	^ (includedMethodsByClassName at: actualClassName ifAbsent: [ #() ])
		detect: [ :methodReference | methodReference selector = selector ]
		ifFound: [ :methodReference | (coveredMethodsByClassName at: actualClassName ifAbsent: [ #() ]) detect: [ :coveredMethod | coveredMethod = methodReference ] ifFound: [ 1 ] ifNone: [ 0 ] ]
		ifNone: [ nil ]
]
