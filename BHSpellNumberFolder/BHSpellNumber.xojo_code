#tag Class
Protected Class BHSpellNumber
	#tag Method, Flags = &h0
		 Shared Function GetDigit(Digit As String) As String
		  Select Case Val(Digit)
		  Case 1
		    Return kOne
		  Case 2
		    Return kTwo
		  Case 3
		    Return kThree
		  Case 4
		    Return kFour
		  Case 5
		    Return kFive
		  Case 6
		    Return kSix
		  Case 7
		    Return kSeven
		  Case 8
		    Return kEight
		  Case 9
		    Return kNine
		  Case Else
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetHundreds(MyNumber As String) As string
		  Dim Result As String
		  If Val(MyNumber) = 0 Then Exit Function
		  
		  MyNumber = Right("000" + MyNumber, 3)
		  ' Convert the Hundreds Place
		  If Mid(MyNumber, 1, 1) <> "0" Then
		    if app.Lang = "en" then // add a constant Lang into your App class and add french and english for a string (fr, en)
		      Result = GetDigit(Mid(MyNumber, 1, 1)) + k_Hundred_
		    else
		      if Val(Mid(MyNumber, 1, 1)) >1 then
		        Result = GetDigit(Mid(MyNumber, 1, 1)) + k_Hundred_
		      else
		        Result = k_Hundred_
		      end if
		    End If
		  End If
		  
		  ' Convert the Tens and Ones place
		  If Mid(MyNumber, 2, 1) <> "0" Then
		    Result = Result + GetTens(Mid(MyNumber, 2))
		  Else
		    Result = Result + GetDigit(Mid(MyNumber, 3))
		  End If
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetTens(TensText As String) As String
		  // US GLOBAL STRING CONSTANTS for multi language kDix = "Ten" or "Dix"
		  Dim Result As String
		  If Val(Left(TensText, 1)) = 1 Then   ' If value between 10-19
		    Select Case Val(TensText)
		    Case 10
		      Return kTen //"Ten"
		    Case 11
		      Return kEleven // "Eleven"
		    Case 12
		      Return kTwelve //"Twelve"
		    Case 13
		      Return kThirteen //"Thirteen"
		    Case 14
		      Return kFourteen //"Fourteen"
		    Case 15
		      Return kFifteen //"Fifteen"
		    Case 16
		      Return kSixteen //"Sixteen"
		    Case 17
		      Return kSeventeen // "Seventeen"
		    Case 18
		      Return kEighteen // "Eighteen"
		    Case 19
		      Return kNineteen //"Nineteen"
		    Case Else
		    End Select
		  Else                                 ' If value between 20-99
		    Select Case Val(Left(TensText, 1))
		    Case 2
		      Result = kTwenty_
		    Case 3
		      Result = kThirty_
		    Case 4
		      Result = kForty_
		    Case 5
		      Result = kFifty_
		    Case 6
		      Result = kSixty_
		    Case 7
		      Result = kSeventy_
		    Case 8
		      Result = kEighty_
		    Case 9
		      Result = kNinety_
		    End Select
		    Result = Result + GetDigit(Right(TensText, 1))  ' Retrieve Ones place
		    Return Result
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ToText(NumberIn as Double, strCurr as String = "") As String
		  Dim Dollars, Temp As String
		  Dim DecimalPlace, Count As Integer
		  Dim MyNumber As String
		  Dim Place(9) As String
		  
		  
		  Place(2) = k_Thousand_
		  Place(3) = k_Million_
		  Place(4) = k_Billion_
		  Place(5) = k_Trillion_
		  
		  ' String Representation of Amount
		  MyNumber = Format(NumberIn, "#.000000").Replace(",", ".").Replace(" ", "")
		  
		  ' Position of Decimal Place, 0 if none
		  DecimalPlace = InStr(MyNumber, ".")
		  
		  ' Convert Cents and set MyNumber to Dollar Amount
		  MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
		  
		  
		  Count = 1
		  While MyNumber <> ""
		    Temp = GetHundreds(Right(MyNumber, 3))
		    If Temp <> ""  Then
		      if Temp = kOne and app.Lang = "fr"  and Count < 3 then
		        Dollars = Place(Count) + Dollars
		      else
		        Dollars = Temp + Place(Count) + Dollars
		      End If
		      
		    End If
		    If Len(MyNumber) > 3 Then
		      MyNumber = Left(MyNumber, Len(MyNumber) - 3)
		    Else
		      MyNumber = ""
		    End If
		    Count = Count + 1
		  Wend
		  
		  Return Dollars
		End Function
	#tag EndMethod


	#tag Constant, Name = kEight, Type = String, Dynamic = True, Default = \"Eight", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Eight"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Huit"
	#tag EndConstant

	#tag Constant, Name = kEighteen, Type = String, Dynamic = True, Default = \"Eighteen", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Eighteen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dix-huit"
	#tag EndConstant

	#tag Constant, Name = kEighty_, Type = String, Dynamic = True, Default = \"Eighty ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Eighty "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quatre-Vingt "
	#tag EndConstant

	#tag Constant, Name = kEleven, Type = String, Dynamic = True, Default = \"Eleven", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Onze"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Eleven"
	#tag EndConstant

	#tag Constant, Name = kFifteen, Type = String, Dynamic = True, Default = \"Fifteen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Fefteen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quinze"
	#tag EndConstant

	#tag Constant, Name = kFifty_, Type = String, Dynamic = True, Default = \"Fifty ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Fifty "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cinquante"
	#tag EndConstant

	#tag Constant, Name = kFive, Type = String, Dynamic = True, Default = \"Five", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Five"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cinq"
	#tag EndConstant

	#tag Constant, Name = kForty_, Type = String, Dynamic = True, Default = \"Forty ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Forty "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quarante "
	#tag EndConstant

	#tag Constant, Name = kFour, Type = String, Dynamic = True, Default = \"Four", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Four"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quatre"
	#tag EndConstant

	#tag Constant, Name = kFourteen, Type = String, Dynamic = True, Default = \"Fourteen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Fourteen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quatorze"
	#tag EndConstant

	#tag Constant, Name = kNine, Type = String, Dynamic = True, Default = \"Nine", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Nine"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Neuf"
	#tag EndConstant

	#tag Constant, Name = kNineteen, Type = String, Dynamic = True, Default = \"Dix-neuf", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dix-neuf"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Nineteen"
	#tag EndConstant

	#tag Constant, Name = kNinety_, Type = String, Dynamic = True, Default = \"Ninety ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Ninety "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quatre-Vingt-Dix "
	#tag EndConstant

	#tag Constant, Name = kOne, Type = String, Dynamic = True, Default = \"One", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"One"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Un"
	#tag EndConstant

	#tag Constant, Name = kSeven, Type = String, Dynamic = True, Default = \"Seven", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Seven"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Sept"
	#tag EndConstant

	#tag Constant, Name = kSeventeen, Type = String, Dynamic = True, Default = \"Seventeen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Seventeen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Seize"
	#tag EndConstant

	#tag Constant, Name = kSeventy_, Type = String, Dynamic = True, Default = \"Seventy ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Seventy "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Soixante-Dix "
	#tag EndConstant

	#tag Constant, Name = kSix, Type = String, Dynamic = False, Default = \"Six", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Six"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Six"
	#tag EndConstant

	#tag Constant, Name = kSixteen, Type = String, Dynamic = True, Default = \"Sixteen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sixteen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Seize"
	#tag EndConstant

	#tag Constant, Name = kSixty_, Type = String, Dynamic = True, Default = \"Sixty ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sixty "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Soixante "
	#tag EndConstant

	#tag Constant, Name = kTen, Type = String, Dynamic = True, Default = \"Ten", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dix"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Ten"
	#tag EndConstant

	#tag Constant, Name = kThirteen, Type = String, Dynamic = True, Default = \"Thirteen", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Thirteen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Treize"
	#tag EndConstant

	#tag Constant, Name = kThirty_, Type = String, Dynamic = True, Default = \"Thirty ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Thirty "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Trente "
	#tag EndConstant

	#tag Constant, Name = kThree, Type = String, Dynamic = True, Default = \"Three", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Three"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Trois"
	#tag EndConstant

	#tag Constant, Name = kTwelve, Type = String, Dynamic = True, Default = \"Twelve", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Twelve"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Douze"
	#tag EndConstant

	#tag Constant, Name = kTwenty_, Type = String, Dynamic = True, Default = \"Twenty ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Twenty "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vingt "
	#tag EndConstant

	#tag Constant, Name = kTwo, Type = String, Dynamic = True, Default = \"Two", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Two"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Deux"
	#tag EndConstant

	#tag Constant, Name = k_and_, Type = String, Dynamic = True, Default = \" and ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \" and "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" et "
	#tag EndConstant

	#tag Constant, Name = k_Billion_, Type = String, Dynamic = True, Default = \" Billion ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \" Billion "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" Milliards "
	#tag EndConstant

	#tag Constant, Name = k_Hundred_, Type = String, Dynamic = True, Default = \" Hundred ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \" Hundred "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" Cents "
	#tag EndConstant

	#tag Constant, Name = k_Million_, Type = String, Dynamic = True, Default = \" Million ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \" Million "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" Millions "
	#tag EndConstant

	#tag Constant, Name = k_Thousand_, Type = String, Dynamic = True, Default = \" Thousand ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \" Thousand "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" Mille "
	#tag EndConstant

	#tag Constant, Name = k_Trillion_, Type = String, Dynamic = True, Default = \" Trillion ", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \" Trillion "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \" Billions "
	#tag EndConstant


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
End Class
#tag EndClass
