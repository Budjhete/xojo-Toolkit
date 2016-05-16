#tag Window
Begin BHWindow BHReportXMLViewer
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   588
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "#kApercu"
   Visible         =   True
   Width           =   882
   Begin OptionTimer TheAltKey
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin BHViewerXSL cReport
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   False
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   561
      HelpTag         =   ""
      index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   2
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   882
   End
   Begin bar Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Resizeable      =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   563
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   882
      Begin BarButton pbFermer
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         BorderBottom    =   True
         BorderLeft      =   True
         BorderRight     =   True
         BorderTop       =   True
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Label           =   "#kFermer"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Resizeable      =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tag             =   ""
         Top             =   563
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   115
      End
      Begin BevelButton BevelButton1
         AcceptFocus     =   True
         AutoDeactivate  =   True
         BackColor       =   &c00000000
         Bevel           =   4
         Bold            =   False
         ButtonType      =   0
         Caption         =   ""
         CaptionAlign    =   3
         CaptionDelta    =   0
         CaptionPlacement=   1
         Enabled         =   True
         HasBackColor    =   False
         HasMenu         =   2
         Height          =   25
         HelpTag         =   ""
         Icon            =   1221950624
         IconAlign       =   2
         IconDX          =   0
         IconDY          =   0
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   114
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuValue       =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   563
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   31
      End
      Begin BarButton pbImrimper
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         Backdrop        =   1908749640
         BorderBottom    =   True
         BorderLeft      =   True
         BorderRight     =   True
         BorderTop       =   True
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Label           =   "#kImprimer"
         Left            =   759
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Resizeable      =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tag             =   ""
         Top             =   563
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   114
      End
      Begin BarButton pbPageSetup
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         BorderBottom    =   True
         BorderLeft      =   True
         BorderRight     =   False
         BorderTop       =   True
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Label           =   "#kPageSetup"
         Left            =   637
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Resizeable      =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tag             =   ""
         Top             =   563
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   123
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   308
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         Text            =   "#kPreviewBeforeSave"
         TextAlign       =   0
         TextColor       =   &cE0E0E000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   563
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   317
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1000
		Sub Constructor(pXsl As XslObject, pNomRapport as String, pPreview as Boolean = false, pEmail as string = "")
		  super.Constructor
		  
		  mXsl = pXsl
		  mNomRapport = pNomRapport
		  mPreview = not pPreview
		  mEmail = pEmail
		  
		  pbImrimper.Enabled = not mPreview
		  BevelButton1.Enabled = not mPreview
		  cReport.Xsl = mXsl
		  
		  Label1.Visible = mPreview
		  
		  if mPreview then
		    
		    Canvas1.ForeColor = RGB(157,5,0)
		    canvas1.ForeTopColor = RGB(127,4,0)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnregistrerHTMLSurBureau()
		  cReport.HTML_export(mNomRapport)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnregistrerPDFSurBureau()
		  call cReport.PDF_MBS(mNomRapport)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnvoyerHTMLCourriel()
		  dim html as string
		  if TargetWin32 then
		    html = cReport.hReportViewer.IEHTMLTextMBS
		  else
		    html = cReport.hReportViewer.mainFrameMBS.dataSource.data
		  end if
		  
		  BHViewerHTMLEmail.showmodal(html, mEmail)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnvoyerPDFCourriel()
		  BHViewerHTMLEmail.showmodal(cReport.PDF_MBS(mNomRapport, true), mEmail)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarginsPreview()
		  'cReport.Left = app.PrintConfig.leftMargin
		  'cReport.top = app.PrintConfig.topMargin
		  'cReport.Width = cReport.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub ShowModal(pXSL as XslObject, nomRapport as String, pPreview as Boolean = false, pEmail as string = "")
		  Dim pBHReportXMLViewer As New  BHReportXMLViewer(pXsl, nomRapport, pPreview, pEmail)
		  
		  pBHReportXMLViewer.ShowModal()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mEmail As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mNomRapport As String = "Rapport"
	#tag EndProperty

	#tag Property, Flags = &h0
		mPreview As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mXsl As XslObject
	#tag EndProperty


#tag EndWindowCode

#tag Events TheAltKey
	#tag Event
		Sub KeyDown()
		  #if TargetMacOS then
		    pbImrimper.Label = kImprimer + " "
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub KeyUp()
		  #if TargetMacOS then
		    pbImrimper.Label = kImprimer
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbFermer
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Open()
		  
		  
		  #if TargetMacOS then
		    me.AddRow(kEnvoyerPDFParCourriel)
		  #endif
		  me.AddRow(kEnvoyerHTMLParCourriel)
		  me.AddRow("-")
		  
		  #if TargetMacOS then
		    me.AddRow(kEnregistrerPDFSurLeBureau)
		  #endif
		  
		  me.AddRow(kEnregistrerHTMLSurLeBureau)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  Select  case me.List(me.MenuValue)
		  case kEnvoyerPDFParCourriel
		    EnvoyerPDFCourriel
		  case kEnvoyerHTMLParCourriel
		    EnvoyerHTMLCourriel
		  case kEnregistrerPDFSurLeBureau
		    EnregistrerPDFSurBureau
		  case kEnregistrerHTMLSurLeBureau
		    EnregistrerHTMLSurBureau
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbImrimper
	#tag Event
		Sub Action()
		  #if TargetMacOS then
		    if Keyboard.AltKey then
		      cReport.Print()
		    ElseIf Keyboard.ControlKey then
		      cReport.PrintMBS(mNomRapport)
		    else
		      cReport.PrintNS(mNomRapport, self)
		    end
		  #Else
		    cReport.Print()
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  pbImrimper.Label = kImprimer + " ..."
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pbPageSetup
	#tag Event
		Sub Action()
		  cReport.PageSetupNS(true, mNomRapport)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #if TargetMacOS then
		    me.Visible = true
		  #Else
		    me.Visible = False
		  #endif
		  
		  
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
		Visible=true
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
		InitialValue="300"
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
		InitialValue="False"
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
		Name="mEmail"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
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
		Visible=true
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
		Name="mNomRapport"
		Group="Behavior"
		InitialValue="Rapport"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mPreview"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="OverrideTitleMenu"
		Visible=true
		Group="Appearance"
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="ShowInMenu"
		Visible=true
		Group="Appearance"
		InitialValue="true"
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
