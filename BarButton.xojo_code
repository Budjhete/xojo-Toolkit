#tag Class
Protected Class BarButton
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  EstActif = True
		  
		  RaiseEvent MouseDown(X, Y)
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  EstActif = (X >= 0 and Y >= 0 and X < Width and Y < Height)
		  RaiseEvent MouseDrag(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (X >= 0 and Y >= 0 and X < Width and Y < Height) then
		    RaiseEvent Action
		  end
		  
		  EstActif = False
		  
		  RaiseEvent MouseUp(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  ' fond
		  g.ForeColor = IIF(EstActif, &caaaaaa, &ceeeeee)
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  ' highlight
		  g.ForeColor = IIF(EstActif, &cbdbdbd, &cfdfdfd)
		  g.FillRect(0, 0, g.Width, g.Height/2)
		  
		  'dim size as Integer = 0
		  'if Label <> "" then
		  'size = g.StringWidth(Label) + kIconTextSpace
		  'end
		  
		  if Label <> "" then
		    dim textX as Integer = g.Width/2
		    
		    if Backdrop <> nil then
		      textX = textX + (Backdrop.Width + kIconTextSpace)/2
		    end
		    
		    g.ForeColor = IIF(Me.Enabled, &c222222, &c555555)
		    g.TextSize = 10
		    g.DrawString(Label, textX, ((g.Height - g.TextHeight) / 2 + g.TextHeight) - 2, TextAlign.Center)
		  end
		  
		  
		  ' Icone
		  if Backdrop <> nil then
		    dim iconX as Integer = (Width-Backdrop.Width)/2
		    if Label <> "" then
		      iconX = iconX - (kIconTextSpace + g.StringWidth(Label))/2
		    end
		    
		    if Me.Enabled then
		      g.DrawPicture(Backdrop, iconX, (Height-Backdrop.Height)/2)
		    else
		      g.DrawPicture(CreateDisabledIcon(Backdrop), iconX, (Height-Backdrop.Height)/2)
		    end
		  end
		  
		  
		  ' bordure(s)
		  g.ForeColor = IIF(EstActif, &c999999, &cd4d4d4)
		  
		  if BorderTop then
		    g.DrawLine(0, 0, g.Width, 0)
		  end
		  
		  if BorderRight then
		    g.DrawRect((g.Width-1), 0, (g.Width-1), g.Height)
		  end
		  
		  if BorderBottom then
		    g.DrawLine(0, (g.Height-1), g.Width, (g.Height-1))
		  end
		  
		  if BorderLeft then
		    g.DrawRect(0, 0, 0, g.Height)
		  end
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CreateDisabledIcon(enabledIcon as picture) As Picture
		  
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


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X as Integer, Y as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X as Integer, Y as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X as Integer, Y as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		BorderBottom As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderLeft As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderRight As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderTop As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return estActif_
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim doRefresh as Boolean = (value <> estActif_)
			  
			  estActif_ = value
			  
			  if doRefresh then
			    Me.Refresh()
			  end
			End Set
		#tag EndSetter
		Private EstActif As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private estActif_ As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLabel
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

	#tag Property, Flags = &h21
		Private mLabel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Resizeable As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Tag As String
	#tag EndProperty


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
			Name="BorderBottom"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderRight"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resizeable"
			Group="Behavior"
			InitialValue="False"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
