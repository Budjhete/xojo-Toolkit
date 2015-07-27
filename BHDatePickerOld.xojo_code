#tag Class
Protected Class BHDatePickerOld
Inherits BHTextField
	#tag Event
		Sub GotFocus()
		  if mFocusByClick then
		    SelectionChange()
		  elseif Keyboard.ShiftKey then
		    FieldSelected = FieldDay
		  else
		    FieldSelected = FieldYear
		  end
		  
		  UpdateSelection()
		  mFocusByClick = False
		  mBackupValue = Date.Clone()
		  
		  RaiseEvent GotFocus()
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  dim ascKey as Integer = Asc(Key)
		  
		  if ascKey = Keys.TAB then
		    dim field as Integer = FieldSelected
		    
		    if Keyboard.ShiftKey then
		      if field = FieldYear then
		        return false
		      end
		      
		      FieldSelected = (field - 1)
		    else
		      if field = FieldDay then
		        return false
		      end
		      
		      FieldSelected = (field + 1)
		    end
		  elseif ascKey = Keys.LEFT then
		    FieldSelected = (FieldSelected - 1)
		  elseif ascKey = Keys.RIGHT then
		    FieldSelected = (FieldSelected + 1)
		  elseif ascKey = Keys.ESC and mBackupValue <> nil then
		    if FieldSelected = FieldDay then
		      Selected = mBackupValue.Day
		    elseif FieldSelected = FieldMonth then
		      Selected = mBackupValue.Month
		    else
		      Selected = mBackupValue.Year
		    end
		    
		    mBuffer = ""
		  end if
		  
		  
		  if ReadOnly then
		    return true
		  end
		  
		  if ascKey = Keys.UP then
		    Increase()
		  elseif ascKey = Keys.DOWN then
		    Decrease()
		  elseif ascKey >= 48 and ascKey <= 57 then
		    Buffer = Key
		  end
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  FieldSelected = FieldDay
		  mBuffer = ""
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if not Me.HaveFocus() then
		    mFocusByClick = True
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Date = new Date()
		  UpdateDate()
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub SelChange()
		  SelectionChange()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Check() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  mDate = new Date()
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Decrease()
		  if Me.HaveFocus() then
		    Selected = Selected - 1
		  else
		    Day = Day - 1
		  end
		  
		  mBackupValue = Date.Clone()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Increase()
		  if Me.HaveFocus() then
		    Selected = Selected + 1
		  else
		    Day = Day + 1
		  end
		  
		  mBackupValue = Date.Clone()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectionChange()
		  if Me.HaveFocus() then
		    if Me.SelStart <= 4 then
		      FieldSelected = FieldYear
		    elseif Me.SelStart <= 7 then
		      FieldSelected = FieldMonth
		    else
		      FieldSelected = FieldDay
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Today()
		  dim now as new Date
		  Me.Date = now
		  
		  mBackupValue = Date.Clone()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateDate()
		  // On s'assure que le min et le max est respecté
		  if mMinDate <> nil and mMinDate > Date then
		    mDate = mMinDate.Clone()
		    // MsgBox "minimum" + str(mMinDate.Clone()) // pour tester
		  end
		  
		  if mMaxDate <> nil and mMaxDate < Date then
		    mDate = mMaxDate.Clone()
		    // MsgBox  "maximum" + str(mMaxDate.Clone()) // pour tester
		  end
		  
		  
		  dim field as Integer = FieldSelected
		  Me.Text = Date.SQLDate
		  FieldSelected = field
		  UpdateSelection()
		  
		  RaiseEvent Change()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSelection()
		  if Me.HaveFocus() then
		    if FieldSelected = FieldYear then
		      Me.SelStart = 0
		      Me.SelLength = 4
		    elseif FieldSelected = FieldMonth then
		      Me.SelStart = 5
		      Me.SelLength = 2
		    else
		      Me.SelStart = 8
		      Me.SelLength = 2
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return mBuffer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if mBufferField = FieldSelected then
			    value = mBuffer + value
			  end
			  
			  if FieldSelected = FieldYear then
			    Year = Int(value)
			    if value.Len >= 4 then
			      value = ""
			    end
			  elseif FieldSelected = FieldMonth then
			    Month = Int(value).limit(1, 12)
			    if value.Len >= 2 then
			      value = ""
			    end
			  else
			    dim lastDay as Date = Date
			    lastDay.Day = 1
			    lastDay.Month = lastDay.Month + 1
			    lastDay.Day = lastDay.Day - 1
			    
			    Day = Int(value).limit(1, lastDay.Day)
			    if value.Len >= 2 then
			      value = ""
			    end
			  end
			  
			  mBufferField = FieldSelected
			  mBuffer = value
			End Set
		#tag EndSetter
		Private Buffer As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> nil then
			    mDate = value
			    UpdateDate()
			  else
			    Today()
			  end
			End Set
		#tag EndSetter
		Date As Date
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Date.Day
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Date.Day = value
			  UpdateDate()
			End Set
		#tag EndSetter
		Day As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFieldSelected
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFieldSelected = (value mod 3)
			  UpdateSelection()
			End Set
		#tag EndSetter
		FieldSelected As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMaxDate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMaxDate = value
			  UpdateDate()
			End Set
		#tag EndSetter
		MaxDate As Date
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackupValue As Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBufferField As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDate As Date = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFieldSelected As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFocusByClick As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinDate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMinDate = value
			  UpdateDate()
			End Set
		#tag EndSetter
		MinDate As Date
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMaxDate As Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMinDate As Date
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Date.Month
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Date.Month = value
			  UpdateDate()
			End Set
		#tag EndSetter
		Month As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mFieldSelected = FieldYear then
			    return Year
			  elseif mFieldSelected = FieldMonth then
			    return Month
			  else
			    return Day
			  end
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if mFieldSelected = FieldYear then
			    Year = value
			  elseif mFieldSelected = FieldMonth then
			    Month = value
			  else
			    Day = value
			  end
			End Set
		#tag EndSetter
		Selected As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Date.Year
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Date.Year = value
			  UpdateDate()
			End Set
		#tag EndSetter
		Year As Integer
	#tag EndComputedProperty


	#tag Constant, Name = FieldDay, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FieldMonth, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FieldYear, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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
			Name="Alpha"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
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
			Name="Dash"
			Visible=true
			Group="Validation"
			InitialValue="False"
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
			Name="Date"
			Visible=true
			Group="Validation"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Day"
			Visible=true
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Decimal"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Digit"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Email"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorColor"
			Visible=true
			Group="Appearance"
			InitialValue="&cFFC3B7"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExactLength"
			Visible=true
			Group="Validation"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FieldSelected"
			Group="Behavior"
			Type="Integer"
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
			EditorType="Integer"
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
			Name="MaxLength"
			Visible=true
			Group="Validation"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinLength"
			Visible=true
			Group="Validation"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Month"
			Visible=true
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotEmpty"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Numeric"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Phone"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Range"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RangeMax"
			Visible=true
			Group="Validation"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RangeMin"
			Visible=true
			Group="Validation"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Regex"
			Visible=true
			Group="Validation"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Group="Behavior"
			Type="Integer"
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
			Name="URL"
			Visible=true
			Group="Validation"
			InitialValue="False"
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
		#tag ViewProperty
			Name="Year"
			Visible=true
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZipCode"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
