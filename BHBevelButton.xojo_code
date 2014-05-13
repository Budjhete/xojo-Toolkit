#tag Class
Protected Class BHBevelButton
Inherits BevelButton
	#tag Method, Flags = &h0
		Sub AddRow(pText As String)
		  Me.AddRow(Nil, pText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(pRowTag As Variant, pText As String)
		  mRowTags.Append(pRowTag)
		  Super.AddRow(pText)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSeparator()
		  Super.AddSeparator()
		  
		  mRowTags.Append(nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  Super.DeleteAllRows()
		  
		  redim mRowTags(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pRowTag As Variant) As Integer
		  For pIndex As Integer = 0 To mRowTags.Ubound
		    If pRowTag = mRowTags(pIndex) Then
		      Return pIndex
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(pRow As Integer, pText As String)
		  InsertRow(pRow, Nil, pText)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(pRow As Integer, pRowTag As Variant, pText As String)
		  mRowTags.Insert(pRow, pRowTag)
		  Super.InsertRow(pRow, pText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(row As Integer)
		  Super.RemoveRow(row)
		  mRowTags.Remove(row)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag() As Variant
		  Return Me.RowTag(Me.ListIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag(row as Integer) As Variant
		  Return mRowTags(row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowTag(row as Integer, Assigns value as Variant)
		  mRowTags(row) = value
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.MenuValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.MenuValue = value
			End Set
		#tag EndSetter
		ListIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mRowTags() As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			Type="Color"
			EditorType="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bevel"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Small Bevel"
				"1 - Normal Bevel"
				"2 - Large Bevel"
				"3 - Rounded Bevel"
				"4 - No Bevel"
				"5 - Round"
				"6 - Large Round"
				"7 - Disclosure"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="boolean"
			EditorType="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonType"
			Visible=true
			Group="Behavior"
			Type="integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Button"
				"1 - Toggles"
				"2 - Sticky"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptionAlign"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Flush Left"
				"1 - Flush Right"
				"2 - Sys Direction"
				"3 - Center"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptionDelta"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptionPlacement"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Sys Direction"
				"1 - Normally"
				"2 - Right of Graphic"
				"3 - Left of Graphic"
				"4 - Below Graphic"
				"5 - Above Graphic"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackColor"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasMenu"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - No Menu"
				"1 - Normal Menu"
				"2 - Menu on Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconAlign"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Sys Direction"
				"1 - Center"
				"2 - Left"
				"3 - Right"
				"4 - Top"
				"5 - Bottom"
				"6 - TopLeft"
				"7 - BottomLeft"
				"8 - TopRight"
				"9 - BottomRight"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconDX"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconDY"
			Visible=true
			Group="Appearance"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Position"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="boolean"
			EditorType="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuValue"
			Visible=true
			Group="Initial State"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			Type="Color"
			EditorType="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			Type="string"
			EditorType="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			Type="single"
			EditorType="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="boolean"
			EditorType="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Initial State"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="60"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
