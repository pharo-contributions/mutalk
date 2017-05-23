private
methodNameOf: aCompiledMethod 
	^aCompiledMethod methodClass name asString , '>>' , aCompiledMethod selector printString 