accessing
run: aSelector with: anArray in: aReceiver
	self mark.
	^ aReceiver withArgs: anArray executeMethod: method