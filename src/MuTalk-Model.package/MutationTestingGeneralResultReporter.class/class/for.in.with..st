instance creation
for: aMutationGeneralResut in: aFileReference with: aPackagesNames
	^self new 
		initializeFor: aMutationGeneralResut in: aFileReference asFileReference with: aPackagesNames;
		yourself