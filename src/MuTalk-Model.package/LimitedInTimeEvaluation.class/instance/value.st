evaluation
value
	| delay evaluationProcess valueToReturn originalProcess terminatedSemaphore |
	terminatedSemaphore := Semaphore new.
	[[delay := Delay forMilliseconds: timeInMiliseconds + self evaluationOverheadTime.
	originalProcess := Processor activeProcess.
	evaluationProcess := [valueToReturn := block value.
			delay unschedule.
			originalProcess resume]
				forkAt: Processor lowestPriority.
	delay wait.
	self tryTerminating: evaluationProcess]
		ensure: [terminatedSemaphore signal]]
		forkAt: Processor userBackgroundPriority.
	terminatedSemaphore wait.
	^ valueToReturn