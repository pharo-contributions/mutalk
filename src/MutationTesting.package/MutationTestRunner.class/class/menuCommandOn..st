as yet unclassified
menuCommandOn: aBuilder 
	<worldMenu> 
	(aBuilder item: #'Mutation Testing')
			parent: #Tools;
			action:[self open]; 
			help: 'Mutation Testing Runner'.