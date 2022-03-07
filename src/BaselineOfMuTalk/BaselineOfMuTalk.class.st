Class {
	#name : #BaselineOfMuTalk,
	#superclass : #BaselineOf,
	#category : #BaselineOfMuTalk
}

{ #category : #baselines }
BaselineOfMuTalk >> baseline: spec [
	<baseline>

	spec for: #common do: [
	
		spec for: #'pharo10.x' do: [
			spec package: 'MuTalk-Model' with: [ spec includes: #('MuTalk-SpecUI') ].
			spec package: 'MuTalk-SpecUI' with: [ spec requires: #('MuTalk-Model') ] ].
		spec for: #'pharo9.x' do: [
			spec package: 'MuTalk-SpecUI' with: [ spec requires: #('MuTalk-Model') ] ].
		
		spec
			package: 'TestCoverage';
			package: 'MuTalk-Model' with: [
				spec requires: #('TestCoverage')];
			package: 'MuTalk-TestResources' with: [
				spec requires: #('MuTalk-Model')];
			package: 'MuTalk-Tests' with: [
				spec requires: #('MuTalk-Model' 'MuTalk-TestResources')].
			"package: 'MuTalk-UI'."
			
		spec group: 'default' with: #('MuTalk-Model' 'MuTalk-TestResources' 'MuTalk-Tests').

	].		
]
