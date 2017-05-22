initialization
registerInToolsFlap
	self environment at: #Flaps ifPresent: [ :class |
		class
			registerQuad: #( MutationTestRunner build 'Mutation Testing Runner' 'mutation testing runner.' ) forFlapNamed: 'Tools';
			replaceToolsFlap ].