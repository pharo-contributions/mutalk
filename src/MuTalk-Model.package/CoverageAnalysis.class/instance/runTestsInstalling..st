private
runTestsInstalling: wrappers 
	[self installAll: wrappers.
	self flushMethodLookupCaches.
	self runTests]
		ensure: [self uninstallAll: wrappers]