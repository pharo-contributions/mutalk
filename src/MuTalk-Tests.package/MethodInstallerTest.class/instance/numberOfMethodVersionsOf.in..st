accessing
numberOfMethodVersionsOf: aSelector in: aClass 
	[ ^ (OBMethodNode on: aSelector inClass: aClass) versions size ] on: Error
		do: [ :signal | ^ 0 ]