#tag Class
Protected Class BHToolbar
Inherits Toolbar
	#tag Method, Flags = &h0
		Sub AccessTo(ItemName as String, License as String, Permission as String)
		  dim item as ToolItem = Me.Find(name)
		  
		  if item <> nil then
		    item.Enabled = Company.Current().AccessTo(License, Permission)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LicenseTo(ItemName as String, License as String)
		  dim item as ToolItem = Me.Find(name)
		  
		  if item <> nil then
		    item.Enabled = Company.Current().LicenseTo(License)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PermissionTo(ItemName as String, Permission as String)
		  dim item as ToolItem = Me.Find(name)
		  
		  if item <> nil then
		    item.Enabled = Company.Current().PermissionTo(Permission)
		  end
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="32"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
