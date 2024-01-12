Class {
	#name : 'MTCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#instVars : [
		'result',
		'project',
		'commit',
		'diff'
	],
	#category : 'MuTalk-CI',
	#package : 'MuTalk-CI'
}

{ #category : 'accessing' }
MTCommandLineHandler class >> commandName [ 
	^ 'mutalk'

]

{ #category : 'accessing' }
MTCommandLineHandler class >> description [

	^ 'Runs mutation testing'
]

{ #category : 'activation' }
MTCommandLineHandler >> activate [

	| noquit saveit |
	self activateHelp ifTrue: [ ^ self ].
	project := self hasArgument: 'project'.
	diff := self hasArgument: 'diff'.
	commit := self hasArgument: 'commit'.
	project ifNotNil: [ 
		diff ifNotNil: [ self icebergProjectDiff ] ifNil: [ 
			commit
				ifNotNil: [ self icebergProjectCommit ]
				ifNil: [ self icebergProject ] ] ].
	noquit := self commandLine hasOption: 'noquit'.
	saveit := self commandLine hasOption: 'save'.
	Smalltalk snapshot: saveit andQuit: noquit not
]

{ #category : 'initialization' }
MTCommandLineHandler >> hasArgument: command [

	| cmd |
	(self hasOption: command) ifFalse: [ ^ nil ].
	cmd := '--' , command , '='.
	self arguments
		detect: [ :arg | arg beginsWith: cmd ]
		ifFound: [ :arg | ^ arg allButFirst: cmd size ]
]

{ #category : 'private' }
MTCommandLineHandler >> icebergProject [ 
			MutalkCI new
				project: project;
				mutateAll 
]

{ #category : 'private' }
MTCommandLineHandler >> icebergProjectCommit [

	MutalkCI new
		project: project;
		commit: commit;
		mutateDiff
]

{ #category : 'private' }
MTCommandLineHandler >> icebergProjectDiff [

			MutalkCI new
				project: project;
				recentCommit;
				mutateDiff 
]
