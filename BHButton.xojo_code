#tag Class
Protected Class BHButton
Inherits Canvas
Implements BHControl
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  EstActif = True
		  
		  RaiseEvent MouseDown(X, Y)
		  
		  if mMenu <> nil then
		    dim mX as Integer = Me.ScreenX()
		    dim mY as Integer = Me.ScreenY() + Me.Height
		    
		    dim m as MenuItem = mMenu.PopUp(mX, mY)
		  end
		  
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
		Sub Open()
		  if MenuInitialValue.Trim <> "" then
		    
		    dim lines() as String = MenuInitialValue.Split(EndOfLine)
		    mMenu = new MenuItem()
		    
		    for i as Integer = 0 to lines.Ubound
		      mMenu.Append(new MenuItem(lines(i)))
		    next
		    
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  ' fond
		  g.ForeColor = IIF(EstActif, RGB(170,170,170), RGB(238,238,238))
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  ' highlight
		  g.ForeColor = IIF(EstActif, RGB(189,189,189), RGB(253,253,253))
		  g.FillRect(0, 0, g.Width, g.Height/2)
		  
		  'dim size as Integer = 0
		  'if Label <> "" then
		  'size = g.StringWidth(Label) + kIconTextSpace
		  'end
		  
		  if Caption <> "" then
		    dim textX as Integer = g.Width/2
		    
		    if Backdrop <> nil then
		      textX = textX + (Backdrop.Width + kIconTextSpace)/2
		    end
		    
		    g.ForeColor = IIF(Me.Enabled, RGB(34,34,34), RGB(85,85,85))
		    g.TextSize = 10
		    g.DrawString(Caption, textX, ((g.Height - g.TextHeight) / 2 + g.TextHeight) - 2, TextAlign.Center)
		  end
		  
		  
		  
		  
		  ' bordure(s)
		  g.ForeColor = IIF(EstActif, RGB(153,153,153), RGB(212,212,212))
		  g.DrawRect(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Check() As Boolean
		  Return True
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
		Bold As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		ButtonStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Caption As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return mEstActif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim doRefresh as Boolean = (value <> mEstActif)
			  
			  mEstActif = value
			  
			  if doRefresh then
			    Me.Refresh()
			  end
			End Set
		#tag EndSetter
		Private EstActif As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Italic As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		MenuInitialValue As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEstActif As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		TextFont As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextUnit As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Underline As Boolean = false
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
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonStyle"
			Visible=true
			Group="Appearance"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue="false"
			Type="Boolean"
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
			Name="MenuInitialValue"
			Visible=true
			Group="Menu"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			Type="Integer"
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
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="false"
			Type="Boolean"
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
