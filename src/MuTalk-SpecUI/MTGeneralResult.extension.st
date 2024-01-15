Extension { #name : 'MTGeneralResult' }

{ #category : '*MuTalk-SpecUI' }
MTGeneralResult >> inspectorExtension [

	<inspectorPresentationOrder: 0 title: 'Mutation Results'>
	^ MTMutationResultsPresenter on: self aliveMutants
]
