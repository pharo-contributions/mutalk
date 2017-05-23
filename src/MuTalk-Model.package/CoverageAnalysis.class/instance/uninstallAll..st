private
uninstallAll: wrappers 
	^ wrappers do: [ :each | each uninstall ]