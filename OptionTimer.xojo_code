#tag Class
Protected Class OptionTimer
Inherits Timer
	#tag Event
		Sub Action()
		  If Keyboard.AsyncAltKey = True And Pressed = False Then
		    Pressed = True
		    RaiseEvent KeyDown
		  ElseIf KeyBoard.AsyncAltKey = False And Pressed = True Then
		    Pressed = False
		    RaiseEvent KeyUp
		  End If
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event KeyDown()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Pressed As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
