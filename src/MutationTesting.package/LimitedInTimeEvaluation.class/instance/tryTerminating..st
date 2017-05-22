evaluation
tryTerminating: aProcess
	[aProcess isTerminated ifFalse: [aProcess terminate]] forkAt: Processor userBackgroundPriority. 
