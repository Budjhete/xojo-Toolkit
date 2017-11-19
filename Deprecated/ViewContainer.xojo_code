#tag Class
Protected Class ViewContainer
Inherits ContainerControl
Implements BHControl
	#tag Event
		Sub Open()
		  mInitialLeft = Left
		  mInitialTop = Top
		  
		  
		  #if TargetLinux
		    Helpers.linuxcontrolers(me)
		  #endif
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function ActionMenu(menuText As String) As MenuItem
		  if self.TrueWindow isa WindowCompagnie and _
		    Self.TrueWindow.MenuBar <> nil and _
		    Self.TrueWindow.MenuBar.Child("ActionMenu") <> nil and _
		    Self.TrueWindow.MenuBar.Child("ActionMenu").Text = menuText  then
		    return Self.TrueWindow.MenuBar.Child("ActionMenu")
		  else
		    return Nil
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanAndAppendOnActionMenu(menuitems As MenuItem, text As String)
		  Dim pMenuItemAction As MenuItem = MenuBarConfiguration.Child("ActionMenu")
		  
		  // On vide le menu pour le remplir.
		  while pMenuItemAction.Count > 0
		    // Fix pour Windows, on dirait qu'il supprime pas les separator...
		    dim menuCount As Integer = pMenuItemAction.Count
		    pMenuItemAction.Remove(0)
		    if pMenuItemAction.Count >= menuCount then
		      System.Log(System.LogLevelERROR, "Impossible de supprimer le menu !")
		      exit
		    end if
		  wend
		  
		  pMenuItemAction.AppendAll(menuitems)
		  
		  if not (text = "") then
		    pMenuItemAction.Text = text
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  RaiseEvent Closing()
		  Super.Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  super.Constructor
		  mInitialWidth = Me.Width
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CouldChange() As Boolean
		  return (not RaiseEvent CancelChange())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CouldClose() As Boolean
		  return (not RaiseEvent CancelClose())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContent() As Variant
		  // Part of the BHControl interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleMenuAction(name as String, text as String, tag as Variant) As Boolean
		  return RaiseEvent HandleMenuAction(name, text, tag)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitialLeft() As Integer
		  return mInitialLeft
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitialTop() As Integer
		  return mInitialTop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitialWidth() As Integer
		  return mInitialWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MayClose() As Boolean
		  return (not RaiseEvent DataUnsaved())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecieveMessage(message as String, param as Variant)
		  RaiseEvent Message(message, param)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreState(state as Dictionary)
		  for i as Integer = 0 to self.ControlCount - 1
		    dim currentCont as Control = self.Control(i)
		    
		    if state.HasKey(currentCont.Name) then
		      if currentCont IsA BHDatePicker then
		        BHDatePicker(currentCont).Date = state.Value(currentCont.Name).DateValue
		        
		      elseif currentCont isA BHTextField then
		        BHTextField(currentCont).SetString(state.Value(currentCont.Name).StringValue.DefineEncoding(Encodings.UTF8))
		        
		      elseif currentCont isA BHTextField then
		        BHTextField(currentCont).Text = state.Value(currentCont.Name).StringValue.DefineEncoding(Encodings.UTF8)
		        
		      elseif currentCont isA CheckBox then
		        CheckBox(currentCont).Value = state.Value(currentCont.Name).BooleanValue
		        
		      elseif currentCont isa BHComboBox then
		        BHComboBox(currentCont).Text = state.Value(currentCont.Name).StringValue.DefineEncoding(Encodings.UTF8)
		        
		      elseif currentCont isa PopupMenu then
		        PopupMenu(currentCont).ListIndex = state.Value(currentCont.Name).IntegerValue
		        
		      elseif currentCont isA BHListBox then
		        if BHListBox(currentCont).SaveState then
		          BHListBox(currentCont).Import(state.Value(currentCont.Name))
		        end
		        
		      elseif currentCont isA TabPanel then
		        TabPanel(currentCont).Value = state.Value(currentCont.Name).IntegerValue
		        
		      elseif currentCont isA BarButton then
		        BarButton(currentCont).Enabled = state.Value(currentCont.Name).BooleanValue
		        
		      elseif currentCont IsA BHSerializable then
		        BHSerializable(currentCont).Unserialize(state.Value(currentCont.Name))
		        
		      end if
		    end if
		  next
		  
		  RaiseEvent RestoreState(state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveState(ByRef state as Dictionary)
		  dim value as Variant
		  
		  for i as Integer = 0 to self.ControlCount - 1
		    dim currentCont as Control = self.Control(i)
		    
		    if currentCont IsA BHDatePicker then
		      state.Value(currentCont.Name) = BHDatePicker(currentCont).Date
		      
		    elseif currentCont isA BHTextField then
		      if BHTextField(currentCont).Text <> "" then
		        state.Value(currentCont.Name) = BHTextField(currentCont).Text
		      end
		      
		    elseif currentCont isA BHTextField and BHTextField(currentCont).Text <> "" then
		      state.Value(currentCont.Name) = BHTextField(currentCont).Text
		      
		    elseif currentCont isA CheckBox and CheckBox(currentCont).Value then
		      state.Value(currentCont.Name) = CheckBox(currentCont).Value
		      
		    elseif currentCont isA BHComboBox and BHComboBox(currentCont).Text <> "" then
		      state.Value(currentCont.Name) = BHComboBox(currentCont).Text
		      
		    elseif currentCont isA PopupMenu and PopupMenu(currentCont).Text <> "" then
		      state.Value(currentCont.Name) = PopupMenu(currentCont).ListIndex
		      
		    elseif currentCont isA BHListBox and BHListBox(currentCont).ListCount <> 0 then
		      if BHListBox(currentCont).SaveState then
		        state.Value(currentCont.Name) = BHListBox(currentCont).Export
		      end
		      
		    elseif currentCont isA TabPanel then
		      state.Value(currentCont.Name) = TabPanel(currentCont).Value
		      
		    elseif currentCont isA BarButton then
		      state.Value(currentCont.Name) = BarButton(currentCont).Enabled
		      
		    elseif currentCont IsA BHSerializable then
		      value = BHSerializable(currentCont).Serialize()
		      
		      if value <> nil then
		        state.Value(currentCont.Name) = value
		      end
		      
		    end if
		  next
		  
		  RaiseEvent SaveState(state)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenX() As Integer
		  return mInitialLeft + Me.Window.Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenY() As Integer
		  return mInitialTop + Me.Window.Top
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetContent(value As Variant)
		  // Part of the BHControl interface.
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BeforeSaveState()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CancelChange() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CancelClose() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Closing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataUnsaved() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HandleMenuAction(name as String, text as String, tag as Variant) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Message(message as String, param as Variant)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RestoreState(states As Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SaveState(ByRef state as Dictionary)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mInitialHeight As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialLeft As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialTop As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialWidth As Integer = 0
	#tag EndProperty


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
End Class
#tag EndClass
