#tag Class
Protected Class AutocompleteTextField
Inherits RichTextField
Implements AutocompleteMessageReceiver
	#tag Event
		Function KeyDown(key As String) As Boolean
		  #if TargetLinux
		    return (SuggestionWindowLinux.HandleKeyDown(key) and RaiseEvent KeyDown(key))
		  #else
		    return (SuggestionWindow.HandleKeyDown(key) and RaiseEvent KeyDown(key))
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  SuggestionWindow.LostFocus()
		  RaiseEvent LostFocus()
		End Sub
	#tag EndEvent

	#tag Event
		Sub ValueChange()
		  if Me.Enabled and not Me.ReadOnly then
		    
		    #if TargetLinux
		      
		      SuggestionWindowLinux.Listener = Self
		      SuggestionWindowLinux.DefaultRowHeight = 30
		      SuggestionWindowLinux.MinimumWidth = Me.Width
		      SuggestionWindowLinux.TextChange(Me.Value)
		      
		    #else
		      
		      SuggestionWindow.Listener = Self
		      SuggestionWindow.DefaultRowHeight = 30
		      SuggestionWindow.MinimumWidth = Me.Width
		      SuggestionWindow.TextChange(Me.Value)
		      
		    #endif
		    
		  end
		  
		  
		  RaiseEvent ValueChange()
		  
		End Sub
	#tag EndEvent


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
		  RaiseEvent AutocompleteRefreshList()
		  return mText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteRequestFocus()
		  Me.TrueWindow.SetFocus()
		  
		  #if TargetWin32
		    Me.TrueWindow.FocusNext()
		  #endif
		  
		  Me.TrueWindow.Focus = Me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteRequestPosition(ByRef x as Integer, ByRef y as Integer)
		  #if TargetLinux
		    
		    x = ScreenLeft
		    y = ScreenTop
		    
		  #else
		    
		    x = ScreenLeft
		    y = ScreenTop + Me.Height
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteSelected(value as String, index as Integer, key as String)
		  dim text as String = Me.Text
		  
		  Me.Text = value
		  Me.SelStart = value.Len
		  
		  RaiseEvent AutocompleteSelected(value, text, index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutocompleteTextPaint(g as Graphics, row as Integer, x as Integer, y as Integer, text as String) As Boolean
		  return RaiseEvent AutocompleteTextPaint(g, row, x, y, text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutocompleteUpdateText(text as String)
		  Me.Value = text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  Redim mText(-1)
		  Redim mTag(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenLeft() As Integer
		  return Me.ScreenX ' (Super.TrueWindow.Left + Me.Left)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenTop() As Integer
		  return Me.ScreenY ' (Super.TrueWindow.Top + Me.Top)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tag(row as Integer) As Variant
		  if row <= mTag.Ubound then
		    return mTag(row)
		  end
		  
		  return nil
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AutocompleteBackgroundPaint(g as Graphics, row as Integer, isSelected as Boolean) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteCancelled()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteRefreshList()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteSelected(value as String, text as String, index as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutocompleteTextPaint(g as Graphics, row as Integer, x as Integer, y as Integer, text as String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(key as String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChange()
	#tag EndHook


	#tag Property, Flags = &h0
		mSuggestionWindow As SuggestionWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTag() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mText() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CueText"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="EmptyColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c888888"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EmptyValue"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
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
			Name="isInitialized_"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
			Name="LimitText"
			Visible=true
			Group="Behavior"
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
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotifyIfEmpty"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
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
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
