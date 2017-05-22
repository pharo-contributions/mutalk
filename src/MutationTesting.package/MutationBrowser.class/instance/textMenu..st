building
textMenu: aMenuMorph 

	^ aMenuMorph
		add: 'Browse method' action: #openMutatedMethodBrowser;
		yourself