Extension { #name : 'MTAnalysis' }

{ #category : '*MuTalk-Utilities' }
MTAnalysis >> generateMatrix [

	| matrix |
	matrix := MTMatrix new analysis: self.
	matrix generateMatrix
]
