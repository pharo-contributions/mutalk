building-private
testResultWithFailure
	"Build a TestResult with failure"
	| case |
	case := testResource class selector: #fail.
	^ case run