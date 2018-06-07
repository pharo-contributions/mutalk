baselines
baseline: spec
	<baseline>

	spec for: #common do: [

		spec for: #'pharo6.x' do: [
			spec group: 'testCoverage' with: #().].
		spec for: #'pharo7.x' do: [
			spec package: 'TestCoverage'.
			spec group: 'testCoverage' with: #('TestCoverage').].

		spec 
			package: 'MuTalk-Model';
			package: 'MuTalk-TestResources';
			package: 'MuTalk-Tests'.
			"package: 'MuTalk-UI'."
			
			spec group: 'default' with: #('MuTalk-Model' 'MuTalk-TestResources' 'MuTalk-Tests' 'testCoverage').

	].		