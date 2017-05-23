building-private
testResultWithoutErrorOrFailure
	"Build a TestResult without errors or failures"
	| case |
	case := testResource class selector: #pass.
	^ case run