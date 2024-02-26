"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMuTalkModel,
	#superclass : #PackageManifest,
	#category : 'MuTalk-Model-Core'
}

{ #category : #'code-critics' }
ManifestMuTalkModel class >> ruleAssignmentInBlockRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MTMutantEvaluation #value #false)) #'2017-05-23T23:10:24.213312+02:00') )
]
