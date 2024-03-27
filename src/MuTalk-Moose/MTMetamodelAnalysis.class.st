Class {
	#name : #MTMetamodelAnalysis,
	#superclass : #MTAnalysis,
	#category : #'MuTalk-Moose-Core'
}

{ #category : #running }
MTMetamodelAnalysis class >> runFamixGeneratorConfig [

	| analysis |
	analysis := self new
		            classesToMutate: { FamixGenerator };
		            testClasses: { FmxMBGeneratorTest };
		            operators: MTAbstractMutantOperator contentsFamix;
		            "Limits the global running time to 2 minutes"
		            budget: (MTTimeBudget for: 2 minutes);
		            "Only the tests covering the evaluated mutant are run"
		            testSelectionStrategy:
			            MTSelectingFromCoverageTestSelectionStrategy new;
		            "Randomize the mutants to be evaluated so that running this script multiple times will *potentially* evaluate more mutants"
		            mutantSelectionStrategy:
			            MTRandomMutantSelectionStrategy new.
	analysis run.
	"Regenerate all metamodels to remove the last evaluated mutation"
	FamixMetamodelGenerator generateAllMetamodels.
	analysis generalResult inspect
]

{ #category : #running }
MTMetamodelAnalysis class >> runJavaMetamodelConfig [

	| analysis |
	analysis := self new
		            classesToMutate: {
				            FamixMetamodelGenerator.
				            FamixBasicInfrastructureGenerator.
				            FamixJavaGenerator };
		            testPackages: { 'Famix-Java-Tests' };
		            operators: MTAbstractMutantOperator contentsFamix.
	analysis run.
	"Regenerate all metamodels to remove the last evaluated mutation"
	FamixMetamodelGenerator generateAllMetamodels.
	analysis generalResult inspect
]
