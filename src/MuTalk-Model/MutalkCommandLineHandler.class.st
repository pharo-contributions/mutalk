Class {
	#name : #MutalkCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'result'
	],
	#category : #'MuTalk-Model'
}

{ #category : #accessing }
MutalkCommandLineHandler class >> commandName [ 
	^ 'mutalk'

]

{ #category : #accessing }
MutalkCommandLineHandler class >> description [

	^ 'Runs mutation testing'
]

{ #category : #activation }
MutalkCommandLineHandler >> activate [

	| noquit saveit |
	self activateHelp ifTrue: [ ^ self ].
	(self hasOption: 'project') ifTrue: [ 
		(self hasOption: 'commit') ifTrue: [ self icebergProjectCommit ] ifFalse: [self icebergProject].
		 ].
	noquit := self commandLine hasOption: 'noquit'.
	saveit := self commandLine hasOption: 'save'.
	Smalltalk snapshot: saveit andQuit: noquit not
]

{ #category : #private }
MutalkCommandLineHandler >> icebergProject [

	| cmd |
	cmd := '--project='.
	self arguments
		detect: [ :arg | arg beginsWith: cmd ]
		ifFound: [ :arg | MutalkCI new project: (arg allButFirst: cmd size); mutateAll ]
]

{ #category : #private }
MutalkCommandLineHandler >> icebergProjectCommit [

	| cmd project commit |
	cmd := '--project='.
	self arguments
		detect: [ :arg | arg beginsWith: cmd ]
		ifFound: [ :arg | project := arg allButFirst: cmd size ].
	cmd := '--commit='.
	self arguments
		detect: [ :arg | arg beginsWith: cmd ]
		ifFound: [ :arg | commit := arg allButFirst: cmd size ].
	MutalkCI new
				project: project;
				commit: commit;
				mutateDiff
	 
]
