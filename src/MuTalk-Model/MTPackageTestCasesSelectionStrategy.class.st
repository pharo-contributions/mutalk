Class {
	#name : #MTPackageTestCasesSelectionStrategy,
	#superclass : #MTTestCasesSelectionStrategy,
	#category : 'MuTalk-Model-TestCases selection strategies'
}

{ #category : #printing }
MTPackageTestCasesSelectionStrategy >> description [
	^'All tests in same packages'
]

{ #category : #selecting }
MTPackageTestCasesSelectionStrategy >> isClassTest: aClass [ 
	^ self testBaseClasses
		anySatisfy: [:class | aClass includesBehavior: class]
]

{ #category : #selecting }
MTPackageTestCasesSelectionStrategy >> testBaseClasses [
	^Array with: TestCase
]

{ #category : #selecting }
MTPackageTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	| testsPackage |
	testsPackage := self testPackageFrom: aTestCollection.
	^ testsPackage 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testPackage | 
			(self testClassesFromPackage: testPackage) do: [ :testClass | resultTests addAll: testClass suite tests ].
			resultTests ]
]

{ #category : #selecting }
MTPackageTestCasesSelectionStrategy >> testClassesFromPackage: aPackageName [ 
	^ (aPackageName asPackage) classes select: [ :class | self isClassTest: class ]
]

{ #category : #selecting }
MTPackageTestCasesSelectionStrategy >> testPackageFrom: aTestCollection [

	^(aTestCollection collect: [:testCase | testCase class package name]) asSet
]
