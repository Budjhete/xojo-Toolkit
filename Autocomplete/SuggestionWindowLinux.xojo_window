#tag Window
Begin Window SuggestionWindowLinux
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   True
   Frame           =   7
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   357
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   1040
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   350
   MenuBar         =   0
   MenuBarVisible  =   False
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   True
   Width           =   676
   Begin ListBox optionList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   14
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   346
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   False
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   11
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   676
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin RichTextField queryField
      AcceptTabs      =   False
      Alignment       =   0
      Alpha           =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   False
      CueText         =   ""
      Dash            =   False
      DataField       =   ""
      DataSource      =   ""
      Date            =   False
      Decimal         =   False
      Digit           =   False
      Email           =   False
      EmptyColor      =   &c88888800
      EmptyValue      =   ""
      Enabled         =   True
      ErrorColor      =   &cFFC3B700
      ExactLength     =   0
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      isInitialized_  =   False
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      MaxLength       =   0
      MinLength       =   0
      NotEmpty        =   False
      NotifyIfEmpty   =   False
      Numeric         =   False
      Password        =   False
      Phone           =   False
      Range           =   False
      RangeMax        =   0
      RangeMin        =   0
      ReadOnly        =   False
      Regex           =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -29
      Underline       =   False
      URL             =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   676
      ZipCode         =   False
   End
   Begin Timer TimerClose
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   704
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      Scope           =   0
      TabIndex        =   "2"
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -29
      Visible         =   True
      Width           =   "32"
   End
   Begin Timer TimerFocus
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   748
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      Scope           =   0
      TabIndex        =   "3"
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -29
      Visible         =   True
      Width           =   "32"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Deactivate()
		  Cancel(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.RefreshDimensions()
		  
		  Me.queryField.SetFocus()
		  Me.queryField.SelStart = Me.queryField.Text.Len
		  Me.queryField.SelLength = 0
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Cancel(requestFocus as boolean)
		  if optionSubmitted then
		    Return
		  end
		  
		  optionSubmitted = true
		  
		  if Listener <> nil then
		    if requestFocus then
		      Listener.AutocompleteRequestFocus()
		    end
		    
		    Listener.AutocompleteCancelled()
		  end
		  
		  StartTimerClose()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Close()
		  if mInstance <> nil then
		    Super.Close()
		    mInstance = nil
		    mDefaultRowHeight = -1
		    mMinimumWidth = 0
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Fermer()
		  if mInstance <> nil then
		    mInstance.Close()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleKey(key as String) As Boolean
		  select case asc(key)
		  case Keys.ESC
		    Cancel(true)
		    return true
		    
		  case Keys.TAB, Keys.CR, Keys.EOT
		    Submit(key)
		    return true
		    
		  case Keys.UP
		    if optionList.ListIndex > 0 then
		      optionList.ListIndex = (optionList.ListIndex - 1)
		    end
		    return true
		    
		  case Keys.DOWN
		    if optionList.ListIndex < optionList.LastIndex then
		      optionList.ListIndex = (optionList.ListIndex + 1)
		    end
		    return true
		  end select
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function HandleKeyDown(key as String) As Boolean
		  if mInstance = nil then
		    return false
		  end
		  
		  return mInstance.HandleKey(key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub InvalidatePosition()
		  if mInstance <> nil then
		    mInstance.RefreshPosition()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IsActive() As Boolean
		  return (mInstance <> nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSuggestions(liste() as String)
		  //load options
		  optionList.DeleteAllRows
		  
		  for each text as String in liste
		    optionList.AddRow(text)
		  next
		  
		  RefreshDimensions()
		  
		  if optionList.ListCount > 0 then
		    optionList.ListIndex = 0
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub LostFocus()
		  if mInstance <> nil and not mInstance.mStartup then
		    mInstance.StartTimerClose()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshDimensions()
		  self.optionList.DefaultRowHeight = mDefaultRowHeight
		  self.Width = mMinimumWidth
		  
		  if AutoSizeRows then
		    for row as Integer = 0 to optionList.LastIndex
		      dim text as String = optionList.Cell(row, 0)
		      
		      if Self.Graphics.StringWidth(text) > self.Width then
		        self.Width = Min(Self.Graphics.StringWidth(text)  + 10, Self.MaxWidth)
		      end
		    next
		  end
		  
		  self.Height = min(optionList.ListCount * optionList.RowHeight + queryField.Height, Screen(0).Height/2)
		  
		  Me.queryField.Left = 0
		  Me.queryField.Top = 0
		  Me.queryField.Width = self.Width
		  Me.queryField.Height = 22
		  
		  Me.optionList.Left = 0
		  Me.optionList.Top = Me.queryField.Top + Me.queryField.Height
		  Me.optionList.Width = self.Width
		  Me.optionList.Height = self.Height - Me.queryField.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshPosition()
		  if Listener <> nil then
		    dim x, y as Integer
		    
		    Listener.AutocompleteRequestPosition(x, y)
		    
		    Left = x
		    Top = y
		    
		    if Top + Height > Screen(0).Height then
		      Top = Screen(0).Height - Height
		    end if
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Show()
		  mStartup = true
		  
		  RefreshPosition()
		  Super.Show()
		  
		  optionList.DefaultRowHeight = mDefaultRowHeight
		  MinWidth = mMinimumWidth
		  
		  StartTimerFocus()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartTimerClose()
		  //this is a workaround to close the window without crashing, don't know why
		  if mInstance <> nil then
		    TimerClose.Mode = Timer.ModeSingle
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartTimerFocus()
		  //this is a workaround to close the window without crashing, don't know why
		  TimerFocus.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Submit(key as String)
		  Submit(optionList.Text, optionList.ListIndex, key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Submit(option as String, row as Integer, key as String = "")
		  //submit selected option
		  if optionSubmitted then
		    Return
		  end
		  optionSubmitted = true
		  
		  if Listener <> nil then
		    Listener.AutocompleteSelected(option, row, key)
		  end
		  
		  StartTimerClose()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub TextChange(text as String)
		  if text = "" then
		    Listener.AutocompleteUpdateText("")
		    Fermer()
		    return
		  end
		  
		  if mInstance <> nil and mInstance.optionSubmitted then
		    return
		  end
		  
		  if Listener <> nil then
		    dim liste() as String = Listener.AutocompleteGetList()
		    
		    if liste.Ubound >= 0 then
		      if mInstance = nil then
		        Instance.Show()
		        Instance.queryField.Value = text
		      end
		      Instance.LoadSuggestions(liste)
		    else
		      Fermer()
		    end
		  end
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAutoSizeRows
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAutoSizeRows = value
			  
			  if mInstance <> nil and mMinimumWidth > 0 then
			    mInstance.Width = mMinimumWidth
			  end
			End Set
		#tag EndSetter
		Shared AutoSizeRows As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDefaultRowHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaultRowHeight = value
			  
			  if mInstance <> nil then
			    mInstance.RefreshDimensions()
			  end
			End Set
		#tag EndSetter
		Shared DefaultRowHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if mInstance = nil then
			    mInstance = new SuggestionWindowLinux()
			  end
			  return mInstance
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mInstance = value
			End Set
		#tag EndSetter
		Private Shared Instance As SuggestionWindowLinux
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared Listener As AutocompleteMessageReceiver
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mAutoSizeRows As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mDefaultRowHeight As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinimumWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMinimumWidth = value
			  
			  if mInstance <> nil then
			    mInstance.RefreshDimensions()
			  end
			End Set
		#tag EndSetter
		Shared MinimumWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As SuggestionWindowLinux
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mMinimumWidth As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartup As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private optionSubmitted As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events optionList
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  dim isSelected as Boolean = (Me.ListIndex = row)
		  
		  if Listener <> nil and Listener.AutocompleteBackgroundPaint(g, row, isSelected) then
		    return true
		  end
		  
		  if isSelected then
		    g.ForeColor = &cb5d5ff
		  else
		    g.ForeColor = &cffffff
		  end
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if (row <= Me.LastIndex) and Listener <> nil and _
		    Listener.AutocompleteTextPaint(g, row, x, y, Me.Cell(row, 0)) then
		    return true
		  end
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Submit(Me.Cell(row, column), row)
		End Function
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  'Cancel(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events queryField
	#tag Event
		Sub ValueChange()
		  'self.Listener = Self
		  'self.DefaultRowHeight = 30
		  'self.MinimumWidth = Me.Width
		  'self.TextChange(Me.Text)
		  
		  Listener.AutocompleteUpdateText(Me.Value)
		  self.TextChange(Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  return self.HandleKey(key)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TimerClose
	#tag Event
		Sub Action()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimerFocus
	#tag Event
		Sub Action()
		  if Listener <> nil then
		    Listener.AutocompleteRequestFocus()
		    mStartup = false
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
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
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
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
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
