accessing
codeDifference
	^ TextDiffBuilder 
		buildDisplayPatchFrom: mutantEvaluationResult mutant modifiedSource
		to: mutantEvaluationResult mutant originalSource
		inClass: mutantEvaluationResult mutant originalClass
		prettyDiffs: true