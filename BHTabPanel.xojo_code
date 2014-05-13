#tag Class
Protected Class BHTabPanel
Inherits TabPanel
Implements BHControl
	#tag Method, Flags = &h0
		Sub Append(name As String)
		  AssertInitialized()
		  
		  dim panel as new BHTabPanelItem(name)
		  
		  mPanels.Append(panel)
		  
		  Super.Append(name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AssertInitialized()
		  if mInitialized then
		    return
		  end
		  
		  mInitialized = true
		  
		  
		  for i as Integer = 0 to PanelCount-1
		    mPanels.Append(new BHTabPanelItem(Super.Caption(i)))
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CalculateRealIndex(panel as BHTabPanelItem, AssumeEnabled as Boolean = false) As Integer
		  AssertInitialized()
		  
		  dim index as Integer = -1
		  
		  for each aPanel as BHTabPanelItem in mPanels
		    if aPanel.Enabled then
		      index = index + 1
		      
		      if aPanel = panel then
		        return index
		      end
		    end
		    
		    if aPanel = panel and AssumeEnabled then
		      return index+1
		    end
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CalculateRealIndex(index as Integer, AssumeEnabled as Boolean = false) As Integer
		  return CalculateRealIndex(mPanels(index), AssumeEnabled)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Caption(Index As Integer) As String
		  AssertInitialized()
		  
		  return mPanels(Index).Caption
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Caption(Index As Integer, Assigns value as String)
		  AssertInitialized()
		  
		  mPanels(Index).Caption = value
		  
		  dim real_index as Integer = CalculateRealIndex(index)
		  
		  if real_index >= 0 then
		    Super.Caption(real_index) = value
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  mSavedVisibility = new Dictionary()
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContent() As Variant
		  // Part of the BHControl interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(index As Integer, name As String)
		  AssertInitialized()
		  
		  dim tab as new BHTabPanelItem(name)
		  
		  mPanels.Insert(index, tab)
		  
		  dim real_index as Integer = CalculateRealIndex(tab)
		  
		  Super.Insert(real_index, name)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RealPanelCount() As Integer
		  AssertInitialized()
		  
		  return mPanels.Ubound+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RealPanelIndex() As Integer
		  return CalculateRealIndex(PanelIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  AssertInitialized()
		  
		  dim real_index as Integer = CalculateRealIndex(index)
		  
		  mPanels.Remove(Index)
		  
		  if real_index >= 0 then
		    Super.Remove(real_index)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(name as String)
		  for i as Integer = PanelCount-1 DownTo 0
		    if Caption(i) = name then
		      Remove(i)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetContent(value As Variant)
		  // Part of the BHControl interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TabControls(index as Integer) As RectControl()
		  dim controls() as RectControl
		  dim control as Control
		  
		  for i as Integer = 0 to Window.ControlCount-1
		    control = Window.Control(i)
		    
		    if control IsA RectControl and RectControl(control).Parent = Me and RectControl(control).PanelIndex = index then
		      controls.Append(RectControl(control))
		    end
		  next
		  
		  return controls
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TabEnabled(pIndex As Integer) As Boolean
		  return mPanels(pIndex).Enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TabEnabled(pIndex As Integer, Assigns value As Boolean)
		  AssertInitialized()
		  Dim panel As BHTabPanelItem = mPanels(pIndex)
		  
		  // Ne fait rien si l'onglet est déjà dans l'état désiré.
		  If panel.Enabled = value Then
		    Return
		  End If
		  
		  panel.Enabled = value
		  panel.Controls = TabControls(pIndex)
		  // Passe à travers tous les contrôles du panneau
		  For Each control As RectControl In panel.Controls
		    
		    // Change l'état des contrôles faisant partie de l'onglet désiré
		    If control.PanelIndex = pIndex Then
		      control.Enabled = value
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TabVisible(index as Integer) As Boolean
		  AssertInitialized()
		  
		  return mPanels(index).Enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TabVisible(index as Integer, Assigns value as Boolean)
		  AssertInitialized()
		  
		  dim panel as BHTabPanelItem = mPanels(index)
		  
		  if panel.Enabled = value then
		    return
		  end
		  
		  panel.Enabled = value
		  
		  dim real_index as Integer = CalculateRealIndex(panel, true)
		  
		  if value then
		    // On active le panel
		    Super.Insert(real_index, panel.Caption)
		    
		    for each control as RectControl in panel.Controls
		      control.PanelIndex = real_index
		      ' control.Parent = Me
		      control.Visible = mSavedVisibility.Value(control).BooleanValue
		    next
		  else
		    // On désactive le panel
		    panel.Controls = TabControls(index)
		    
		    for each control as RectControl in panel.Controls
		      mSavedVisibility.Value(control) = control.Visible
		      
		      ' control.Parent = nil
		      control.PanelIndex = -1
		      control.Visible = false
		    next
		    
		    Super.Remove(real_index)
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mInitialHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialized As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPanels() As BHTabPanelItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSavedVisibility As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
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
			Name="Italic"
			Visible=true
			Group="Font"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Panels"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="PanelEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SmallTabs"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabDefinition"
			Group="Appearance"
			InitialValue="Tab 0\\\\rTab 1"
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
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
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
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
