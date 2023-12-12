Class {
	#name : 'PackageTestCasesSelectionStrategy',
	#superclass : 'TestCasesSelectionStrategy',
	#category : 'MuTalk-Model-TestCases selection strategies',
	#package : 'MuTalk-Model',
	#tag : 'TestCases selection strategies'
}

{ #category : 'printing' }
PackageTestCasesSelectionStrategy >> description [
	^'All tests in same packages'
]

{ #category : 'selecting' }
PackageTestCasesSelectionStrategy >> isClassTest: aClass [ 
	^ self testBaseClasses
		anySatisfy: [:class | aClass includesBehavior: class]
]

{ #category : 'selecting' }
PackageTestCasesSelectionStrategy >> testBaseClasses [
	^Array with: TestCase
]

{ #category : 'selecting' }
PackageTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	| testsPackage |
	testsPackage := self testPackageFrom: aTestCollection.
	^ testsPackage 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testPackage | 
			(self testClassesFromPackage: testPackage) do: [ :testClass | resultTests addAll: testClass suite tests ].
			resultTests ]
]

{ #category : 'selecting' }
PackageTestCasesSelectionStrategy >> testClassesFromPackage: aPackageName [ 
	^ (aPackageName asPackage) classes select: [ :class | self isClassTest: class ]
]

{ #category : 'selecting' }
PackageTestCasesSelectionStrategy >> testPackageFrom: aTestCollection [

	^(aTestCollection collect: [:testCase | testCase class package name]) asSet
]
