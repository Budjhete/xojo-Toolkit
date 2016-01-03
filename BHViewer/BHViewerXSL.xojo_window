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
      Renderer        =   1
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
	#tag Method, Flags = &h1000
		Sub Constructor(pCol() as string, pRecordSet as RecordSet)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  mColums = pCol
		  mRecordSet = pRecordSet
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(pXSL As XSLObject)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  mXSL = pXSL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DocumentComplete() As Boolean
		  'Return RaiseEvent DocumentComplete
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ggBars(pRecordSet as RecordSet, pColumsType() as integer)
		  mRecordSet = pRecordSet
		  
		  dim s as string
		  s = ggkBar1Head
		  
		  //s = s + kBar2Data
		  // set headers
		  // data style : ['Year', 'Sales', 'Expenses', 'Profit'],
		  
		  s = s + "["
		  
		  For i As Integer = 0 To mRecordSet.FieldCount-1
		    s = s + "'" + mRecordSet.IdxField(i+1).Name + "'"
		    if i <> mRecordSet.FieldCount-1 then
		      s = s + ", "
		    end if
		  Next
		  
		  s = s + "]," + EndOfLine
		  
		  // set data
		  // data style : ['2014', 1000, 400, 200],
		  
		  While Not mRecordSet.EOF
		    s = s + "["
		    
		    For i As Integer = 0 To mRecordSet.FieldCount-1
		      
		      if pColumsType(i) = 4 or pColumsType(i) = 5 or pColumsType(i) = 15 then
		        s = s + "'" + ReplaceAll(mRecordSet.IdxField(i+1).StringValue, "'", "`") + "'"
		      else
		        s = s + ReplaceAll(mRecordSet.IdxField(i+1).StringValue, "'", "`")
		        
		      end if
		      
		      if i <> mRecordSet.FieldCount-1 then
		        s = s + ", "
		      end if
		    Next
		    s = s + "]"
		    
		    mRecordSet.MoveNext
		    
		    if not mRecordSet.EOF then
		      s = s + ", " + EndOfLine
		    Else
		      s = s + EndOfLine
		    end if
		  Wend
		  
		  s = s + ggkBar3Option
		  s = s + ggkBar4OptionData
		  s = s + ggkBar5End
		  
		  Dim f As FolderItem = GetTemporaryFolderItem
		  hReportViewer.LoadPage(s, f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ggLinearLines()
		  dim s as string
		  s = ggkLinearline1Head
		  s = s + ggkLinearline2Colums
		  s = s + ggkLinearline3Data
		  s = s + ggkLinearline4Option
		  s = s + ggkLinearline5End
		  
		  Dim f As FolderItem = GetTemporaryFolderItem
		  hReportViewer.LoadPage(s, f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTML() As String
		  'dim h as string = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>"
		  '
		  'h = h + EndOfLine + hReportViewer.mainFrameMBS.dataSource.data
		  if TargetWin32 then
		    Return hReportViewer.IEHTMLTextMBS
		  else
		    Return hReportViewer.mainFrameMBS.dataSource.data
		  end if
		  
		  Exception err as NilObjectException
		    MsgBox "kSVPReload"
		    
		    'Return h
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HTML_export(pNomRapport as String = "default")
		  dim d as new date
		  dim dt as string = ReplaceAll(d.SQLDateTime, ":", "-")
		  dt = ReplaceAll(dt, "", "_")
		  //sauvegarde du html
		  dim h as string
		  
		  if TargetWin32 then
		    h = hReportViewer.IEHTMLTextMBS
		  else
		    h = hReportViewer.mainFrameMBS.dataSource.data
		  end if
		  
		  
		  dim fp as TextOutputStream = TextOutputStream.Create(SpecialFolder.Desktop.Child(pNomRapport + "-" + dt + ".html"))
		  fp.WriteLine(h)
		  fp.Close()
		  MsgBox kLeFichier + "« " + pNomRapport + " »" + kAEteEnregistrerSurVotreBureau
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadHTML(pHTML as String)
		  Dim f As FolderItem = GetTemporaryFolderItem
		  hReportViewer.LoadPage(pHTML, f)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PageSetupNS(pShow as Boolean, pNomRapport as String = "default")
		  // get Xojo printer setup
		  dim page as new PrinterSetup
		  
		  
		  
		  dim enc as TextEncoding
		  
		  
		  // si le setting existe dans la db
		  
		  If DecodeBase64(Company.Current.Preference("PageSetupNS."+Company.Current.PosteID+"."+pNomRapport), enc).Len < 1 or pShow = True then
		    NSPageLayoutMBS.runPageLayout
		    
		  else
		    page.SetupString = DecodeBase64(Company.Current.Preference("PageSetupNS."+Company.Current.PosteID+"."+pNomRapport), enc)
		    
		  end
		  
		  // now put it into NSPrintInfo to manipulate
		  dim info as new NSPrintInfoMBS(page.SetupString)
		  
		  info.printer = app.PrintConfig.printer
		  info.topMargin = app.PrintConfig.topMargin
		  info.leftMargin = app.PrintConfig.leftMargin
		  info.rightMargin = app.PrintConfig.rightMargin
		  info.bottomMargin = app.PrintConfig.bottomMargin
		  
		  page.SetupString = info.SetupString
		  
		  
		  Company.Current.Preference("PageSetupNS."+Company.Current.PosteID+"."+pNomRapport) = EncodeBase64(page.SetupString,0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PageSetup_MBS(pShow as Boolean, pNomRapport as String = "default")
		  // backup print setting
		  dim printsettingbackup as new NSPrintInfoMBS
		  printsettingbackup = app.PrintConfig
		  
		  page = New PrinterSetup
		  dim enc as TextEncoding
		  
		  enc = page.SetupString.Encoding
		  
		  page.SetupString = DecodeBase64(Company.Current.Preference("PageSetup."+Company.Current.PosteID+"."+pNomRapport), enc)
		  
		  If DecodeBase64(Company.Current.Preference("PageSetup."+Company.Current.PosteID+"."+pNomRapport), enc).Len < 1 or pShow = True then
		    if page.PageSetupDialog then
		      Company.Current.Preference("PageSetup."+Company.Current.PosteID+"."+pNomRapport) = EncodeBase64(page.SetupString,0)
		    end if
		  end
		  
		  app.PrintConfig.SetupString = page.SetupString
		  app.PrintConfig.topMargin = printsettingbackup.topMargin
		  app.PrintConfig.leftMargin = printsettingbackup.leftMargin
		  app.PrintConfig.rightMargin = printsettingbackup.rightMargin
		  app.PrintConfig.bottomMargin = printsettingbackup.bottomMargin
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
		    if c > 1 then
		      f = SpecialFolder.Desktop.Child(mNomRapport)
		      f.CreateAsFolder()
		    Else
		      f = SpecialFolder.Desktop
		    end if
		    
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
		    MsgBox str(c)+"kPDF créé(s) sur le bureau."
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

	#tag Method, Flags = &h0
		Sub PrintNS(pNomRapport as string, pWindow as Window)
		  dim o as NSPrintOperationMBS = NSPrintOperationMBS.printOperationWithView(hReportViewer, app.PrintConfig)
		  
		  o.showsPrintPanel = true
		  o.runOperationModalForWindow(pWindow)
		  o = nil
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DocumentComplete()
	#tag EndHook


	#tag Note, Name = README
		Permet d'afficher le rendu d'un XslObject
	#tag EndNote


	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColums() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRecordSet As RecordSet
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
			  
			  if Company.current().Preference("GenereParKanjo").BooleanValue and mXSL <> Nil then
			    mXSL.Data.Value("GenereParKanjo") = kGenereParKanjo
			  end if
			  
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


	#tag Constant, Name = ggkBar1Head, Type = String, Dynamic = False, Default = \"<html>\n  <head>\n    <script type\x3D\"text/javascript\" src\x3D\"https://www.google.com/jsapi\"></script>\n    <script type\x3D\"text/javascript\">\n      google.load(\"visualization\"\x2C \"1.1\"\x2C {packages:[\"bar\"]});\n      google.setOnLoadCallback(drawChart);\n      function drawChart() {\n        var data \x3D google.visualization.arrayToDataTable([\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkBar2Data, Type = String, Dynamic = False, Default = \"          [\'Year\'\x2C \'Sales\'\x2C \'Expenses\'\x2C \'Profit\']\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [\'2014\'\x2C 1000\x2C 400\x2C 200]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [\'2015\'\x2C 1170\x2C 460\x2C 250]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [\'2016\'\x2C 660\x2C 1120\x2C 300]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [\'2017\'\x2C 1030\x2C 540\x2C 350]\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkBar3Option, Type = String, Dynamic = False, Default = \" ]);\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 var options \x3D {\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 chart: {\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkBar4OptionData, Type = String, Dynamic = False, Default = \"title: \'Company Performance\'\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 subtitle: \'Sales\x2C Expenses\x2C and Profit: 2014-2017\'\x2C\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkBar5End, Type = String, Dynamic = False, Default = \" }\n};\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 var chart \x3D new google.charts.Bar(document.getElementById(\'columnchart_material\'));\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 chart.draw(data\x2C options);\n\xC2\xA0 \xC2\xA0 \xC2\xA0 }\n\xC2\xA0 \xC2\xA0 </script>\n\xC2\xA0 </head>\n\xC2\xA0 <body>\n\xC2\xA0 \xC2\xA0 <div id\x3D\"columnchart_material\" style\x3D\"width: 900px; height: 500px;\"></div>\n\xC2\xA0 </body>\n</html>\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkLinearline1Head, Type = String, Dynamic = False, Default = \"<html>\n<head>\n\xC2\xA0 <script type\x3D\"text/javascript\" src\x3D\"https://www.google.com/jsapi\"></script>\n\xC2\xA0 <script type\x3D\"text/javascript\">\n\xC2\xA0 \xC2\xA0 google.load(\'visualization\'\x2C \'1.1\'\x2C {packages: [\'line\']});\n\xC2\xA0 \xC2\xA0 google.setOnLoadCallback(drawChart);\n\n\xC2\xA0 \xC2\xA0 function drawChart() {\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 var data \x3D new google.visualization.DataTable();\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkLinearline2Colums, Type = String, Dynamic = False, Default = \"data.addColumn(\'number\'\x2C \'Day\');\n\xC2\xA0 \xC2\xA0 \xC2\xA0 data.addColumn(\'number\'\x2C \'Guardians of the Galaxy\');\n\xC2\xA0 \xC2\xA0 \xC2\xA0 data.addColumn(\'number\'\x2C \'The Avengers\');\n\xC2\xA0 \xC2\xA0 \xC2\xA0 data.addColumn(\'number\'\x2C \'Transformers: Age of Extinction\');\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 data.addRows([\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkLinearline3Data, Type = String, Dynamic = False, Default = \"[1\x2C \xC2\xA037.8\x2C 80.8\x2C 41.8]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [2\x2C \xC2\xA030.9\x2C 69.5\x2C 32.4]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [3\x2C \xC2\xA025.4\x2C \xC2\xA0 57\x2C 25.7]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [4\x2C \xC2\xA011.7\x2C 18.8\x2C 10.5]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [5\x2C \xC2\xA011.9\x2C 17.6\x2C 10.4]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [6\x2C \xC2\xA0 8.8\x2C 13.6\x2C \xC2\xA07.7]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [7\x2C \xC2\xA0 7.6\x2C 12.3\x2C \xC2\xA09.6]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [8\x2C \xC2\xA012.3\x2C 29.2\x2C 10.6]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [9\x2C \xC2\xA016.9\x2C 42.9\x2C 14.8]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [10\x2C 12.8\x2C 30.9\x2C 11.6]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [11\x2C \xC2\xA05.3\x2C \xC2\xA07.9\x2C \xC2\xA04.7]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [12\x2C \xC2\xA06.6\x2C \xC2\xA08.4\x2C \xC2\xA05.2]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [13\x2C \xC2\xA04.8\x2C \xC2\xA06.3\x2C \xC2\xA03.6]\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 [14\x2C \xC2\xA04.2\x2C \xC2\xA06.2\x2C \xC2\xA03.4]\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkLinearline4Option, Type = String, Dynamic = False, Default = \" ]);\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 var options \x3D {\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 chart: {\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 title: \'Box Office Earnings in First Two Weeks of Opening\'\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 subtitle: \'in millions of dollars (USD)\'\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 }\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 width: 1000\x2C\n\xC2\xA0 \xC2\xA0 \xC2\xA0 \xC2\xA0 height: 900\n\xC2\xA0 \xC2\xA0 \xC2\xA0 };\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ggkLinearline5End, Type = String, Dynamic = False, Default = \"\n\xC2\xA0 \xC2\xA0 \xC2\xA0 var chart \x3D new google.charts.Line(document.getElementById(\'linechart_material\'));\n\n\xC2\xA0 \xC2\xA0 \xC2\xA0 chart.draw(data\x2C options);\n\xC2\xA0 \xC2\xA0 }\n\xC2\xA0 </script>\n</head>\n<body>\n\xC2\xA0 <div id\x3D\"linechart_material\"></div>\n</body>\n</html>\n", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events hReportViewer
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DocumentComplete(URL as String)
		  RaiseEvent DocumentComplete
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
		EditorType="String"
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
