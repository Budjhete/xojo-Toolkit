#tag Module
Protected Module BHToolkit
	#tag Constant, Name = Error, Type = Color, Dynamic = False, Default = \"&cFFC3B7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Success, Type = Color, Dynamic = False, Default = \"&c000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Warning, Type = Color, Dynamic = False, Default = \"&c000000", Scope = Public
	#tag EndConstant


	#tag Enum, Name = Actions, Type = Integer, Flags = &h0
		Save
		  Delete
		  Update
		  Create
		  Cancel
		Ignore
	#tag EndEnum

	#tag Enum, Name = Levels, Type = Integer, Flags = &h0
		Warning
		  Error
		  Danger
		  Information
		Success
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
