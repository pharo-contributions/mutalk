accessing
statusColor
	self result isAcceptableScore ifTrue: [ ^ Color green ].
	self result isNonAcceptableScore ifTrue: [ ^ Color red ].
	^ Color yellow