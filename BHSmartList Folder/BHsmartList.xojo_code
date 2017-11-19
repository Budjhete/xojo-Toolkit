#tag Class
Protected Class BHsmartList
Inherits BHListBox
	#tag Event
		Function CellBackgroundPaint(g as Graphics, row as Integer, column as Integer) As Boolean
		  if row < Me.ListCount then
		    
		    if me.RowIsFolder(row) then
		      g.ForeColor = GroupRowColor
		      g.FillRect(0, 0, g.Width, g.Height)
		      
		    elseif BHSmartListModel(me.RowTag(row)).type = RowType.Section then
		      g.ForeColor = SectionRowColor
		      g.FillRect(0, 0, g.Width, g.Height)
		    end if
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Me.LastRow = row
		  Me.LastColumn = column
		  
		  If BHSmartListModel(RowTag(row)).isEditable Then  
		    
		    me.CellType(row, column) = Listbox.TypeEditable
		    
		  End If
		  RaiseEvent CellClick(row, column, x, y)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Dim m as BHSmartListModel = RowTag(row)
		  Dim Type As RowType = m.type
		  
		  If Type = RowType.Section Then
		    g.Bold = SectionTextBold
		    g.ForeColor = SectionTextColor
		    g.DrawString(Cell(row, column), 0, g.Height - (g.TextHeight/2))
		    Return True
		  elseif Type = RowType.Item then
		    g.Italic = ItemTextItalic
		    g.ForeColor = ItemTextColor
		    g.DrawString(Cell(row, column), 0, g.Height - (g.TextHeight/2))
		    Return true
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub DoubleClick()
		  'if lastrow <= Me.ListCount -1 and BHSmartListModel(RowTag(lastrow)).isEditable then
		  'Me.EditCell(lastrow, lastcolumn)
		  'end
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  If Me.RowIsFolder(row) and CellTag(row, 0) <> nil Then
		    dim s() as BHSmartListModel = CellTag(row, 0)
		    Me.AddItem(s)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  dim searchDir As integer  //init direction to search
		  
		  Select Case Asc(Key)
		  Case 30 //up
		    searchDir = -1
		  Case 31 //down
		    searchDir = 1
		  Else
		    return false //or true to prevent beeps
		  End Select
		  
		  dim searchIdx As integer  //init index to start searching at
		  
		  if me.ListIndex >= 0 then
		    searchIdx = me.ListIndex + searchDir
		  else  //no selection, start at top or bottom
		    searchIdx = if (searchDir=1, 0, me.ListCount-1)
		  end
		  
		  do  //look for available row
		    if searchIdx < 0 or searchIdx >= me.ListCount then
		      me.ListIndex = -1  //handle reached end of search
		      exit
		    end
		    if not me.RowIsFolder(searchIdx) then
		      me.ListIndex = searchIdx //found new row
		      exit
		    end
		    searchIdx = searchIdx + searchDir //step
		  loop
		  
		  //handled
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AcceptTextDrop
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddGroup(group  as BHSmartListModel, items() as BHSmartListModel)
		  AddFolder(group.title)
		  RowPicture(LastIndex) = group.icon
		  RowTag(LastIndex) = group
		  CellTag(LastIndex,0) = items
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddGroup(group  as BHSmartListModel, icon as picture, items() as BHSmartListModel)
		  AddFolder(group.title)
		  RowPicture(LastIndex) = icon
		  RowTag(LastIndex) = group
		  CellTag(LastIndex,0) = items
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(items() as BHSmartListModel)
		  for each d as BHSmartListModel in items()
		    if d.type = RowType.Section then
		      
		    elseif d.type = RowType.Group then
		      AddGroup(d, d.tag)
		      
		    elseif d.type = RowType.SmartFolder then
		      AddSmartFolder(d, d.tag)
		      
		    elseif d.type = RowType.Item then
		      AddRow(d.title)
		      if d.icon <> Nil then RowPicture(0) = d.icon
		      RowTag(LastIndex) = d
		      CellTag(LastIndex, 0) = d.tag
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(items as BHSmartListModel)
		  if items.type = RowType.Section then
		    
		  elseif items.type = RowType.Group then
		    AddGroup(items, items.tag)
		    
		  elseif items.type = RowType.SmartFolder then
		    AddSmartFolder(items, items.tag)
		    
		  elseif items.type = RowType.Item then
		    AddRow(items.title)
		    if items.icon <> Nil then RowPicture(0) = items.icon
		    RowTag(LastIndex) = items
		    CellTag(LastIndex, 0) = items.tag
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(itemName() as Dictionary)
		  for each d as Dictionary in itemName()
		    if d.HasKey(RowType.Section) then
		      
		      if d.Value(RowType.Section).IsArray then
		        Dim s() as string = d.Value(RowType.Section)
		        AddRow(s)
		      else
		        
		      end if
		      
		    elseif d.HasKey(RowType.Item) then
		      
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(itemName() as string)
		  for each s as string in itemName
		    AddRow(s)
		    RowTag(LastIndex) = RowType.Item
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSection(section as BHSmartlistModel, icon as picture)
		  AddRow(section.title)
		  RowPicture(LastIndex) = icon
		  RowTag(LastIndex) = section
		  //CellTag(LastIndex,0) = items
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSmartFolder(Folder as BHSmartListModel, items() as BHSmartListModel)
		  AddFolder(Folder.title)
		  RowTag(LastIndex) = Folder
		  CellTag(LastIndex,0) = items
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertItem(item as BHSmartListModel)
		  dim t() as BHSmartListModel
		  if RowIsFolder(ListIndex) then
		    t = CellTag(ListIndex, 0)
		  end if
		  
		  t.Append(item)
		  
		  InsertRow(me.ListIndex + 1, item.title, me.RowDepth(me.ListIndex)+1)
		  
		  if item.icon <> Nil then RowPicture(0) = item.icon
		  RowTag(LastIndex) = item
		  CellTag(LastIndex, 0) = item.tag
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CellClick(row as integer, column as integer, x as integer, y as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		GroupRowColor As Color = &cEEEEEE
	#tag EndProperty

	#tag Property, Flags = &h0
		GroupTextColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemRowColor As color = &cEFEFEF
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemTextColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemTextItalic As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionRowColor As color = &cEEEEEE
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionTextBold As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionTextColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		SectionTextSize As Integer = 12
	#tag EndProperty


	#tag Enum, Name = RowType, Type = Integer, Flags = &h0
		Section
		  Item
		  Group
		  SmartFolder
		Menu
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlternateRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cedf3fe"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlternateRows"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
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
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Browseable"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
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
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFC3B7"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FocusColumn"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FocusRow"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cEEEEEE"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupTextColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
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
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
			Group="Position"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cDDDDDD"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemTextColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemTextItalic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastcolumn"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastrow"
			Group="Behavior"
			Type="Integer"
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
			Name="mIgnoreChanges"
			Group="Behavior"
			InitialValue="false"
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
			Name="NotEmpty"
			Visible=true
			Group="Validation"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSelected"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SaveState"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cEEEEEE"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionTextBold"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionTextColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionTextSize"
			Visible=true
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"10 - 10"
				"11 - 11"
				"12 - 12"
				"14 - 14"
				"16 - 16"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
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
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
