building
buildLogCheckBoxWith: aBuilder
	^aBuilder pluggableButtonSpec new
				model: self; 
				help: 'Activate Logging to File';
				label: #loggingActivatedMark;
				action: #activateLogging;
				enabled: true;
				yourself.