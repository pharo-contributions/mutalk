Extension { #name : 'MTAnalysis' }

{ #category : '*MuTalk-Utilities' }
MTAnalysis >> generateHeatmapByClass [

	| matrix |
	matrix := MTMatrix new analysis: self.
	matrix generateHeatmapByClass
]

{ #category : '*MuTalk-Utilities' }
MTAnalysis >> generateHeatmapByMethod [

	| matrix |
	matrix := MTMatrix new analysis: self.
	matrix generateHeatmapByMethod
]

{ #category : '*MuTalk-Utilities' }
MTAnalysis >> generateHeatmapByOperator [

	| matrix |
	matrix := MTMatrix new analysis: self.
	matrix generateHeatmapByOperator
]

{ #category : '*MuTalk-Utilities' }
MTAnalysis >> generateMatrix [

	| matrix |
	matrix := MTMatrix new analysis: self.
	matrix generateMatrix
]
