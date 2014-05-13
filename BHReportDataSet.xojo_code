#tag Class
Protected Class BHReportDataSet
Implements Reports.Dataset
	#tag Method, Flags = &h0
		Sub Constructor(pFields() As String = Nil)
		  If pFields <> Nil Then
		    mFields = pFields
		    ReDim mData(UBound(mData, 1), mFields.Ubound)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor1(pFields() As String = Nil)
		  If pFields <> Nil Then
		    mFields = pFields
		    ReDim mData(UBound(mData, 1), mFields.Ubound)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor2(pFields() As String = Nil)
		  If pFields <> Nil Then
		    mFields = pFields
		    ReDim mData(UBound(mData, 1), mFields.Ubound)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  // Part of the Reports.Dataset interface.
		  System.DebugLog "EOF"
		  If mCurrentRow > UBound(mData, 1) Then
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Field(idx As Integer) As Variant
		  // Part of the Reports.Dataset interface.
		  System.DebugLog "Field"
		  Return mData(mCurrentRow, idx)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Field(pName As String) As Variant
		  // Part of the Reports.Dataset interface.
		  
		  If pName = "" Then
		    Return ""
		  End If
		  
		  
		  If mFields.IndexOf(pName) <> -1 Then
		    Return Me.Field(mFields.IndexOf(pName))
		  ElseIf mGenericFields.IndexOf(pName) <> -1 Then
		    Return mGenericData(mGenericFields.IndexOf(pName))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextRecord() As Boolean
		  // Part of the Reports.Dataset interface.
		  System.DebugLog "NextRecord"
		  mCurrentRow = mCurrentRow + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  // Part of the Reports.Dataset interface.
		  System.DebugLog "Run"
		  // Does nothin', ya have to fill it yourself through AddRowOfData
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(pRowTag As String, pField As String, Assigns pData As Variant)
		  // Setter for mData using rowtags and field names
		  
		  
		  If mRows.IndexOf(pRowTag) = -1 Then
		    // Add the Row
		    mRows.Append(pRowTag)
		    ReDim mData(mRows.Ubound, UBound(mData, 2))
		  End If
		  
		  If mFields.IndexOf(pField) = -1 Then
		    // Add the field
		    mFields.Append(pField)
		    ReDim mData(UBound(mData, 1), mFields.Ubound)
		  End If
		  
		  mData(mRows.IndexOf(pRowTag), mFields.IndexOf(pField)) = pData
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(pField As String, Assigns pData As Variant)
		  // Setter for generic data
		  
		  If mGenericFields.IndexOf(pField) = -1 Then
		    // New Field
		    mGenericFields.Append(pField)
		    mGenericData.Append(pData)
		  Else
		    mGenericData(mGenericFields.IndexOf(pField)) = pData
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(pFieldName As String) As integer
		  // Part of the Reports.Dataset interface.
		  System.DebugLog "Type"
		  
		  If mFields.IndexOf(pFieldName) <> -1 Then
		    Return Me.Field(mFields.IndexOf(pFieldName)).Type
		  ElseIf mGenericFields.IndexOf(pFieldName) <> -1 Then
		    Return mGenericData(mGenericFields.IndexOf(pFieldName)).Type
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCurrentRow As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mData(0,0) As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFields() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGenericData() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGenericFields() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRows() As String
	#tag EndProperty


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
End Class
#tag EndClass
