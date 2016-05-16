#tag Window
Begin ContainerControl BHCalendarControl
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   True
   Height          =   220
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
   Width           =   180
   Begin PopupMenu MonthPopup
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#kJanvier\n#kFevrier\n#kMars\n#kAvril\n#kMai\n#kJuin\n#kJuillet\n#kAout\n#kSeptembre\n#kOctober\n#kNovembre\n#kDecembre"
      Italic          =   False
      Left            =   9
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   12
      Underline       =   False
      Visible         =   True
      Width           =   85
   End
   Begin PopupMenu YearPopup
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "2013\n2012\n2011"
      Italic          =   False
      Left            =   102
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   12
      Underline       =   False
      Visible         =   True
      Width           =   71
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   42
      TabPanelIndex   =   0
      Text            =   "#kDim"
      TextAlign       =   1
      TextColor       =   &cFF000200
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   43
      TabPanelIndex   =   0
      Text            =   "#kL"
      TextAlign       =   1
      TextColor       =   &c89898900
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   44
      TabPanelIndex   =   0
      Text            =   "#kMar"
      TextAlign       =   1
      TextColor       =   &c89898900
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   45
      TabPanelIndex   =   0
      Text            =   "#kMer"
      TextAlign       =   1
      TextColor       =   &c89898900
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   46
      TabPanelIndex   =   0
      Text            =   "#kJ"
      TextAlign       =   1
      TextColor       =   &c89898900
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   47
      TabPanelIndex   =   0
      Text            =   "#kV"
      TextAlign       =   1
      TextColor       =   &c89898900
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin Label DayOfWeekLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   147
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   48
      TabPanelIndex   =   0
      Text            =   "#kSam"
      TextAlign       =   1
      TextColor       =   &cFF000200
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   36
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   158
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   35
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   158
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   34
      InitialParent   =   ""
      Italic          =   False
      Left            =   147
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   33
      InitialParent   =   ""
      Italic          =   False
      Left            =   124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   32
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   31
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   30
      InitialParent   =   ""
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   29
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   28
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   137
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   27
      InitialParent   =   ""
      Italic          =   False
      Left            =   147
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   26
      InitialParent   =   ""
      Italic          =   False
      Left            =   124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   25
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   24
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   23
      InitialParent   =   ""
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   22
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   21
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   116
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   20
      InitialParent   =   ""
      Italic          =   False
      Left            =   147
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   19
      InitialParent   =   ""
      Italic          =   False
      Left            =   124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   18
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   17
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   16
      InitialParent   =   ""
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   15
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   14
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   95
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   13
      InitialParent   =   ""
      Italic          =   False
      Left            =   147
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   12
      InitialParent   =   ""
      Italic          =   False
      Left            =   124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   11
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   10
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   9
      InitialParent   =   ""
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   8
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   7
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   74
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   147
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BevelButton CalendarDateButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   "1"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   24
   End
   Begin BHBarButton bbPreviousMonth
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BorderBottom    =   True
      BorderLeft      =   True
      BorderRight     =   False
      BorderTop       =   True
      BottomColor     =   &c00000000
      BottomColorActive=   &c00000000
      CustomColor     =   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   "<"
      Left            =   26
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Resizeable      =   False
      Scope           =   2
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   True
      Tag             =   ""
      Top             =   188
      TopColor        =   &c00000000
      TopColorActive  =   &c00000000
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   24
   End
   Begin BHBarButton bbToday
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BorderBottom    =   True
      BorderLeft      =   True
      BorderRight     =   True
      BorderTop       =   True
      BottomColor     =   &c00000000
      BottomColorActive=   &c00000000
      CustomColor     =   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   "#kToday"
      Left            =   50
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Resizeable      =   False
      Scope           =   2
      TabIndex        =   50
      TabPanelIndex   =   0
      TabStop         =   True
      Tag             =   ""
      Top             =   188
      TopColor        =   &c00000000
      TopColorActive  =   &c00000000
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin BHBarButton bbNextMonth
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BorderBottom    =   True
      BorderLeft      =   False
      BorderRight     =   True
      BorderTop       =   True
      BottomColor     =   &c00000000
      BottomColorActive=   &c00000000
      CustomColor     =   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Label           =   ">"
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Resizeable      =   False
      Scope           =   2
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      Tag             =   ""
      Top             =   188
      TopColor        =   &c00000000
      TopColorActive  =   &c00000000
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   24
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub LoadYearPopup()
		  YearPopup.DeleteAllRows
		  For i As Integer = StartYear To EndYear
		    YearPopup.AddRow(Str(i))
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show()
		  // Initialize PopUpYear for all possible years
		  if IsNull(mSelectedDate) then
		    mSelectedDate = new date
		  end if
		  
		  
		  
		  
		  StartYear = kDefaultStartYear
		  EndYear = kDefaultEndYear
		  
		  
		  
		  
		  
		  me.Visible = true
		  me.top = RectControl.top + RectControl.Height
		  'me.left = RectControl.left
		  'me.Height = mHeight 
		  'me.Width = mWidth
		  me.HasBackColor = true
		  me.BackColor = rgb(100,100,100)
		  
		  LoadYearPopup
		  
		  Update
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  MonthPopup.ListIndex = mSelectedDate.Month-1
		  
		  If mSelectedDate.Year >= StartYear And mSelectedDate.Year <= EndYear Then
		    YearPopup.ListIndex = mSelectedDate.Year-StartYear
		  ElseIf mSelectedDate.Year > EndYear Then
		    YearPopup.ListIndex = YearPopup.ListCount-1
		  Else
		    YearPopup.ListIndex = 0
		  End If
		  
		  //find how many days in this month
		  Dim monthDays As Integer
		  
		  Select Case mSelectedDate.Month
		  Case 1, 3, 5, 7, 8, 10, 12
		    monthDays = 31
		  Case 4, 6, 9, 11
		    monthDays = 30
		  Case Else
		    // Calculate February
		    If (mSelectedDate.Year / 4.0) = Floor(mSelectedDate.Year / 4.0) Then
		      monthDays = 29 // Leap year
		    Else
		      monthDays = 28
		    End If
		  End Select
		  
		  // Update all the captions of the buttons and hide as appropriate
		  Dim dayOfWeek, originalday As Integer
		  originalday = mSelectedDate.Day
		  mSelectedDate.day = 1
		  dayOfWeek = mSelectedDate.DayOfWeek
		  mSelectedDate.day = originalday
		  
		  Dim dayNum As Integer
		  For calendarButton As Integer = 0 To 36
		    DayNum = calendarButton + 2 - dayOfWeek
		    If dayNum > 0 And dayNum <= monthDays Then
		      CalendarDateButton(calendarButton).Caption = Str(dayNum)
		      CalendarDateButton(calendarButton).Visible = True
		      CalendarDateButton(calendarButton).Value = (dayNum = mSelectedDate.Day) AND (MonthPopup.ListIndex = mSelectedDate.Month-1) AND (YearPopup.ListIndex = mSelectedDate.Year-StartYear)
		    Else
		      CalendarDateButton(calendarButton).Visible = False
		    End If
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Changed()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mEndYear = 0 then
			    return kDefaultEndYear
			  else
			    Return mEndYear
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEndYear = value
			  
			  LoadYearPopup
			End Set
		#tag EndSetter
		EndYear As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEndYear As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mHeight As Integer = 220
	#tag EndProperty

	#tag Property, Flags = &h0
		mRectControl As RectControl
	#tag EndProperty

	#tag Property, Flags = &h0
		mSelectedDate As Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartYear As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mWidth As Integer = 180
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRectControl
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRectControl = value
			End Set
		#tag EndSetter
		RectControl As RectControl
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mStartYear
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStartYear = value
			  
			  LoadYearPopup
			End Set
		#tag EndSetter
		StartYear As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kAout, Type = String, Dynamic = True, Default = \"Ao\xC3\xBBt", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Ao\xC3\xBBt"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"August"
	#tag EndConstant

	#tag Constant, Name = kAvril, Type = String, Dynamic = True, Default = \"Avril", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Avril"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"April"
	#tag EndConstant

	#tag Constant, Name = kDecembre, Type = String, Dynamic = True, Default = \"D\xC3\xA9cembre", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D\xC3\xA9cembre"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"December\t"
	#tag EndConstant

	#tag Constant, Name = kDefaultEndYear, Type = Double, Dynamic = False, Default = \"2039", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDefaultStartYear, Type = Double, Dynamic = False, Default = \"2002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDim, Type = String, Dynamic = True, Default = \"D", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"S"
	#tag EndConstant

	#tag Constant, Name = kFevrier, Type = String, Dynamic = True, Default = \"F\xC3\xA9vrier", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"F\xC3\xA9vrier"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"February"
	#tag EndConstant

	#tag Constant, Name = kJ, Type = String, Dynamic = True, Default = \"J", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"J"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"T"
	#tag EndConstant

	#tag Constant, Name = kJanvier, Type = String, Dynamic = True, Default = \"Janvier", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Janvier"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"January"
	#tag EndConstant

	#tag Constant, Name = kJuillet, Type = String, Dynamic = True, Default = \"Juillet", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Juillet"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"July"
	#tag EndConstant

	#tag Constant, Name = kJuin, Type = String, Dynamic = True, Default = \"Juin", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Juin"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"June"
	#tag EndConstant

	#tag Constant, Name = kL, Type = String, Dynamic = True, Default = \"L", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"M"
	#tag EndConstant

	#tag Constant, Name = kMai, Type = String, Dynamic = True, Default = \"Mai", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Mai"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"May"
	#tag EndConstant

	#tag Constant, Name = kMar, Type = String, Dynamic = True, Default = \"M", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"M"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"T"
	#tag EndConstant

	#tag Constant, Name = kMars, Type = String, Dynamic = True, Default = \"Mars", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Mars"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"March"
	#tag EndConstant

	#tag Constant, Name = kMer, Type = String, Dynamic = True, Default = \"M", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"M"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"W"
	#tag EndConstant

	#tag Constant, Name = kNovembre, Type = String, Dynamic = True, Default = \"Novembre", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Novembre"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"November"
	#tag EndConstant

	#tag Constant, Name = kOctober, Type = String, Dynamic = True, Default = \"Octobre", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Octobre"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"October"
	#tag EndConstant

	#tag Constant, Name = kSam, Type = String, Dynamic = False, Default = \"S", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"S"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S"
	#tag EndConstant

	#tag Constant, Name = kSeptembre, Type = String, Dynamic = True, Default = \"Septembre", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Septembre"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"September"
	#tag EndConstant

	#tag Constant, Name = kToday, Type = String, Dynamic = True, Default = \"Aujourd\'hui", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aujourd\xE2\x80\x99hui"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Today"
	#tag EndConstant

	#tag Constant, Name = kV, Type = String, Dynamic = True, Default = \"V", Scope = Private
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"F"
	#tag EndConstant


