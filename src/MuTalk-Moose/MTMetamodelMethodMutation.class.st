Class {
	#name : #MTMetamodelMethodMutation,
	#superclass : #MTMethodMutation,
	#category : #'MuTalk-Moose-Core'
}

{ #category : #installing }
MTMetamodelMethodMutation >> install [

	super install.
	originalClass generate
]
