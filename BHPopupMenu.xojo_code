#tag Class
Protected Class BHPopupMenu
Inherits PopupMenu
Implements SortInterface,BHControl
	#tag Method, Flags = &h0
		Sub AddRow(pText As String)
		  #if not TargetMacOS
		    if pText = "-" then
		      return
		    end
		  #endif
		  
		  Super.AddRow(pText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(pText as String, pTag as Variant)
		  #if not TargetMacOS
		    if pText = "-" then
		      return
		    end
		  #endif
		  
		  Super.AddRow(pText)
		  Me.RowTag(Me.LastIndex) = pTag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  // If it could be empty and it is empty, no need to check other validations
		  If Not NotEmpty And Me.ListIndex = -1 Then
		    Return True
		  End If
		  
		  Return Not RaiseEvent Check
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compare(left as Integer, right as Integer) As Integer
		  return StrComp(Me.List(left).RemoveAccents(), Me.List(right).RemoveAccents, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillWithAccounts()
		  FillWithAccounts("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillWithAccounts(pAndWhere as String)
		  Dim result as SQLResult
		  Dim Sql as String
		  
		  Sql = "SELECT noCompte, Nom " + _
		  " FROM Compte " + _
		  " WHERE EstActif = 1 AND NoCompte IS NOT NULL " + pAndWhere + _
		  " ORDER BY NoCompte ASC"
		  result = doQuery(Sql)
		  
		  Me.DeleteAllRows()
		  
		  Dim i As Integer = 0
		  While result.Fetch()
		    Me.AddRow(result.Field("noCompte").StringValue + ". " + result.Field("Nom").StringValue, result.Field("noCompte").IntegerValue)
		    Me.RowTag(i) = result.Field("noCompte").IntegerValue
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pTag As Variant) As Integer
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If Me.RowTag(pRow) = pTag Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(row As Integer, str As String)
		  #if not TargetMacOS
		    if str = "-" then
		      return
		    end
		  #endif
		  
		  Super.InsertRow(row,str)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(row As Integer, str As String, tag as Variant)
		  #if not TargetMacOS
		    if str = "-" then
		      return
		    end
		  #endif
		  
		  Super.InsertRow(row,str)
		  Me.RowTag(row) = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastIndex() As Integer
		  Return ListCount - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListTag() As Variant
		  if ListIndex < 0 then
		    return nil
		  end
		  
		  return RowTag(ListIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRows(pFrom As Integer, pTo As Integer)
		  // Remove rows from pFrom to pTo inclusively
		  
		  For pRow As Integer = pTo DownTo pFrom
		    Me.RemoveRow(pRow)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag() As Variant
		  Return Me.RowTag(Me.ListIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowTag(Assigns pTag As Variant)
		  // Pas la bonne implémentation
		  // Cette méthode devrait assigner le tag de la row a ListIndex comme dans BHListBox
		  Me.ListIndex = Me.Find(pTag)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectRowTag(pValue As Variant)
		  // Selects the MenuItem that contains pValue as its rowtag
		  Dim pIndex As Integer = 0
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If Me.RowTag(pRow) = pValue Then
		      pIndex = pRow
		    End If
		  Next
		  // If the selected index doesn't exist, the first row will be selected
		  Me.ListIndex = pIndex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  SortLibrary.Sort(Me, Me.ListCount-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Swap(index1 as Integer, index2 as Integer)
		  dim value1, value2 as String
		  dim tag1, tag2 as Variant
		  
		  value1 = Me.List(index1)
		  value2 = Me.List(index2)
		  
		  tag1 = Me.RowTag(index1)
		  tag2 = Me.RowTag(index2)
		  
		  RemoveRow(index1)
		  InsertRow(index1, value2)
		  Me.RowTag(index1) = tag2
		  
		  RemoveRow(index2)
		  InsertRow(index2, value1)
		  Me.RowTag(index2) = tag1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(pRecordSet As RecordSet, pTagField As String, pTextField As String, pStart As Integer = 0)
		  While Not pRecordSet.EOF
		    
		    For pRow As Integer = pStart To Me.ListCount - 1
		      
		      If pRecordSet.Field(pTagField).Value = Me.RowTag(pRow) Then
		        Me.RemoveRows(pStart, pRow - 1) // remove seen rows
		        Exit
		      End If
		      
		    Next
		    
		    // Add missing entry
		    If pStart >= Me.ListCount Then
		      Me.AddRow(pRecordSet.Field(pTagField).Value ,pRecordSet.Field(pTextField).StringValue)
		    ElseIf pRecordSet.Field(pTagField).Value <> Me.RowTag(pStart) Then
		      Me.InsertRow(pStart, pRecordSet.Field(pTextField).StringValue, pRecordSet.Field(pTagField).Value)
		    End If
		    
		    pRecordSet.MoveNext
		    pStart = pStart + 1
		    
		  WEnd
		  If pStart < Me.ListCount Then
		    Me.RemoveRows(pStart, Me.ListCount - 1)
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Check() As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		NotEmpty As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
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
			InitialValue="20"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Position"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotEmpty"
			Visible=true
			Group="Validation"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
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
			InitialValue="80"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
