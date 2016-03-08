#tag Window
Begin BHContainerControl BHDatePicker
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   True
   Height          =   246
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   181
   Begin BHTextField tDate
      AcceptTabs      =   False
      Alignment       =   0
      Alpha           =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      Dash            =   False
      DataField       =   ""
      DataSource      =   ""
      Date            =   True
      Decimal         =   False
      Digit           =   False
      Email           =   False
      Enabled         =   True
      ErrorColor      =   &cFFC3B700
      ExactLength     =   0
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   16
      LimitText       =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaxLength       =   0
      mError          =   ""
      MinLength       =   0
      NotEmpty        =   False
      Numeric         =   False
      Password        =   False
      Phone           =   False
      Range           =   False
      RangeMax        =   0
      RangeMin        =   0
      ReadOnly        =   False
      Regex           =   ""
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      URL             =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   148
      ZipCode         =   False
   End
   Begin UpDownArrows udPicker
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   168
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   13
   End
   Begin BHCalendarControl PopUpCalendar
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFDFDFD00
      Backdrop        =   0
      Enabled         =   True
      EndYear         =   0
      EraseBackground =   False
      HasBackColor    =   True
      Height          =   220
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      mHeight         =   180
      mWidth          =   220
      Scope           =   2
      StartYear       =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   23
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   180
   End
   Begin DisclosureTriangle DisclosureTriangle1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   0
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   2
      Value           =   False
      Visible         =   True
      Width           =   18
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function Check() As Boolean
		  Return RaiseEvent Check
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddToDate(pNumberToAdd As Integer, pField As Integer = - 1)
		  
		  
		  If pField < 0 Then
		    pField = tDate.SelStart
		  End
		  
		  Select Case pField
		    
		  Case 0
		    mDate.Year = mDate.Year + pNumberToAdd
		    
		  Case 5
		    mDate.Month = mDate.Month + pNumberToAdd
		    
		  Case 8, -1
		    mDate.Day = mDate.Day + pNumberToAdd
		    
		  End Select
		  
		  tDate.Text = mDate.SQLDate
		  
		  tDate.SelStart = pField
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  mDate = New Date
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelStart() As Integer
		  Return tDate.SelStart
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Check() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DateChange(pDateInterval As Date)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Down()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Up()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim pOldDate As Date = mDate
			  
			  mDate = value
			  
			  udPicker.Enabled = (mDate <> Nil)
			  
			  If mDate = Nil Then
			    tDate.Text = ""
			  Else
			    tDate.Text = mDate.SQLDate
			  End If
			  
			  Dim pDateInterval As New Date
			  
			  pDateInterval.TotalSeconds = mDate.TotalSeconds - pOldDate.TotalSeconds
			  
			  RaiseEvent DateChange(pDateInterval)
			End Set
		#tag EndSetter
		Date As Date
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDate As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		mHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mOriginalText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mWidth As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return tDate.NotEmpty
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  tDate.NotEmpty = value
			End Set
		#tag EndSetter
		NotEmpty As Boolean
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events tDate
	#tag Event
		Sub TextChange()
		  //
		  // YYYY
		  // YYYY-MM
		  If Valid.ValidRegex(Me.Text, "^[0-9]{4}-[0-9]{2}$") Or Valid.ValidRegex(Me.Text, "^[0-9]{4}$") Then
		    Me.Text = Me.Text + "-"
		    Me.SelStart = Len(Me.Text)
		  End If
		  
		  If Me.Text = "" Then
		    mDate = Nil
		    udPicker.Enabled = False
		  ElseIf mDate Is Nil Then
		    mDate = New Date
		    udPicker.Enabled = True
		  End If
		  
		  Dim pSplit() As String = Me.Text.Split("-")
		  
		  If pSplit.Ubound >= 2 Then
		    mDate.Day = pSplit(2).IntegerValue
		  End If
		  
		  If pSplit.Ubound >= 1 Then
		    mDate.Month = pSplit(1).IntegerValue
		  End If
		  
		  If pSplit.Ubound >= 0 Then
		    mDate.Year = pSplit(0).IntegerValue
		  End If
		  
		  RaiseEvent TextChange
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelChange()
		  // YYYY-MM-JJ
		  
		  If Len(Me.Text) <> 10 Then
		    Return
		  End If
		  
		  Select Case Me.SelStart
		    
		  Case 0 To 4
		    If Me.SelLength <> 4 Then
		      Me.SelStart = 0
		      Me.SelLength = 4
		    End If
		    
		  Case 5 To 7
		    If Me.SelLength <> 2 Then
		      Me.SelStart = 5
		      Me.SelLength = 2
		    End If
		    
		  Case 8 To 10
		    If Me.SelLength <> 2 Then
		      Me.SelStart = 8
		      Me.SelLength = 2
		    End If
		    
		  End Select
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  // YYYY-MM-DD
		  
		  Select Case Asc(Key)
		    
		  Case 30 // UP
		    If udPicker.Enabled Then
		      Self.AddToDate(1)
		      RaiseEvent Up
		      Return True
		    End If
		    
		  Case 31 // DOWN
		    If udPicker.Enabled Then
		      Self.AddToDate(-1)
		      RaiseEvent Down
		      Return True
		    End If
		    
		  Case 28 // LEFT
		    
		    Select Case Me.SelStart
		      
		    Case 0
		      Me.SelStart = 8
		      Return True
		      
		    Case 5
		      Me.SelStart = 0
		      Me.SelLength = 4
		      Return True
		      
		    Case 8
		      Me.SelStart = 5
		      Return True
		      
		    End Select
		    
		  Case 27 //  ESC
		    
		    // Cancel selection
		    
		    Me.Text = mOriginalText
		    DisclosureTriangle1.Value = false
		    Return true
		    
		  Case 29 // RIGHT
		    
		    Select Case Me.SelStart
		      
		    Case 0
		      Me.SelStart = 5
		      Me.SelLength = 2
		      Return True
		      
		    Case 5
		      Me.SelStart = 8
		      Return True
		      
		    Case 8
		      Me.SelStart = 0
		      Me.SelLength = 4
		      Return True
		      
		    End Select
		    
		    
		  End Select
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events udPicker
	#tag Event
		Sub Down()
		  
		  If Self.tDate.Enabled Then
		    If tDate.SelLength = 0 Then
		      tDate.SelStart = 8
		    End If
		    AddToDate(-1)
		    RaiseEvent Down
		  End IF
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  If Self.tDate.Enabled Then
		    If tDate.SelLength = 0 Then
		      tDate.SelStart = 8
		    End If
		    AddToDate(1)
		    RaiseEvent Up
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopUpCalendar
	#tag Event
		Sub Open()
		  me.mRectControl = tDate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Changed()
		  Date = me.mSelectedDate
		  self.Width = mWidth
		  self.Height = mHeight
		  DisclosureTriangle1.Value = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = RGB(180,180,180)
		  g.DrawRect(0, 0, g.Width, g.Height)
		  g.ForeColor = RGB(250,250,250)
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DisclosureTriangle1
	#tag Event
		Sub Action()
		  
		  if me.value then
		    self.mHeight = self.Height
		    self.mWidth = self.Width
		    mOriginalText = tDate.Text
		    PopUpCalendar.show
		    
		    self.Height = 243
		    self.Width = 180
		  else
		    PopUpCalendar.Visible = false
		    self.Width = mWidth
		    self.Height = mHeight
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
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
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
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
		Name="mHeight"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mOriginalText"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mWidth"
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
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
