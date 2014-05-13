#tag Window
Begin BHContainerControl BHAutocomplete
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   426
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
   Visible         =   False
   Width           =   192
   Begin BHListBox gOptions
      AlternateRowColor=   &cEDF3FE00
      AlternateRows   =   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      Browseable      =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   14
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      ErrorColor      =   &c00000000
      FocusColumn     =   -1
      FocusRow        =   -1
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   426
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      LastColumn      =   -1
      LastRow         =   -1
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      NotEmpty        =   False
      ReadOnly        =   False
      RequiresSelection=   False
      RowSelected     =   0
      SaveState       =   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   192
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer focusWatcher
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   40
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   40
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function Check() As Boolean
		  Return RaiseEvent Check
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  focusWatcher.Mode = Timer.ModeOff
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Show()
		  focusWatcher.Mode = Timer.ModeMultiple
		  focusWatcher.Period = 100
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddRow(pTag As Variant, pText As String)
		  gOptions.AddRow(pTag, pText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Check()
		  // Validation
		  If TextField Is Nil Then
		    Return
		  End If
		  
		  If Not Me.Check Then
		    TextField.BackColor = ErrorColor
		  Else
		    TextField.BackColor = mInitialBackColor
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  If TextField Is Nil Then
		    Return True
		  End If
		  
		  // Empty or Null check
		  If Not NotEmpty And Not Valid.NotEmpty(TextField.Text) Then
		    Return True
		  End If
		  
		  If Not NotNull And Not Valid.NotNull(Tag) Then
		    Return True
		  End If
		  
		  // Validation
		  If NotEmpty And Not Valid.NotEmpty(TextField.Text) Then
		    Return False
		  End If
		  
		  If NotNull And Not Valid.NotNull(Tag) Then
		    Return False
		  End If
		  
		  Return Not RaiseEvent Check
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pTag As Variant) As Integer
		  Return gOptions.Find(pTag)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeyDown(pTextField As TextField, pKey As String) As Boolean
		  // Autocomplete is about to pop, preserve value before it changes anything
		  If Not Me.Visible Then
		    
		    // On préserve les données initiales
		    mInitialText = pTextField.Text
		    mInitialTag = Me.Tag
		    
		    // On restitue la sélection
		    gOptions.ListIndex = gOptions.Find(Me.Tag)
		    
		    // Ajustement de position
		    Me.Top = pTextField.Top + pTextField.Height
		    Me.Left = pTextField.Left
		    
		    // Ajustement de la largeur
		    Me.MinWidth = pTextField.Width
		    Me.Width = pTextField.Width
		    
		  End If
		  
		  Select Case Asc(pKey)
		    
		  Case 3, 9, 13 // ENTER, TAB, RETURN
		    
		    Me.Visible = False
		    
		    pTextField.Text = mSelectedText
		    Me.Tag = mSelectedTag
		    
		    RaiseEvent Change
		    
		  Case 27 //  ESC
		    
		    // Cancel selection
		    Me.Visible = False
		    
		    pTextField.Text = mInitialText
		    pTextField.BackColor = mInitialBackColor
		    Me.Tag = mInitialTag
		    
		    RaiseEvent Cancel
		    
		  Case 30, 31 // UP, DOWN
		    
		    If gOptions.ListCount > 0 Then
		      
		      Me.Visible = True
		      
		      // Key up and key down
		      If Asc(pKey) = 30 Then
		        gOptions.ListIndex = (gOptions.ListIndex - 1 + gOptions.ListCount) Mod gOptions.ListCount
		      ElseIf Asc(pkey) = 31 Then
		        gOptions.ListIndex = (gOptions.ListIndex + 1) Mod gOptions.ListCount
		      End If
		      
		      Return True
		      
		    End If
		    
		  Else
		    
		    // Dans les autres cas, on affiche l'autocomplete
		    Me.Visible = True
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LostFocus(pTextField As TextField)
		  Call Self.KeyDown(pTextField, Chr(27)) // ESC
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextChange(pTextField As TextField)
		  gOptions.DeleteAllRows
		  
		  RaiseEvent Update
		  
		  // Ajustement de la hauteur
		  If Me.Height > Me.Window.Height - Me.Top Then
		    // On limite la hauteur à l'espace disponible
		    Me.Height = gOptions.DefaultRowHeight * Floor((Me.Window.Height - Me.Top) / gOptions.DefaultRowHeight)
		  Else
		    // Il y a suffisament de place pour tout afficher :)
		    Me.Height = gOptions.DefaultRowHeight * gOptions.ListCount
		  End If
		  
		  Check
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Cancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellTextPaint(pGraphics As Graphics, pText As String, pTag As Variant, pX As Integer, pY As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Check() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Confirm()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Update()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return gOptions.DefaultRowHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  gOptions.DefaultRowHeight = value
			End Set
		#tag EndSetter
		DefaultRowHeight As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ErrorColor As Color = &cFFC3B7
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return gOptions.ListIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  gOptions.ListIndex = value
			End Set
		#tag EndSetter
		ListIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mInitialBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialListIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialTag As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNotEmpty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNotNull As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedTag As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTag As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextField As TextField
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFieldFocus As Boolean
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mNotNull
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNotNull = value
			  
			  Check
			End Set
		#tag EndSetter
		NotNull As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTag
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTag = value
			  //C'est moins optimisé que ce que ce l'était mais au moins ça marches.
			  RaiseEvent Change
			  Check
			End Set
		#tag EndSetter
		Tag As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTextField
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mTextField <> Nil Then
			    
			    If value.Parent <> Nil Then
			      RemoveHandler mTextField.KeyDown, AddressOf Me.KeyDown
			    End If
			    
			    RemoveHandler mTextField.TextChange, AddressOf Me.TextChange
			    
			  End If
			  
			  mTextField = value
			  mInitialBackColor = value.BackColor
			  
			  // Delegate handler
			  If value.Parent <> Nil Then
			    AddHandler mTextField.KeyDown, AddressOf Me.KeyDown
			  End If
			  
			  AddHandler mTextField.TextChange, AddressOf Me.TextChange
			End Set
		#tag EndSetter
		TextField As TextField
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events gOptions
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  mSelectedTag = Me.RowTag(row)
		  mSelectedText =Me.Cell(row, 0)
		  
		  Call Self.KeyDown(TextField, Chr(13)) // ENTER
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Return RaiseEvent CellTextPaint(g, Me.Cell(row, column), Me.RowTag(row), x, y)
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex <> -1 Then
		    
		    mSelectedTag = Me.RowTag
		    mSelectedText =Me.Cell(Me.ListIndex, 0)
		    
		    RaiseEvent Change
		    
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  // Call Self.KeyDown(TextField, Chr(27)) // ESC
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //Raise New RuntimeException // Hmmm... ceci n'est visiblement jamais appelé : ouioui t'inquiette ca été appeller !
		  Return Self.KeyDown(TextField, Key)
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events focusWatcher
	#tag Event
		Sub Action()
		  Me.Mode = Me.ModeMultiple
		  If TextField <> Nil And mTextField.Window <> Nil Then
		    If Not mTextField.HaveFocus And Not gOptions.HaveFocus Then
		      Me.Mode = Timer.ModeOff
		      Call Self.KeyDown(TextField, Chr(27)) // ESC
		    End If
		  End If
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
		Name="DefaultRowHeight"
		Visible=true
		Group="Appearance"
		InitialValue="45"
		Type="Integer"
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
		Name="ErrorColor"
		Group="Behavior"
		InitialValue="&cFFC3B7"
		Type="Color"
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
		InitialValue="400"
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
		Name="ListIndex"
		Group="Behavior"
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
		Name="NotNull"
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
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
