Extension { #name : 'MTAnalysis' }

{ #category : '*MuTalk-Examples' }
MTAnalysis class >> exampleAnalysis [

	<script>
	| analysis |
	analysis := self new.
	analysis classesToMutate: { MyVehicle }.
	analysis testClasses: { MyVehicleTest }.

	analysis run.
	analysis generalResult inspect
]

{ #category : '*MuTalk-Examples' }
MTAnalysis class >> exampleAnalysisWithLessOperators [

	<script>
	| mtAnalysis removedOperators nonMutatedAnalysis |
	mtAnalysis := self new.
	mtAnalysis classesToMutate: { MyVehicle }.
	mtAnalysis testClasses: { MyVehicleTest }.

	removedOperators := { MTEmptyMethodOperator }.
	mtAnalysis operators:
		(MTAbstractMutantOperator contents reject: [ :operator |
			 removedOperators includes: operator class ]).

	mtAnalysis run.
	mtAnalysis generalResult inspect.

	"Uncomment the following instructions to get non mutated methods"
	
	"nonMutatedAnalysis := MTNonMutatedMethodsAnalysis forClasses: { MyVehicle }.
	nonMutatedAnalysis mtAnalysis: mtAnalysis.
	nonMutatedAnalysis methodsWithoutMutation inspect"
]

{ #category : '*MuTalk-Examples' }
MTAnalysis class >> exampleWithHeatmap [

	<script>
	| matrix |
	matrix := MTMatrix forClasses: { MyVehicle }.
	matrix build.
	matrix generateHeatmapWithMutationsGroupedByMethod
]

{ #category : '*MuTalk-Examples' }
MTAnalysis class >> exampleWithMatrix [

	<script>
	| matrix |
	matrix := MTMatrix forClasses: { MyVehicle }.
	matrix build.
	matrix generateMatrix
]
