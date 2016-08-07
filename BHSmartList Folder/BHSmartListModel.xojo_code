#tag Class
Protected Class BHSmartListModel
	#tag Property, Flags = &h0
		FolderID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		id As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		isEditable As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Query As QueryBuilder
	#tag EndProperty

	#tag Property, Flags = &h0
		tag As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		title As String
	#tag EndProperty

	#tag Property, Flags = &h0
		type As BHsmartList.RowType
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="FolderID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="icon"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="id"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isEditable"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="Query"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			Type="BHsmartList.RowType"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
