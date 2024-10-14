Extension { #name : 'MTAnalysis' }

{ #category : '*MuTalk-Examples' }
MTAnalysis class >> exampleMyVehicle [

	<script>
	| analysis |
	analysis := self new.
	analysis classesToMutate: { MyVehicle }.
	analysis testClasses: { MyVehicleTest }.

	analysis run.
	analysis generalResult inspect
]
