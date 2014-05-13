#tag Interface
Protected Interface AutocompleteMessageReceiver
	#tag Method, Flags = &h0
		Function AutocompleteBackgroundPaint(g as Graphics, row as Integer, isSelected as Boolean) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteCancelled()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutocompleteGetList() As String()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteRequestFocus()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteRequestPosition(ByRef x as Integer, ByRef y as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteSelected(value as String, index as Integer, key as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutocompleteTextPaint(g as Graphics, row as Integer, x as Integer, y as Integer, text as String) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteUpdateText(text as String)
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
		#tag EndViewProperty
	#tag EndViewBehavior
End Interface
#tag EndInterface
