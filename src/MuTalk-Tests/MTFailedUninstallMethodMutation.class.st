Class {
	#name : #MTFailedUninstallMethodMutation,
	#superclass : #MTMethodMutation,
	#category : 'MuTalk-Tests'
}

{ #category : #installing }
MTFailedUninstallMethodMutation >> uninstall [

	self error
]
