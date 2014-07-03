#tag Window
Begin BHViewer BHViewerXSL
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   394
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
   Width           =   620
   Begin HTMLViewer hReportViewer
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   394
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   620
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(pXSL As XSLObject)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  mXSL = pXSL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EMAILPDF_MBS(mNomRapport As String)
		  PageSetup_MBS(false,mNomRapport)
		  
		  Dim i,c,x,y,w,h As Integer
		  Dim f As FolderItem
		  Dim s As String
		  Dim b As BinaryStream
		  Dim web As New WebPrintMBS(hReportViewer)
		  
		  web.SheetTarget=Self
		  
		  hReportViewer.preferencesMBS.shouldPrintBackgrounds = True
		  
		  page.MaxHorizontalResolution = 300
		  page.MaxVerticalResolution = 300
		  
		  w=page.PageWidth
		  h=page.PageHeight - 100
		  x= 0//page.PageLeft+50
		  y= 0//page.PageTop+50
		  
		  System.DebugLog "-- Grandeur d'impression : --"
		  System.DebugLog "largeur : "+str(w)+" , hauteur : "+str(h)+" , left : "+str(x)+" , right : "+str(y)
		  
		  if w<700 then
		    c=web.PrintingStart(w*1.5 ,h*1.5)
		    System.DebugLog "Nouvelle largeur *1.5 : "+str(w*1.5)
		  else
		    c=web.PrintingStart(w/2.7 ,h/2.7)
		    System.DebugLog "Nouvelle largeur /2.7: "+str(w/2.7)
		  end
		  System.DebugLog "-- END Grandeur d'impression --"
		  
		  if c > 1 then
		    
		  end if
		  
		  i = 0
		  While i<c
		    s = web.PrintingPage(i)
		    
		    f = SpecialFolder.Desktop.Child(mNomRapport +" - Page "+str(i+1)+".pdf")
		    b = f.CreateBinaryFile("")
		    If b <> Nil Then
		      b.Write s
		      b.Close
		    End If
		    i = i + 1
		  Wend
		  
		  web.PrintingEnd
		  
		  MsgBox str(c)+" PDF créé(s) sur le bureau."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HTML_export(pNomRapport as String = "default")
		  //sauvegarde du html
		  
		  dim fp as TextOutputStream = TextOutputStream.Create(SpecialFolder.Desktop.Child(pNomRapport+".html"))
		  fp.WriteLine(mXSL.Render)
		  fp.Close()
		  MsgBox kLeFichier + "« " + pNomRapport + " »" + kAEteEnregistrerSurVotreBureau
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PageSetup_MBS(pShow as Boolean, pNomRapport as String = "default")
		  page = New PrinterSetup
		  dim enc as TextEncoding
		  
		  enc = page.SetupString.Encoding
		  
		  page.SetupString = DecodeBase64(Company.Current.Preference("PageSetup."+WorkstationController.Instance.PosteID+"."+pNomRapport), enc)
		  
		  If DecodeBase64(Company.Current.Preference("PageSetup."+WorkstationController.Instance.PosteID+"."+pNomRapport), enc).Len < 1 or pShow = True then
		    if page.PageSetupDialog then
		      Company.Current.Preference("PageSetup."+WorkstationController.Instance.PosteID+"."+pNomRapport) = EncodeBase64(page.SetupString,0)
		    end if
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PDF_MBS(mNomRapport As String, mIsEmail as Boolean = false) As FolderItem
		  PageSetup_MBS(false,mNomRapport)
		  
		  Dim i,c,x,y,w,h As Integer
		  Dim f As FolderItem
		  Dim s As String
		  Dim b As BinaryStream
		  Dim web As New WebPrintMBS(hReportViewer)
		  
		  web.SheetTarget=Self
		  
		  hReportViewer.preferencesMBS.shouldPrintBackgrounds = True
		  
		  page.MaxHorizontalResolution = 300
		  page.MaxVerticalResolution = 300
		  
		  w=page.PageWidth
		  h=page.PageHeight - 100
		  x= 0//page.PageLeft+50
		  y= 0//page.PageTop+50
		  
		  System.DebugLog "-- Grandeur d'impression : --"
		  System.DebugLog "largeur : "+str(w)+" , hauteur : "+str(h)+" , left : "+str(x)+" , right : "+str(y)
		  
		  if w<700 then
		    c=web.PrintingStart(w*1.5 ,h*1.5)
		    System.DebugLog "Nouvelle largeur *1.5 : "+str(w*1.5)
		  else
		    c=web.PrintingStart(w/2.7 ,h/2.7)
		    System.DebugLog "Nouvelle largeur /2.7: "+str(w/2.7)
		  end
		  System.DebugLog "-- END Grandeur d'impression --"
		  
		  //créer un folder si plusieurs fichier pdf
		  if c > 1 then
		    f = SpecialFolder.Desktop.Child(mNomRapport)
		    f.CreateAsFolder()
		  Else
		    f = SpecialFolder.Desktop
		  end if
		  
		  i = 0
		  While i<c
		    s = web.PrintingPage(i)
		    
		    f = f.Child(mNomRapport +" - Page "+str(i+1)+".pdf")
		    b = f.CreateBinaryFile("")
		    If b <> Nil Then
		      b.Write s
		      b.Close
		    End If
		    i = i + 1
		  Wend
		  
		  web.PrintingEnd
		  
		  if mIsEmail = true then
		    Return f
		  else
		    MsgBox str(c)+" PDF créé(s) sur le bureau."
		    Return Nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Print()
		  System.DebugLog "Impression d'un rapport."
		  
		  hReportViewer.Print
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintMBS(pNomRapport as string)
		  PageSetup_MBS(false,pNomRapport)
		  
		  Dim i,c As Integer
		  Dim s As String
		  Dim g As Graphics
		  Dim p As CGPDFDocumentMBS
		  Dim x,y,w,h As Integer
		  Dim d As CGDataProviderMBS
		  Dim r,m As CGRectMBS
		  Dim web As New WebPrintMBS(hReportViewer)
		  
		  web.SheetTarget=Self
		  
		  hReportViewer.preferencesMBS.shouldPrintBackgrounds = True
		  'MsgBox " PageWidth: "+str(page.PageWidth) +_
		  '" PageHeight: "+str(page.PageHeight) +_
		  '" PageLeft: "+str(page.PageLeft) +_
		  '" PageTop: "+str(page.PageTop) +_
		  '" Width: "+str(page.Width) +_
		  '" Height: "+str(page.Height) +_
		  '" Left: "+str(page.Left) +_
		  '" Top: "+str(page.Top) +_
		  '" Landscape ?: "+str(page.Landscape) +_
		  '" MaxHorizontalResolution: "+str(page.MaxHorizontalResolution) +_
		  '" HorizontalResolution: "+str(page.HorizontalResolution)
		  
		  page.MaxHorizontalResolution = 300
		  page.MaxVerticalResolution = 300
		  
		  
		  
		  g=OpenPrinterDialog(page)
		  If g<>nil then
		    
		    w=page.PageWidth
		    h=page.PageHeight - 100
		    x= 0//page.PageLeft+50
		    y= 0//page.PageTop+50
		    
		    System.DebugLog "-- Grandeur d'impression : --"
		    System.DebugLog "largeur : "+str(w)+" , hauteur : "+str(h)+" , left : "+str(x)+" , right : "+str(y)
		    
		    if w<700 then
		      c=web.PrintingStart(w*1.5 ,h*1.5)
		      System.DebugLog "Nouvelle largeur *1.5 : "+str(w*1.5)
		    else
		      c=web.PrintingStart(w/2.7 ,h/2.7)
		      System.DebugLog "Nouvelle largeur /2.7: "+str(w/2.7)
		    end
		    System.DebugLog "-- END Grandeur d'impression --"
		    
		    i=0
		    While i<c
		      s=web.PrintingPage(i)
		      
		      d=CGDataProviderMBS.CreateWithData(s)
		      p=CGOpenPDFDocumentMBS(d)
		      If p<>Nil then
		        m=p.MediaBox(1)
		        r=New CGRectMBS(0,0,w,h-100)
		        
		        If i+1=c then // last page
		          r.Height=(m.Height/m.Width)*r.Width
		        End If
		        
		        r.left=x
		        r.Top=g.height-y-r.Height
		        
		        'g.DrawRect r.left,y,r.Width,r.Height
		        g.DrawCGPDFDocumentMBS p,r,1
		      else
		        MsgBox "Failed to open PDF file!"
		      End If
		      
		      i=i+1
		      If i<c then
		        g.NextPage
		      End If
		      
		    Wend
		    
		    web.PrintingEnd
		    
		    g=nil
		  End If
		End Sub
	#tag EndMethod


	#tag Note, Name = README
		Permet d'afficher le rendu d'un XslObject
	#tag EndNote


	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mXSL As XSLObject
	#tag EndProperty

	#tag Property, Flags = &h0
		page As printerSetup
	#tag EndProperty

	#tag Property, Flags = &h0
		ThaPageSetup As PrinterSetup
	#tag EndProperty

	#tag Property, Flags = &h0
		Untitled As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		webprint As WebPrintMBS
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mXSL
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mXSL = value
			  
			  // Reload
			  If mXSL <> Nil Then
			    hReportViewer.LoadPage(mXSL.Render, Company.Current.DatabaseFile)
			  Else
			    hReportViewer.LoadPage(Company.Current.Template("rapportvide_"+ kLang +".html"))
			  End If
			End Set
		#tag EndSetter
		XSL As XSLObject
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events hReportViewer
	#tag Event
		Sub Open()
		  
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
		Name="index"
		Group="Behavior"
		Type="Integer"
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
		Name="Untitled"
		Group="Behavior"
		Type="Integer"
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
