#tag Class
Protected Class BHMenuItem
Inherits MenuItem
	#tag Method, Flags = &h0
		Sub AccessTo(ItemName as String, License as String, Permission as String)
		  dim item as MenuItem = Me.Find(ItemName)
		  
		  if item <> nil then
		    dim value as Boolean = Company.Current().AccessTo(License, Permission)
		    
		    item.Enabled = value
		    item.AutoEnable = value
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertAfter(AfterItemName as String, Item as MenuItem)
		  dim index as Integer = Me.IndexOf(AfterItemName)
		  
		  if index >= 0 then
		    Me.Insert(index+1, Item)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertBefore(BeforeItemName as String, Item as MenuItem)
		  dim index as Integer = Me.IndexOf(BeforeItemName)
		  
		  if index >= 0 then
		    Me.Insert(index, Item)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LicenseTo(ItemName as String, License as String)
		  dim item as MenuItem = Me.Find(ItemName)
		  
		  if item <> nil then
		    dim value as Boolean = Company.Current().PermissionTo(License)
		    
		    item.Enabled = value
		    item.AutoEnable = value
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PermissionTo(ItemName as String, Permission as String)
		  dim item as MenuItem = Me.Find(ItemName)
		  
		  if item <> nil then
		    dim value as Boolean = Company.Current().PermissionTo(Permission)
		    
		    item.Enabled = value
		    item.AutoEnable = value
		  end
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Text"
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
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
