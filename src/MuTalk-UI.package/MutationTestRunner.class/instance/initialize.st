initialization
initialize
	super initialize.
	killedMutantList := aliveMutantList := Array new.
	loggingActivated := false.
	SystemChangeNotifier uniqueInstance
		notify: self
			ofSystemChangesOfItem: #class
			change: #Added
			using: #update;
		notify: self
			ofSystemChangesOfItem: #class
			change: #Removed
			using: #update;
		notify: self
			ofSystemChangesOfItem: #class
			change: #Renamed
			using: #update;
		notify: self
			ofSystemChangesOfItem: #class
			change: #Recategorized
			using: #update.
	self
		update;
		reset