Class {
	#name : 'BaselineOfMuTalk',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMuTalk',
	#package : 'BaselineOfMuTalk'
}

{ #category : 'baselines' }
BaselineOfMuTalk >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec
		   package: 'TestCoverage';
			package: 'MuTalk-Model' with: [ spec requires: #( 'TestCoverage' ) ];
			package: 'MuTalk-TestResources' with: [ spec requires: #( 'MuTalk-Model' ) ];
			package: 'MuTalk-CI' with: [ spec requires: #( 'MuTalk-Model' ) ];
			package: 'MuTalk-CI-Tests' with: [ spec requires: #( 'MuTalk-Model' 'MuTalk-CI' ) ];
			package: 'MuTalk-Tests' with: [ spec requires: #( 'MuTalk-Model' 'MuTalk-TestResources' 'MuTalk-Utilities' ) ];
			package: 'MuTalk-SpecUI' with: [ spec requires: #('MuTalk-Model') ];
			package: 'MuTalk-Utilities' with: [ spec requires: #( 'MuTalk-Model' ) ].

		spec
			group: 'default'
			with:
				#( 'TestCoverage' 'MuTalk-Model' 'MuTalk-TestResources' 'MuTalk-Tests'
				   'MuTalk-CI' 'MuTalk-CI-Tests' 'MuTalk-SpecUI' 'MuTalk-Utilities' ) ]
]
