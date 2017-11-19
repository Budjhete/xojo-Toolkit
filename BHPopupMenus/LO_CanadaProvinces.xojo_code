#tag Module
Protected Module LO_CanadaProvinces
	#tag Constant, Name = kAlberta, Type = String, Dynamic = True, Default = \"Alberta", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Alberta"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Alberta"
	#tag EndConstant

	#tag Constant, Name = kColombieBritannique, Type = String, Dynamic = True, Default = \"Colombie-Britannique", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Colombie-Britannique"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"British Columbia"
	#tag EndConstant

	#tag Constant, Name = kIlePrinceEdouard, Type = String, Dynamic = True, Default = \"\xC3\x8Ele-du-Prince-\xC3\x89douard", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\xC3\x8Ele-du-Prince-\xC3\x89douard"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Prince Edward Island"
	#tag EndConstant

	#tag Constant, Name = kManitoba, Type = String, Dynamic = True, Default = \"Manitoba", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Manitoba"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Manitoba"
	#tag EndConstant

	#tag Constant, Name = kNouveauBrunswick, Type = String, Dynamic = True, Default = \"Nouveau-Brunswick", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouveau-Brunswick"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Brunswick"
	#tag EndConstant

	#tag Constant, Name = kNouvelleEcosse, Type = String, Dynamic = True, Default = \"Nouvelle-\xC3\x89cosse", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelle-\xC3\x89cosse"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Nova Scotia"
	#tag EndConstant

	#tag Constant, Name = kNunavut, Type = String, Dynamic = False, Default = \"Nunavut", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOntario, Type = String, Dynamic = True, Default = \"Ontario", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Ontario"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Ontario"
	#tag EndConstant

	#tag Constant, Name = kQuebec, Type = String, Dynamic = True, Default = \"Qu\xC3\xA9bec", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Qu\xC3\xA9bec"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Quebec"
	#tag EndConstant

	#tag Constant, Name = kSaskatchewan, Type = String, Dynamic = False, Default = \"Saskatchewan", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Saskatchewan"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Saskatchewan"
	#tag EndConstant

	#tag Constant, Name = kTerreNeuveLabrador, Type = String, Dynamic = True, Default = \"Terre-Neuve-et-Labrador", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Terre-Neuve-et-Labrador"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Newfoundland and Labrador"
	#tag EndConstant

	#tag Constant, Name = kTerritoiresDuNordOuest, Type = String, Dynamic = False, Default = \"Territoires du Nord-Ouest", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Northwest Territories"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Territoires du Nord-Ouest"
	#tag EndConstant

	#tag Constant, Name = kYukon, Type = String, Dynamic = False, Default = \"Yukon", Scope = Public
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
End Module
#tag EndModule
