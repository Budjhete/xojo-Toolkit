#tag Class
Protected Class AutocompleteManager
Inherits Dictionary
Implements AutocompleteMessageReceiver
	#tag Method, Flags = &h0
		Sub AddRow(text as String, tag as Variant = Nil)
		  mText.Append(text)
		  mTag.Append(tag)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutocompleteBackgroundPaint(g as Graphics, row as Integer, isSelected as Boolean) As Boolean
		  return RaiseEvent AutocompleteBackgroundPaint(g, row, isSelected)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteCancelled()
		  RaiseEvent AutocompleteCancelled()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutocompleteGetList() As String()
		  RaiseEvent AutocompleteRefreshList(Text)
		  return mText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteKeyDown(key as String)
		  RaiseEvent AutocompleteKeyDown(key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteRequestFocus()
		  RaiseEvent AutocompleteRequestFocus()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteRequestPosition(ByRef x as Integer, ByRef y as Integer)
		  RaiseEvent AutocompleteRequestPosition(x, y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteSelected(value as String, index as Integer, key as String)
		  RaiseEvent AutocompleteSelected(value, index, key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutocompleteTextPaint(g as Graphics, row as Integer, x as Integer, y as Integer, text as String) As Boolean
		  return RaiseEvent AutocompleteTextPaint(g, row, x, y, text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteUpdateText(text as String)
		  Me.Text = text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  Redim mText(-1)
		  Redim mTag(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleKeyDown(key as String) As Boolean
		  #if TargetLinux
		    return SuggestionWindowLinux.HandleKeyDown(key)
		  #else
		    return SuggestionWindow.HandleKeyDown(key)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LostFocus()
		  SuggestionWindow.LostFocus()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tag(row as Integer) As Variant
		  if row <= mTag.Ubound then
		    return mTag(row)
		  end
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextChange(text as String, selectionPosition as Integer = - 1)
		  Me.Text = text
		  
		  if selectionPosition >= 0 then
		    Me.SelectionPosition = selectionPosition
		  else
		    Me.SelectionPosition = (Me.Text.Len-1)
		  end
		  
		  #if TargetLinux
		    SuggestionWindowLinux.Listener = Self
		    SuggestionWindowLinux.DefaultRowHeight = 30
		    SuggestionWindowLinux.TextChange(Me.Text)
		  #else
		    SuggestionWindow.Listener = Self
		    SuggestionWindow.DefaultRowHeight = 30
		    SuggestionWindow.TextChange(Me.Text)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AutocompleteBackgroundPaint(g as Graphics, row as Integer, isSelected as Boolean) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteCancelled()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteKeyDown(key as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteRefreshList(value as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteRequestFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteRequestPosition(ByRef x as Integer, ByRef y as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteSelected(value as String, index as Integer, key as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteTextPaint(g as Graphics, row as Integer, x as Integer, y as Integer, text as String) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private mTag() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mText() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectionPosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Text As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BinCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
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
			Name="SelectionPosition"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
