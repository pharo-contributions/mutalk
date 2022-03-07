Extension { #name : #MutationTestingGeneralResult }

{ #category : #'*MuTalk-SpecUI' }
MutationTestingGeneralResult >> inspectorExtension [

	<inspectorPresentationOrder: 0 title: 'Mutation Results'>
	^ MutationResultsPresenter on: self aliveMutants
]
