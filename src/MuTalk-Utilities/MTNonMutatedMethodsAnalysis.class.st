Class {
	#name : 'MTNonMutatedMethodsAnalysis',
	#superclass : 'MTUtilityAnalysis',
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> findMethodsWithoutMutation [

	| allMethods allMutatedMethods |
	allMethods := self getAllMethods.
	allMutatedMethods := self getMutatedMethods.

	^ allMethods reject: [ :method | allMutatedMethods includes: method ]
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> getAllMethods [

	^ classes inject: OrderedCollection new into: [ :coll :class |
		  coll addAll: (class methods reject: #isExtension).
		  coll ]
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> getMutatedMethods [

	| analysis mutatedMethods |
	analysis := MTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  };
		            operators: MTMutantOperator contentsAll.

	mutatedMethods := Set withAll:
		                  (analysis generateMutations collect:
			                   #originalMethod).
	^ mutatedMethods
]
