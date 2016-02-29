#tag Class
Protected Class BHTextField
Inherits TextField
Implements BHControl
	#tag Event
		Sub TextChange()
		  Me.Check
		  
		  RaiseEvent TextChange
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Check()
		  If Not Me.Check Then
		    TextField(Me).BackColor = ErrorColor
		    TextField(me).HelpTag = mError
		  Else
		    // Reset background color to default
		    BackColor = mBackColor
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  // If it can be empty and it is empty, no need to check other validations
		  If Not NotEmpty And Not Valid.NotEmpty(Text) Then
		    'mError = mError + " - Must be Empty"
		    Return True
		  End If
		  
		  If Not NotNull And Not Valid.NotNull(Text) Then
		    'mError = mError + " - Must be Null"
		    Return True
		  End If
		  
		  If NotEmpty And Not Valid.NotEmpty(Text) Then
		    mError = mError + " - Can't be Empty"
		    Return False
		  End If
		  
		  If NotNull And Not Valid.NotNull(Tag) Then
		    mError = mError + " - Can't be Null"
		    Return False
		  End If
		  
		  If Phone And Not Valid.Phone(Text) Then
		    mError = mError + " - Phone Invalid"
		    Return False
		  End If
		  
		  If Email And Not Valid.Email(Text) Then
		    mError = mError + " - Email not Valid"
		    
		    Return False
		  End If
		  
		  If ZipCode And Not Valid.ZipCode(Text) Then
		    mError = mError + " - ZipCode not Valid"
		    
		    Return False
		  End If
		  
		  If Alpha And Numeric And Dash And Not Valid.AlphaNumericDash(Text) Then
		    mError = mError + " - Must be Alpha, numeric and Dashed"
		    Return False
		  ElseIf Alpha And Numeric And Not Dash And Not Valid.AlphaNumeric(Text) Then
		    mError = mError + " - Must be Alpha, numeric, not Dashed"
		    Return False
		  ElseIf Alpha And Not Numeric And Dash And Not Valid.AlphaDash(Text) Then
		    mError = mError + " - Must be Alpha, not Numeric and Dashed"
		    Return False
		  ElseIf Not Alpha And Numeric And Dash And Not Valid.NumericDash(Text) Then
		    mError = mError + " - Must be not Alpha, numeric and Dashed"
		    Return False
		  ElseIf Alpha And Not Numeric And Not Dash And Not Valid.Alpha(Text) Then
		    mError = mError + " - Must be Alpha and not Numeric and not Dashed"
		    Return False
		  ElseIf Numeric And Not Alpha And Not Dash And Not Valid.Numeric(Text) Then
		    mError = mError + " - Must be not Alpha not Numeric and not Dashed"
		    Return False
		  End If
		  // 'Dash' alone should not exist
		  
		  If Digit And Not Valid.Digit(Text) Then
		    mError = mError + " - Must be Digit"
		    Return False
		  End If
		  
		  If Decimal And Not Valid.Decimal(Text) Then
		    mError = mError + " - Must be Decimal"
		    Return False
		  End If
		  
		  If Date And Not Valid.ValidDate(Text) Then
		    mError = mError + " - Date not valid"
		    Return False
		  End If
		  
		  If URL And Not Valid.URL(Text) Then
		    mError = mError + " - URL not valid"
		    Return False
		  End If
		  
		  If ZipCode And Not Valid.ZipCode(Text) Then
		    mError = mError + " - Zip code invalid"
		    Return False
		  End If
		  
		  If (ExactLength > 0) And Not Valid.ExactLength(Text, ExactLength) Then
		    mError = mError + " - ExatLength more then zero"
		    Return False
		  End If
		  
		  If (MinLength > 0) And Not Valid.MinLength(Text, MinLength) Then
		    mError = mError + " - Minimum Lenght not respected"
		    Return False
		  End If
		  
		  If (MaxLength > 0) And Not Valid.MinLength(Text, MaxLength) Then
		    mError = mError + " - Maximum Length not respected"
		    Return False
		  End If
		  
		  If Range And Not Valid.Range(Text.IntegerValue, RangeMin, RangeMax) Then
		    mError = mError + " - Not in range"
		    return False
		  End If
		  
		  Return Not RaiseEvent Check
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Check() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TagChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook


	#tag Property, Flags = &h0
		Alpha As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return TextField(Me).BackColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBackColor = value
			  TextField(Me).BackColor = value
			End Set
		#tag EndSetter
		BackColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Dash As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Date As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Decimal As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Digit As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Email As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorColor As Color = &cFFC3B7
	#tag EndProperty

	#tag Property, Flags = &h0
		ExactLength As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxLength As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		mError As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MinLength As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNotEmpty As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		mTag As Variant
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mNotEmpty
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNotEmpty = value
			  
			  Check
			End Set
		#tag EndSetter
		NotEmpty As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private NotNull As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Numeric As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Phone As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Range As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		RangeMax As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		RangeMin As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Regex As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTag
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTag = Value
			  
			  RaiseEvent TagChange
			End Set
		#tag EndSetter
		Tag As Variant
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		URL As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ZipCode As Boolean = False
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
			InitialValue="False"
			Type="Boolean"
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
			Name="mError"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinLength"
			Visible=true
			Group="Validation"
			InitialValue="0"
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
			Name="ZipCode"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
