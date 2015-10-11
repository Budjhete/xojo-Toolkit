#tag Class
Protected Class BHSaveButton
Inherits Canvas
Implements BHControl
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Pressed = True
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If (X >= 0 And Y >= 0 And X < Width And Y < Height) Then
		    WindowCompagnie(Self.TrueWindow).FocusNext
		    If WindowCompagnie(Self.TrueWindow).Panel.Changed And WindowCompagnie(Self.TrueWindow).Panel.Check Then
		      Call WindowCompagnie(Self.TrueWindow).Panel.Model.Save(WindowCompagnie(Self.TrueWindow).Database)
		      WindowCompagnie(Self.TrueWindow).EnableActions
		    ElseIf Not WindowCompagnie(Self.TrueWindow).Panel.Check Then
		      Dim pMessageDialog As New MessageDialog
		      
		      pMessageDialog.Message = kVousDevezCorrigerLesChampsColoresEnRoseAvantDePouvoirSauvegarder
		      pMessageDialog.CancelButton.Visible = False
		      pMessageDialog.ActionButton.Caption = "Ok"
		      pMessageDialog.AlternateActionButton.Visible = False
		      
		      Call pMessageDialog.ShowModal
		    End If
		  End If
		  
		  Pressed = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If Me.Backdrop = Nil Then
		    Me.Backdrop = glyphicons_416_disk_saved_16
		  End If
		  
		  Me.Label = kSauvegarder
		  Me.HelpTag = kSauvegarderClientHelpTag
		  Me.Enabled = False
		  RectControl(Me).Enabled = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Background
		  g.ForeColor = RGB(238,238,238)
		  If Self.mPressed Then
		    g.ForeColor = RGB(170,170,170)
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  // Highlight
		  g.ForeColor = RGB(253,253,253)
		  If Self.mPressed Then
		    g.ForeColor = RGB(189,189,189)
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height/2)
		  
		  If mLabel <> "" Then
		    Dim textX as Integer = g.Width/2
		    
		    If Backdrop <> Nil Then
		      textX = textX + (Backdrop.Width + kIconTextSpace)/2
		    End If
		    
		    If mEnabled Then
		      g.ForeColor = RGB(34,34,34)
		    Else
		      g.ForeColor = RGB(85,85,85)
		    End If
		    
		    g.TextSize = 10
		    g.DrawString(mLabel, textX, ((g.Height - g.TextHeight) / 2 + g.TextHeight) - 2, TextAlign.Center)
		  End If
		  
		  
		  ' Icone
		  If Backdrop <> Nil Then
		    Dim iconX As Integer = (Width-Backdrop.Width)/2
		    If mLabel <> "" Then
		      iconX = iconX - (kIconTextSpace + g.StringWidth(Label))/2
		    End If
		    
		    If mEnabled Then
		      g.DrawPicture(Backdrop, iconX, (Height-Backdrop.Height)/2)
		    Else
		      g.DrawPicture(CreateDisabledIcon(Backdrop), iconX, (Height-Backdrop.Height)/2)
		    End If
		  End If
		  
		  
		  // Bordure(s)
		  If mPressed Then
		    g.ForeColor = RGB(153,153,153)
		  Else
		    g.ForeColor = RGB(212,212,212)
		  End If
		  
		  g.DrawLine(0, 0, g.Width, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Check() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateDisabledIcon(enabledIcon as picture) As Picture
		  // TODO : Méthode statique
		  
		  dim x,y as integer
		  dim thePic as picture
		  dim c,white as color
		  
		  white = rgb(255,255,255)
		  enabledicon.transparent = 1
		  thePic = new Picture(enabledIcon.width,enabledIcon.height,32)
		  thePic.graphics.drawpicture enabledIcon,0,0
		  
		  for x = 0 to thePic.width -  1
		    for y = 0 to thePic.height -1
		      c = thepic.graphics.pixel(x,y)
		      if c <> rgb(255,255,255)  then
		        thepic.mask.graphics.pixel(x,y) = rgb(125,125,125)
		      else
		        thepic.mask.graphics.pixel(x,y) = rgb(255,255,255)
		      end if
		    next
		  next
		  thePic.transparent = 1
		  return thePic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContent() As Variant
		  // Part of the BHControl interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetContent(value As Variant)
		  // Part of the BHControl interface.
		  
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> mEnabled Then
			    mEnabled = value
			    Me.Refresh()
			  End If
			  
			  If Not mEnabled Then
			    Pressed = False
			  End If
			  
			  If Not RectControl(Me).Enabled Then
			    RectControl(Me).Enabled = True
			  End If
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLabel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLabel = value
			  Refresh()
			End Set
		#tag EndSetter
		Label As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLabel As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPressed As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPressed
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mEnabled And value <> mPressed Then
			    mPressed = value
			    Me.Refresh()
			  ElseIf Not mEnabled And value <> mPressed Then
			    mPressed = False
			    Me.Refresh
			  End If
			End Set
		#tag EndSetter
		Pressed As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = kIconTextSpace, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
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
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
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
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
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
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Label"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Pressed"
			Group="Behavior"
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
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
