Class {
	#name : 'MTNonMutatedMethodsAnalysis',
	#superclass : 'MTUtilityAnalysis',
	#category : 'MuTalk-Utilities',
	#package : 'MuTalk-Utilities'
}

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> allMethods [

	^ classes inject: OrderedCollection new into: [ :coll :class |
		  coll addAll: (class methods reject: #isExtension).
		  coll ]
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> methodsWithoutMutation [

	| allMethods allMutatedMethods |
	allMethods := self allMethods.
	allMutatedMethods := self mutatedMethods.

	^ allMethods reject: [ :method | allMutatedMethods includes: method ]
]

{ #category : 'computing' }
MTNonMutatedMethodsAnalysis >> mutatedMethods [

	| analysis mutatedMethods |
	analysis := MTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  };
		            operators: MTAbstractMutantOperator contentsAll.

	mutatedMethods := Set withAll:
		                  (analysis generateMutations collect:
			                   #originalMethod).
	^ mutatedMethods
]
