Extension { #name : 'MTGeneralResult' }

{ #category : '*MuTalk-SpecUI' }
MTGeneralResult >> filteredTestsExtension [

	<inspectorPresentationOrder: 3 title: 'Filtered Tests'>
	^ MTFilteredTestsPresenter on: filteredTests
]

{ #category : '*MuTalk-SpecUI' }
MTGeneralResult >> killedMutantsExtension [

	<inspectorPresentationOrder: 1 title: 'Killed Mutants'>
	^ MTMutationResultsPresenter on: self killedMutants
]

{ #category : '*MuTalk-SpecUI' }
MTGeneralResult >> survivingMutantsExtension [

	<inspectorPresentationOrder: 0 title: 'Surviving Mutants'>
	^ MTMutationResultsPresenter on: self aliveMutants
]

{ #category : '*MuTalk-SpecUI' }
MTGeneralResult >> terminatedMutantsExtension [

	<inspectorPresentationOrder: 2 title: 'Terminated Mutants'>
	^ MTMutationResultsPresenter on: self terminatedMutants
]
