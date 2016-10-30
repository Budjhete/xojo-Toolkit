#tag Window
Begin BHWindow BHViewerHTMLEmail
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   8
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   184
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
   Title           =   "kEnvoyerParCourriel"
   Visible         =   True
   Width           =   344
   Begin PushButton pbEnvoyer
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kEnvoyer"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   236
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Underline       =   False
      Visible         =   True
      Width           =   88
   End
   Begin PushButton pbAnnuler
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "#kAnnuler"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin BHTextField tDestinataireCourriel
      AcceptTabs      =   False
      Alignment       =   0
      Alpha           =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "jonh@do.com, jean@tremblay.com"
      Dash            =   False
      DataField       =   ""
      DataSource      =   ""
      Date            =   False
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
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaxLength       =   0
      mError          =   ""
      MinLength       =   0
      NotEmpty        =   True
      Numeric         =   False
      Password        =   False
      Phone           =   False
      Range           =   False
      RangeMax        =   0
      RangeMin        =   0
      ReadOnly        =   False
      Regex           =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   34
      Underline       =   False
      URL             =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   304
      ZipCode         =   False
   End
   Begin Label lbNomUtilisateur
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "#kCourrielDestinataire"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   190
   End
   Begin BHTextField tSujetCourriel
      AcceptTabs      =   False
      Alignment       =   0
      Alpha           =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "#kSujet"
      Dash            =   False
      DataField       =   ""
      DataSource      =   ""
      Date            =   False
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
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaxLength       =   0
      mError          =   ""
      MinLength       =   0
      NotEmpty        =   True
      Numeric         =   False
      Password        =   False
      Phone           =   False
      Range           =   False
      RangeMax        =   0
      RangeMin        =   0
      ReadOnly        =   False
      Regex           =   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   88
      Underline       =   False
      URL             =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   304
      ZipCode         =   False
   End
   Begin Label lbSujet
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "#kSujet"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   68
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   190
   End
   Begin SMTPSecureSocket sock
      CertificateFile =   
      CertificatePassword=   ""
      CertificateRejectionFile=   
      ConnectionType  =   2
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      Secure          =   False
      SMTPConnectionMode=   0
      TabPanelIndex   =   0
   End
   Begin ProgressWheel ProgressWheel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   208
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   146
      Visible         =   False
      Width           =   16
   End
   Begin Timer Timer1
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Label lbErreur
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   122
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   296
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1000
		Sub Constructor(pPDF as folderitem, pEmail as String = "")
		  mPDF = pPDF
		  tDestinataireCourriel.Text = pEmail
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(pHTML as string, pEmail as String = "")
		  mHTML = pHTML
		  tDestinataireCourriel.Text = pEmail
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmailHardCore()
		  ProgressWheel1.Visible = true
		  pbEnvoyer.Enabled = False
		  
		  
		  'Note: the 'p' Variables are Received into this Method as Parameters
		  
		  
		  dim strMessage as String
		  dim strEmailAddress as String = "mailto:" + tDestinataireCourriel.text
		  dim strEmailSubject as String = tSujetCourriel.text
		  dim strEmailBody as String = mHTML
		  dim strEmailSignature as String = ""
		  dim strAttachmentName as String
		  
		  If mPDF <> Nil then
		    strAttachmentName = mPDF.Name
		  end if
		  dim strCC, strBCC as String = ""
		  
		  'Construct the Body - Dealing with Cross Platform Differences
		  strEmailBody = strEmailBody + Encodings.UTF8.Chr(13) + Encodings.UTF8.Chr(13) + strEmailSignature
		  #if (TargetMacOS) =TRUE
		    strEmailBody = ReplaceLineEndings(strEmailBody,Chr(10))
		  #endif
		  #if (TargetWin32) =TRUE
		    dim strHTML as String = ""
		    strEmailBody = ReplaceLineEndings(strEmailBody,"%0D%0A")
		    strEmailBody = ReplaceAll(strEmailBody," ","%20")
		    strHTML = strHTML + strEmailBody
		    strHTML = strHTML + "&nbsp;"
		    strHTML = strHTML + "</p>"
		    strEmailBody = strHTML
		  #endif
		  
		  'Deal with CC and BCC
		  if strCC.Len > 1 and strBCC.Len > 1 then
		    strMessage = strEmailAddress + "?subject=" + strEmailSubject + "&cc=" + strCC + "&bcc=" + strBCC+ "&body=" + strEmailBody
		  elseif strCC.Len < 1 and strBCC.Len < 1 then
		    strMessage = strEmailAddress + "?subject=" + strEmailSubject + "&body=" + strEmailBody
		  elseif strCC.Len > 1 and strBCC.Len < 1 then
		    strMessage = strEmailAddress + "?subject=" + strEmailSubject + "&cc=" + strCC + "&body=" + strEmailBody
		  elseif strCC.Len < 1 and strBCC.Len > 1 then
		    strMessage = strEmailAddress + "?subject=" + strEmailSubject + "&bcc=" + strBCC + "&body=" + strEmailBody
		  end if
		  
		  'Deal with Attachment
		  if strAttachmentName.Len > 0 then
		    strMessage = strMessage + "&attach=" + strAttachmentName
		  end if
		  
		  'Send via Default Email Client
		  ShowURL strMessage
		  
		  
		  //####################################################################################
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmailInterne()
		  ProgressWheel1.Visible = true
		  pbEnvoyer.Enabled = False
		  
		  dim e as new EmailMessage
		  dim a as EmailAttachment
		  dim s as string
		  
		  
		  s = replaceAll(tDestinataireCourriel.text,",",chr(13))
		  s = replaceAll(s,chr(13)+chr(10),chr(13))
		  for i as integer = 1 to countFields(s,chr(13))
		    e.addRecipient trim(nthField(s,chr(13),i))
		  next
		  //e.AddRecipient  tNomUtilisateurCourriel.text//Replace(tNomUtilisateurCourriel.text, ",", ">,<") //
		  e.Subject = tSujetCourriel.text
		  
		  dim cpny as Company = Company.Current()
		  if  cpny.Client().courriel <> "" then
		    e.FromAddress = cpny.Client().courriel // "etienne@hete.ca" //
		  else
		    e.FromAddress = "no-reply@kanjo.ca"
		  end if
		  
		  e.Headers.AppendHeader "X-Mailer", "Kanjo SMTP Mail Services"
		  
		  mHTML = Replace(mHTML, "<head>", "<head><base href=""http://www.kanjo.ca/"" />")
		  
		  
		  e.BodyHTML = mHTML
		  
		  // attachement
		  If mPDF <> Nil then
		    a = New EmailAttachment
		    a.loadFromFile mPDF
		    e.attachments.append a
		    e.BodyPlainText = "See PDF attachment, Ce courriel a un PDF en attaché"
		    
		  Else
		    e.BodyPlainText = "See html content in this email, Ce courriel est en HTML"
		  end
		  
		  sock.Messages.Append e
		  sock.Address = Company.Current.Preference("configuration.email.server") //"mail.hete.org" //
		  sock.Username =  Company.Current.Preference("configuration.email.username") //"etienne@hete.org" //
		  sock.Password = Company.Current.Preference("configuration.email.password")//"pile4626" //
		  if (Company.Current.Preference("configuration.email.port") <> Nil) AND (Company.Current.Preference("configuration.email.port") <> "") then
		    sock.port = Val(Company.Current.Preference("configuration.email.port")) //25
		  else
		    sock.port = 25
		  end if
		  
		  // SSL
		  if (Company.Current.Preference("configuration.email.ssl") <> Nil) AND (Company.Current.Preference("configuration.email.ssl") <> "") then
		    sock.Secure = Company.Current.Preference("configuration.email.ssl")
		  else
		    sock.Secure = False
		    
		  end if
		  // On envoie la sauce à pattate juteuse !
		  sock.SendMail
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmailKanjo()
		  dim req as new HTTPSocket
		  
		  req.SetRequestHeader("User-Agent", "Budjhete/2.5 (Macintosh; Intel Mac OS X 10_11_4; en-us)")
		  
		  dim s as string
		  dim cpny as Company = Company.Current()
		  if  cpny.Client().courriel <> "" then
		    s = cpny.Client().courriel
		  else
		    s = "no-reply@kanjo.ca"
		  end if
		  
		  dim tHTML as string = Replace(mHTML, "<head>", "<head><base href=""http://www.kanjo.ca/"" />")
		  tHTML = Replace(tHTML, "<?xml version=""1.0"" encoding=""UTF-8""?>"+Chr(13), "")
		  tHTML = EncodeBase64(tHTML)
		  dim post as new Dictionary
		  //post.Value("name") = tName.Text
		  post.Value("email") = tDestinataireCourriel.text
		  post.Value("subject") = tSujetCourriel.text
		  post.Value("html") = tHTML
		  post.Value("from") = s
		  
		  req.SetFormData(post)
		  dim r as string = req.Post("http://app.kanjo.ca/send-email.php", 10)
		  
		  if Len(r) > 4 then
		    MsgBox r
		  else
		    MsgBox "kCourrielEnvoyeAvecSucces"
		  end if
		  Close()
		  
		  
		  
		  
		  
		  //e.Headers.AppendHeader "X-Mailer", "Kanjo SMTP Mail Services"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub showmodal(pPDF as Folderitem, pEmail as String = "")
		  Dim pBHReportHTMLViewer As New  BHViewerHTMLEmail(pPDF, pEmail)
		  
		  pBHReportHTMLViewer.ShowModal()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub showmodal(pHTML as String, pEmail as String = "")
		  Dim pBHReportHTMLViewer As New  BHViewerHTMLEmail(pHTML, pEmail)
		  
		  pBHReportHTMLViewer.ShowModal()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mHTML As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mPDF As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events pbEnvoyer
	#tag Event
		Sub Action()
		  EmailKanjo()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAnnuler
	#tag Event
		Sub Action()
		  self.close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tDestinataireCourriel
	#tag Event
		Sub TextChange()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sock
	#tag Event
		Sub ConnectionEstablished(greeting as string)
		  System.DebugLog "connected"
		  lbErreur.Text = kEnvoiEnCours_
		  ProgressWheel1.Visible = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  dim ErrorString as string = ""
		  
		  Select Case me.LastErrorCode
		  case 22
		    ErrorString = kVerifiezVotreConfiguration
		  case 103
		    ErrorString = kConfigurationURLServerNonValide
		  End Select
		  
		  if me.LastErrorCode <> 102 then
		    lbErreur.Text = "Status : "+str(me.LastErrorCode) + " : " + ErrorString
		    
		  end if
		  
		  System.DebugLog "error "+str(me.LastErrorCode)
		  System.DebugLog "Address : " + me.Address
		  System.DebugLog "Port : " + str(me.Port)
		  System.DebugLog "Password : " + me.Password
		  System.DebugLog "Username : " + me.Username
		  System.DebugLog "RemoteAddress : " + me.RemoteAddress
		  System.DebugLog "Secure : " + str(me.Secure)
		  
		  ProgressWheel1.Visible = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub MailSent()
		  ProgressWheel1.Visible = false
		  System.DebugLog "mail sent"
		  
		  lbErreur.text = kMessageEnvoye_
		  timer1.Mode = 1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ServerError(ErrorID as integer, ErrorMessage as string, Email as EmailMessage)
		  System.DebugLog "Server error: "+ErrorMessage
		  lbErreur.text = "Server error: "+ErrorMessage
		  
		  ProgressWheel1.Visible = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub MessageSent(Email as EmailMessage)
		  System.DebugLog "message sent"
		  ProgressWheel1.Visible = false
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  ProgressWheel1.Visible = false
		  self.close
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
		Name="mHTML"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
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
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
