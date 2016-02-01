#tag Class
Protected Class BHScrollBar
Inherits ScrollBar
Implements BHControl
	#tag Method, Flags = &h0
		Function Check() As Boolean
		  // Part of the BHControl interface.
		  
		  Return True
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineStep"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LiveScroll"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Maximum"
			Visible=true
			Group="Initial State"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minimum"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageStep"
			Visible=true
			Group="Behavior"
			InitialValue="20"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="16"
			Type="Integer"
			InheritedFrom="ScrollBar"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