#tag EndWindowCode

#tag Events MonthPopup
	#tag Event
		Sub Change()
		  //User has changed month
		  //Update mSelectedDate and update window
		  
		  mSelectedDate.Month = Me.ListIndex + 1
		  
		  Update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events YearPopup
	#tag Event
		Sub Change()
		  //User has changed year
		  //Update mSelectedDate and update window
		  
		  mSelectedDate.Year = Val(Me.Text)
		  Update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CalendarDateButton
	#tag Event
		Sub Action(index as Integer)
		  #Pragma Unused Index
		  
		  //day has been chosen
		  //update mSelectedDate and close window
		  
		  mSelectedDate.Day = Val(Me.Caption)
		  Self.Visible = false
		  
		  RaiseEvent Changed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bbPreviousMonth
	#tag Event
		Sub Action()
		  //User wants to back up a month
		  //If not at limits of dates(Jan,1904) then do it
		  
		  Dim m,y As Integer
		  
		  m = MonthPopup.ListIndex + 1
		  y = Val(YearPopup.Text)
		  
		  If m = 1 And y > StartYear Then
		    YearPopup.ListIndex = YearPopup.ListIndex - 1
		    MonthPopup.ListIndex = 11
		  Elseif m > 1 Then
		    MonthPopup.ListIndex = MonthPopup.ListIndex - 1
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bbToday
	#tag Event
		Sub Action()
		  //User wants to move to current month
		  
		  mSelectedDate = New date
		  mSelectedDate.TotalSeconds = mSelectedDate.TotalSeconds
		  
		  Update
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bbNextMonth
	#tag Event
		Sub Action()
		  //User wants to advance a month
		  //If not at limits of dates(dec,2039) then do it
		  
		  Dim m, y As Integer
		  
		  m = MonthPopup.ListIndex + 1
		  y = Val(YearPopup.Text)
		  
		  If m = 12 And y < EndYear Then
		    YearPopup.ListIndex = YearPopup.ListIndex + 1
		    MonthPopup.ListIndex = 0
		  ElseIf m < 12 Then
		    MonthPopup.ListIndex = MonthPopup.ListIndex + 1
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EndYear"
		Group="Behavior"
		Type="Integer"
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
		Group="Size"
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
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mWidth"
		Visible=true
		Group="Position"
		InitialValue="600"
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
		Name="StartYear"
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
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
