#tag Class
Protected Class IPAddressTextField
Inherits TextField
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  If NOT KeyDown(Key) Then
		    
		    If Key <> chr(9) And Key <> chr(30) And Key <> chr(31) Then  // Don't check for tab keys or arrow up/down keys
		      
		      If (Asc(Key) < 48 or Asc(Key) > 57) And Asc(Key) <> 8  And Asc(Key) <> 46 Then Return True  //  If the key being pressed is not a number, backspace or period, then return and stop any input
		      
		      
		      Dim TextArray() As String  // We will use this to break down the text of the field into an array so as to see how many Octets we have
		      
		      If Asc(Key) = 8 Then                                // If we have a backspace then we...
		        AddyComplete = False                        // If we have backed up, the address is now not complete regardless if it was before.
		        
		        Dim s as string = me.Text.Left(me.text.len-1)
		        
		        If s.CountFields(".") = 4 Then
		          
		          If s.NthField(".",4) = "" Then
		            RaiseEvent AddressChanged(3,AddyComplete)
		          End If
		          
		        Else
		          RaiseEvent AddressChanged(s.CountFields("."),AddyComplete)
		        End If
		        
		        Return False                           // Allow the framework to do it's stuff
		        
		      ElseIf AddyComplete Then  // If the address is complete, return true to block any further input or action
		        Return True
		      End
		      
		      
		      
		      If InStr(me.Text, ".") = 0 Then  // If there are no periods in the field's text then we are in the first octet.  So trying to create an array will fail.  Instead we pass what we need.
		        
		        me.Text = BuildOctet(me.Text, Key,Len(me.Text)+1,1)
		        
		      Else
		        
		        TextArray = Split(me.Text,".")  // Create an array separated into elements by the period which says how many Octets we have
		        
		        TextArray(TextArray.Ubound) = BuildOctet(TextArray(TextArray.Ubound),Key,Len(TextArray(TextArray.Ubound))+1,TextArray.Ubound+1)  // Build the Octet 
		        
		        // The text we want to send to the BuildOctet function is the text that is in the last Octet we have built.
		        // We want to add the Key to the new text
		        // The number of characters entered into the new Octet so far is the length of the string in the last array element plus 1 for the character just entered
		        // The Octet number is the array element number + 1 (add the one as we start the Octet with 1 and arrays start with 0
		        
		        me.Text = Join(TextArray,".")  // Build the string back up.
		        
		      End
		      
		      me.SelStart = Len(me.Text)  // Set the insertion point
		      
		      
		      Return True // We built the string - don't let the framework.
		      
		    Else
		      Return False // Let the framework handle the tab key
		    End If
		    
		  End
		  
		  Return True // We built the string - don't let the framework.
		  
		  
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function BuildOctet(MyText As String, MyKey as String, Count as Integer,Octet As Integer) As String
		  // MyText is the intial or existing text from the text field.
		  // MyKey is the key that has been pressed
		  // Count is the current character position (starting at 1) in the current octet
		  // Octet is the current Octet we are in (starting at 1)
		  If Not Subnet Then
		    
		    Select Case Count
		      
		    Case 1  // First Character in the Octet
		      
		      If (Octet =1 or Octet = 4) And MyKey = "0" Then  // We don't allow a first or last octet of 0 so we ignore the key
		        MyText = ""
		        
		      ElseIf (Octet = 2 or Octet = 3) and MyKey = "0" Then  // If 0 is entered as the first character of the 2nd or third octet, we add the period
		        MyText = MyKey+"."
		        
		      ElseIf MyKey = "." Then  // We don't allow a period to be entered as the first key.  Return a blank string (ignore the key)
		        MyText=""
		        
		      Else  // We have valid input - return the key
		        MyText = MyKey
		        
		      End if
		      
		    Case 2 // Second Character in the Octet or Octet termination (period)
		      
		      If MyKey = "." Then   // If we have a period...
		        
		        If Octet < 4 Then MyText = MyText+MyKey  // If We are in Octets 1, 2 or 3 then we return the initial text plus the period.  Otherwise, we end up returning the intial text.
		        
		      Elseif Asc(mid(MyText,len(MyText),1)) > 50 Then  // If the previous character is > 2 
		        
		        MyText = FourthOctetCheck(MyText,MyKey,Octet)
		        
		      Elseif Asc(mid(MyText,len(MyText),1)) = 50 Then
		        
		        If ASC(MyKey) > 53 Then
		          
		          MyText=FourthOctetCheck(MyText,MyKey,Octet)
		          
		        Else
		          
		          MyText = MyText+MyKey
		          
		          
		        End If
		        
		      Else
		        
		        MyText = MyText+MyKey  // Otherwise we have plain, valid text - add it on to the existing text.
		        
		        
		      End If
		      
		    Case 3  // Third character for the Octet or Octet termination (period)
		      
		      If MyKey = "." Then  // If the third character is a period
		        
		        If Octet < 4 Then MyText = MyText+MyKey  // If We are in Octets 1, 2 or 3 then we return the initial text plus the period.  Otherwise, we end up returning the intial text.
		        
		      ElseIf Asc(mid(MyText,len(MyText)-1,1)) = 50 And Asc(mid(MyText,len(MyText),1)) = 53 and Asc(MyKey) > 52 Then
		         MyText = MyText  // If two characters prior is a 2 and 1 character prior is a 5 and we are trying to enter higher than 4 then return and ignore the input since we can't have higher than 254.
		        // Do Nothing
		      Else
		        
		        If MyText.Left(1).Asc = 50 Then
		          
		          If MyText.Mid(2,1).Asc > 53 Then
		            MyText = FourthOctetCheck(MyText,"",Octet)
		          Else
		            MyText = FourthOctetCheck(MyText,MyKey,Octet)
		          End If
		          
		        ElseIf MyText.Left(1).Asc > 50 Then
		          
		          MyText = FourthOctetCheck(MyText,"",Octet)
		          
		        Else
		          
		          MyText = FourthOctetCheck(MyText,MyKey,Octet)
		          
		        End If
		        
		      End if
		      
		    End Select
		    
		  Else
		    
		    //Handle 224, 240, 248, 252, 254,255
		    Select Case Count
		      
		    Case 1
		      
		      If MyKey = "0" and Octet >1 Then
		        MyText = BuildSubnet(MyText+MyKey,Octet)
		        
		      ElseIf MyKey = "1" or MyKey = "2" Then
		        MyText = MyKey
		      Else
		        MyText = ""
		      End If
		      
		    Case 2
		      
		      If (Left(MyText,1) = "1" and (MyKey = "2" or MyKey = "9")) Then
		        
		        If MyKey = "2" Then
		          MyText = MyText+"28"
		        Else
		          MyText = MyText+"92"
		        End If
		        
		        MyText = BuildSubnet(MyText,Octet)
		        
		      ElseIf (Left(MyText,1) = "2" and (MyKey = "2" or MyKey = "4" or MyKey = "5")) Then
		        
		        //Handle 224, 240, 248, 252, 254,255
		        
		        If MyKey = "2" Then
		          MyText = MyText+"24"
		          MyText = BuildSubnet(MyText,Octet)
		          
		        ElseIf MyKey = "4" Then
		          MyText = MyText+"4"
		        Else
		          MyText = MyText+"5"
		        End If
		        
		        'AddyComplete = False
		        
		      Else
		        MyText = MyText
		      End If
		      
		    Case 3
		      Dim test as string = Mid(MyText,2,1)
		      
		      If MyKey = "0" Then
		        If Left(MyText,2) = "24" Then 
		          MyText = MyText+MyKey
		          MyText = BuildSubnet(MyText,Octet)
		        Else 
		          MyText = MyText
		        End If
		        
		        //Handle 224, 240, 248, 252, 254,255
		        
		      ElseIf MyKey = "2" Then
		        
		        If Left(MyText,2) = "25"  Or Left(MyText,2) = "19" Then
		          MyText = MyText+MyKey
		          MyText = BuildSubnet(MyText,Octet)
		        Else
		          MyText = MyText
		        End IF
		        
		      ElseIf MyKey = "4" Then
		        
		        If Left(MyText,2) = "25" Then
		          MyText = MyText + MyKey
		          MyText = BuildSubnet(MyText,Octet)
		        Else
		          MyText = MyText
		        End If
		        
		      ElseIf MyKey = "5" And Octet < 4 Then
		        
		        If Left(MyText,2) = "25" Then
		          MyText = MyText+"5."
		        Else
		          MyText = MyText
		        End If
		        
		      Elseif MyKey = "8" Then
		        If Left(MyText,2) = "24" Or Left(MyText,2) = "12" Then
		          MyText = MyText+MyKey
		          MyText = BuildSubnet(MyText,Octet)
		        Else
		          MyText = MyText
		        End
		        
		      Else
		        MyText = MyText
		      End If
		      
		    End Select
		    
		  End If
		  
		  RaiseEvent AddressChanged(Octet,AddyComplete)
		  
		  Return MyText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildSubnet(MyText as String,Octet as Integer) As String
		  Select Case Octet
		    
		  Case 1
		    MyText = MyText +".0.0.0"
		  Case 2
		    MyText = MyText+".0.0"
		  Case 3
		    MyText = MyText+".0"
		  Case 4
		    MyText = MyText
		  End
		  
		  AddyComplete = True
		  
		  Return MyText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FourthOctetCheck(MyText as String, MyKey as String, Octet As  Integer) As String
		  If Octet < 4 Then  // If we are not in the 4th Octet, the Octet will now be complete so add the key and the period to the string
		    
		    //Remove Any Extraneous zeros
		    
		    If Len(MyText) > 1 Then  // Only check of the text length > 1 - we can have 1 zero
		      
		      While MyText.Left(1).Asc = 48  // If the first character is already a zero then keep only the right most characters.  Loop it until you get rid of leading zeros.
		        MyText = MyText.Right(Len(MyText)-1)
		      Wend
		      
		    End If
		    
		    
		    MyText = MyText+MyKey+"."
		    
		  Else
		    MyText = MyText+MyKey   // We are in the 4th Octet, add in the new character but no period and mark the address as complete so we can't enter more input.
		    AddyComplete = True             // The address is complete.  No more characters will be allowed
		    
		  End
		  
		  Return MyText
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AddressChanged(Octet As Integer, AddressComplete As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
	#tag EndHook


	#tag Note, Name = Documentation
		IP Address TextField
		
		Written by: Jon Ogden, jon@justaddsoftware.net
		©2012 Just Add Software, LLC
		
		
		
		This custom text field is used to ensure generation of "proper" IP addresses.  It will allow users to enter in any valid set of IPV4 Octets.  Depending on the character's entered,
		a new Octet will either be started by the automatic entry of a period or entry will be blocked all together (ie: you can't enter an Octet of something like 259).
		
		Full docmentation of the code is provided by comments.
		
		I'm not sure if there is any more to explain than this!
		
		I'd appreciate any feedback or comments on where you are using this.
	#tag EndNote

	#tag Note, Name = License
		IP Address TextField
		© 2012 Just Add Software LLC
		
		Written by Jon Ogden - jon@justaddsoftware.net
		
		License:
		
		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights to
		use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
		of the Software, and to permit persons to whom the Software is furnished to do
		so, subject to the following conditions:
		
		The author's name and company listed above and the above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.
		
		This license note and the documentation note must accompany any redistribution of this software.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
		INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
		PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
		HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
		CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
		OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		AddressChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			// This property is used to signify when the IP address has been completed and no more characters are allowed.
		#tag EndNote
		Private AddyComplete As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNetworkBits As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If me.Subnet Then
			    
			    Select Case Me.Text
			      
			    Case "255.255.255.0"
			      Return 24
			    Case "128.0.0.0"
			      Return 1
			    Case "192.0.0.0"
			      Return 2
			    Case "224.0.0.0"
			      Return 3
			    Case "240.0.0.0"
			      Return 4
			    Case "248.0.0.0"
			      Return 5
			    Case "252.0.0.0"
			      Return 6
			    Case "254.0.0.0"
			      Return 7
			    Case "255.0.0.0"
			      Return 8
			    Case "255.128.0.0"
			      Return 9
			    Case "255.192.0.0"
			      Return 10
			    Case "255.224.0.0"
			      Return 11
			    Case "255.240.0.0"
			      Return 12
			    Case "255.248.0.0"
			      Return 13
			    Case "255.252.0.0"
			      Return 14
			    Case "255.254.0.0"
			      Return 15
			    Case "255.255.0.0"
			      Return 16
			    Case "255.255.128.0"
			      Return 17
			    Case "255.255.192.0"
			      Return 18
			    Case "255.255.224.0"
			      Return 19
			    Case "255.255.240.0"
			      Return 20
			    Case "255.255.248.0"
			      Return 21
			    Case "255.255.252.0"
			      Return 22
			    Case "255.255.254.0"
			      Return 23
			    Case "255.255.255.128"
			      Return 25
			    Case "255.255.255.192"
			      Return 26
			    Case "255.255.255.224"
			      Return 27
			    Case "255.255.255.240"
			      Return 28
			    Case "255.255.255.248"
			      Return 29
			    Case "255.255.255.252"
			      Return 30
			    Case "255.255.255.254"
			      Return 31
			    Case "255.255.255.255"
			      Return 32
			    End Select
			  End
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If me.Subnet Then
			    
			    Select Case value
			      
			    Case 24
			       me.Text = "255.255.255.0"
			    Case 1
			       me.Text = "128.0.0.0"
			    Case 2
			      me.Text = "192.0.0.0"
			    Case 3 
			      me.Text = "224.0.0.0"
			    Case 4
			      me.Text = "240.0.0.0"
			    Case 5
			      me.Text = "248.0.0.0"
			    Case 6
			      me.Text = "252.0.0.0"
			    Case 7
			      me.Text = "254.0.0.0"
			    Case 8
			      me.Text = "255.0.0.0"
			    Case 9
			      me.Text = "255.128.0.0"
			    Case 10
			      me.Text = "255.192.0.0"
			    Case 11
			      me.Text = "255.224.0.0"
			    Case 12
			      me.Text = "255.240.0.0"
			    Case 13
			      me.Text = "255.248.0.0"
			    Case 14
			      me.Text = "255.252.0.0"
			    Case 15
			      me.Text = "255.254.0.0"
			    Case 16
			      me.Text = "255.255.0.0"
			    Case 17
			      me.Text = "255.255.128.0"
			    Case 18
			      me.Text = "255.255.192.0"
			    Case 19
			      me.Text = "255.255.224.0"
			    Case 20
			      me.Text = "255.255.240.0"
			    Case 21
			      me.Text = "255.255.248.0"
			    Case 22
			      me.Text = "255.255.252.0"
			    Case 23
			      me.Text = "255.255.254.0"
			    Case 25
			      me.Text = "255.255.255.128"
			    Case 26
			      me.Text = "255.255.255.192"
			    Case 27
			      me.Text = "255.255.255.224"
			    Case 28
			      me.Text = "255.255.255.240"
			    Case 29
			      me.Text = "255.255.255.248"
			    Case 30
			      me.Text = "255.255.255.252"
			    Case 31
			      me.Text = "255.255.255.254"
			    Case 32
			      me.Text = "255.255.255.255"
			    End Select
			    
			  End If
			End Set
		#tag EndSetter
		NetworkBits As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Subnet As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AddressChanged"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CueText"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
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
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
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
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NetworkBits"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Subnet"
			Visible=true
			Group="Behavior"
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
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
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
			InitialValue="80"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
