#tag Module
Protected Module BHExtraRectControl
	#tag Method, Flags = &h0
		Function LeftScreen(Extends pRectControl As RectControl) As Integer
		  Dim pParentLeft As Integer
		  
		  If pRectControl.Parent <> Nil Then
		    pParentLeft = pRectControl.Parent.LeftScreen
		  End If
		  
		  Return pParentLeft + pRectControl.Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TopScreen(Extends pRectControl As RectControl) As Integer
		  Dim pParentTop As Integer
		  
		  If pRectControl.Parent <> Nil Then
		    pParentTop = pRectControl.Parent.TopScreen
		  End If
		  
		  Return pParentTop + pRectControl.Top
		End Function
	#tag EndMethod


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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
