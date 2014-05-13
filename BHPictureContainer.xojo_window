#tag Window
Begin ContainerControl BHPictureContainer
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   203
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
   Width           =   439
   Begin BHPushButton pAjouter
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kAjouterUneImage_"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   253
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   149
      Underline       =   False
      Visible         =   True
      Width           =   186
   End
   Begin BHListbox gThumbnails
      AlternateRowColor=   &cEDF3FE00
      AlternateRows   =   True
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      Bold            =   False
      Border          =   True
      Browseable      =   False
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "32,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   32
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
      Height          =   203
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
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   241
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas cThumbnail
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   137
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   253
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   186
   End
   Begin BHPushButton pRetirer
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kEnleverLimageActuelle"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   253
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   181
      Underline       =   False
      Visible         =   True
      Width           =   186
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  GenerateThumbnail
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Clear()
		  mPictures.Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  mPictures = New Dictionary
		  mMiniThumbnails = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GenerateThumbnail()
		  If gThumbnails.ListIndex > -1 Then
		    
		    Dim pPicture As Picture = mPictures.Value(mPictures.Key(gThumbnails.RowTag(gThumbnails.ListIndex)))
		    mThumbnail = Image.Thumbnail(pPicture, cThumbnail.Width, cThumbnail.Height)
		  Else
		    mThumbnail = Image.Thumbnail(PC_Plus, cThumbnail.Width, cThumbnail.Height)
		  End If
		  
		  cThumbnail.Invalidate(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDirectory(pDirectory As FolderItem)
		  // Load images in mDirectory
		  Dim pItem As FolderItem
		  Dim pPicture As Picture
		  
		  For i As Integer = 1 To pDirectory.Count
		    pItem = pDirectory.Item(i) // Seriously ? A one-based array ? Really ?
		    If pItem <> Nil Then
		      pPicture = Picture.Open(pItem)
		      If pPicture <> Nil Then
		        mPictures.Value(pItem.Name) = pPicture
		        mMiniThumbnails.Value(pItem.Name) = Image.Thumbnail(pPicture, 32, 32)
		        // TODO : Gérer les conflits
		        gThumbnails.AddRow("", pItem.Name)
		        gThumbnails.RowTag(gThumbnails.ListCount-1) = mPictures.Count-1
		      End If
		    End If
		  Next
		  
		  GenerateThumbnail
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPictures(pPictures() As Picture)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pictures() As Dictionary
		  // Retourne un Dictionary de Picture dont les clés sont les noms des fichiers et les valeurs, les images
		  Return mPictures
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mMiniThumbnails As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPictures As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mThumbnail As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events pAjouter
	#tag Event
		Sub Action()
		  Dim pFolder As FolderItem
		  
		  Dim pDialog As New SelectFolderDialog
		  pDialog.ActionButtonCaption = "Select"
		  pDialog.Title = KSelectionnerUneImage
		  pDialog.PromptText = "owqoeoj"
		  
		  While pFolder = Nil Or Not pFolder.Directory
		    pFolder = pDialog.ShowModal
		  Wend
		  
		  LoadDirectory(pFolder)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gThumbnails
	#tag Event
		Sub Change()
		  GenerateThumbnail
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If column = 0 Then
		    Dim var As Variant = Me.RowTag(row)
		    // g.DrawPicture(mMiniThumbnails.Value(Me.RowTag(row)), 0, 0)
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cThumbnail
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture(mThumbnail, 0, 0)
		  Dim foo As Boolean
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pRetirer
	#tag Event
		Sub Action()
		  
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
