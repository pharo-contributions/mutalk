open/close
openOn: aMutation 
	"Open browser for aMutation."
	^ ToolBuilder
		open: (self for: aMutation)