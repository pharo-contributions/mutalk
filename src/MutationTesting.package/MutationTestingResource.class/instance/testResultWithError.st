building-private
testResultWithError
	"Build a TestResult with error"
	| case |
	case := testResource class selector: #error.
	^ case run