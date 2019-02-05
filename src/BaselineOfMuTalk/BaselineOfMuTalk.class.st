Class {
	#name : #BaselineOfMuTalk,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMuTalk'
}

{ #category : #baselines }
BaselineOfMuTalk >> baseline: spec [
	<baseline>

	spec for: #common do: [

		spec for: #'pharo6.x' do: [
			spec group: 'testCoverage' with: #().].
		spec for: #'pharo7.x' do: [
			spec package: 'TestCoverage'.
			spec group: 'testCoverage' with: #('TestCoverage').].
		spec for: #'pharo8.x' do: [
			spec package: 'TestCoverage'.
			spec group: 'testCoverage' with: #('TestCoverage').].

		spec 
			package: 'MuTalk-Model' with: [
				spec requires: #('testCoverage')];
			package: 'MuTalk-TestResources' with: [
				spec requires: #('MuTalk-Model')];
			package: 'MuTalk-Tests' with: [
				spec requires: #('MuTalk-Model' 'MuTalk-TestResources')].
			"package: 'MuTalk-UI'."
			
		spec group: 'default' with: #('MuTalk-Model' 'MuTalk-TestResources' 'MuTalk-Tests').

	].		
]
