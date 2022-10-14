Class {
	#name : #MutalkCITonelJsonExporter,
	#superclass : #AbstractMutationTestingJsonExporter,
	#instVars : [
		'seqNum',
		'pull_request_id',
		'commit',
		'cloneLocation',
		'root',
		'coverageInfo'
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
MutalkCITonelJsonExporter >> coverageInfo [

	^ coverageInfo
]

{ #category : #accessing }
MutalkCITonelJsonExporter >> coverageInfo: anObject [

	coverageInfo := anObject
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> export [

	| source_files test_cases json obj |
	source_files := mtResult modelClasses collect: [ :class | 
		                self exportClassMutations: class ].
	test_cases := self exportTestCases.
	obj := { 
		       (#git_commit_sha -> commit).
		       (#service_name -> 'mutalkCI').
		       (#service_job_id -> '1').
		       (#test_cases -> test_cases asArray).
		       (#files -> source_files asArray) } asDictionary.
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

	| sequence_number descrption start_line end_line mutated_source result modifiedSource originalSource mutatedNode nodeToMutate offset classToCover selector mutated_lines coveredBy dictionary mutationCoverage |
	seqNum := seqNum + 1.
	sequence_number := seqNum.
	descrption := mutationEvaluation mutant asString.
	modifiedSource := mutationEvaluation mutant modifiedSource.
	originalSource := mutationEvaluation mutant originalSource.
	mutatedNode := mutationEvaluation mutant mutatedNode.
	nodeToMutate := mutationEvaluation mutant nodeToMutate.
	classToCover := mutationEvaluation mutant originalClass.
	selector := mutationEvaluation mutant originalMethod selector.
	mutationEvaluation survived ifTrue: [ 
		mutationCoverage := coverageInfo detect: [ :item | 
			                    (item at: #mutationEvaluation)
			                    = mutationEvaluation ].
		coveredBy := (mutationCoverage at: #coveredBy) collect: [ :item | 
			             self
				             generateCoveredByFor: item
				             mutationCoverage: mutationCoverage ] ].
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
	"mutated_source := mutatedNode formattedCode."
	mutated_lines := self
		                 extractMutatedLine: mutatedNode
		                 nodeToMutate: nodeToMutate
		                 originalSource: originalSource
		                 modifiedSource: modifiedSource.
	mutationEvaluation killed ifTrue: [ result := 'K' ].
	mutationEvaluation survived ifTrue: [ result := 'S' ].
	mutationEvaluation terminated ifTrue: [ result := 'T' ].
	dictionary := { 
		              (#sequence_number -> sequence_number).
		              (#description -> descrption).
		              (#start_line -> (offset + start_line - 1)).
		              (#end_line -> (offset + end_line - 1)).
		              (#mutated_source_code -> mutated_lines).
		              (#result -> result) } asDictionary.
	coveredBy ifNotNil: [ dictionary at: #covered_by put: coveredBy asArray ].
	^ dictionary
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> exportTestCases [

	^ mtResult testCases collect: [ :tcase | 
		| fileName |
		fileName := self getPathOfClass: tcase testCase class.
		fileName , ':' , tcase testCase selector ]
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> extractMutatedLine: mutatedNode nodeToMutate: nodeToMutate originalSource: originalSource modifiedSource: modifiedSource [

	| mSource_1 mSource_2 mSource_3 mSource ending changedLines mSource_1_break start_of_changes |
	ending := Character lf.

	mSource_1 := nodeToMutate start > 1
		             ifTrue: [ 
		             originalSource copyFrom: 1 to: nodeToMutate start - 1 ]
		             ifFalse: [ '' ].
	mSource_1_break := mSource_1 endsWithAnyOf: { 
			                   String lf.
			                   String cr }.
	mSource_2 := mutatedNode formattedCode.
	mSource_3 := nodeToMutate stop = originalSource size
		             ifTrue: [ '' ]
		             ifFalse: [ 
		             originalSource
			             copyFrom: nodeToMutate stop + 1
			             to: originalSource size ].
	mSource := mSource_1 , mSource_2 , mSource_3.
	start_of_changes := mSource_1 lines size + (mSource_1_break
		                     ifTrue: [ 1 ]
		                     ifFalse: [ 0 ]).
	changedLines := ending join: (mSource lines
			                 copyFrom: start_of_changes
			                 to: start_of_changes + mSource_2 lines size - 1).
	
	^ changedLines
]

{ #category : #'as yet unclassified' }
MutalkCITonelJsonExporter >> generateCoveredByFor: coverageInfoItem mutationCoverage: mutationCoverage [

	| class file result level testMethodName line path |
	level := 1.
	((mutationCoverage at: #testStateChangedIn) anySatisfy: [ :item | 
		 item = coverageInfoItem ]) ifTrue: [ level := 4 ].
	testMethodName := coverageInfoItem testCase selector asString.
	path := self getPathOfClass: coverageInfoItem testCase class.
	file := self getFileOfClass: coverageInfoItem testCase class.
	line := self
		        lineNumberOffsetClass: coverageInfoItem testCase class
		        method: testMethodName
		        in: file.
	result := Dictionary new.
	result at: #test_method_name put: testMethodName.
	result at: #file put: path.
	result at: #line put: line.
	result at: #level put: level.
	^ result
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
