initialization
unload

	self environment at: #Flaps ifPresent: [:cl | cl unregisterQuadsWithReceiver: self]. 
	TheWorldMenu unregisterOpenCommandWithReceiver: self.
