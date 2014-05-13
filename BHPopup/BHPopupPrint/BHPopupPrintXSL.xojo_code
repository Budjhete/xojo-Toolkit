#tag Class
Protected Class BHPopupPrintXSL
Inherits BHPopupPrint
	#tag Method, Flags = &h1000
		Sub Constructor(pXSLObject As XSLObject)
		  Super.Constructor(New BHViewerXSL(pXSLObject))
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
