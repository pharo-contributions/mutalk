instance creation
for: aMutant results: aTestResult 
	"This method is use for running tests. That's the reason why it sends nil as argument"
	^ self 
		for: aMutant
		results: aTestResult
		producedBy: nil