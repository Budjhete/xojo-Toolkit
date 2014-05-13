#tag Class
Protected Class BHList
Inherits ListBox
Implements BHControl
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if not RaiseEvent CellBackgroundPaint(g, row, column) then
		    if AlternateRows and row mod 2 = 0 then
		      g.ForeColor = &cedf3fe
		      g.FillRect(0, 0, g.Width, g.Height)
		      
		      
		    else
		      g.ForeColor = &cffffff
		      g.FillRect(0, 0, g.Width, g.Height)
		      
		    end
		    
		    if WarningOnEmpty and self.CountNotEmptyRow = 0 and row = 0 and Me.Enabled then
		      if Warning then
		        g.ForeColor =  WarningColor
		        g.FillRect(0, 0, g.Width, g.Height)
		      elseif Error then
		        g.ForeColor = ErrorColor
		        g.FillRect(0, 0, g.Width, g.Height)
		      end if
		    end
		  end
		  
		  if Selected(row) then
		    if Me.HaveFocus then
		      g.ForeColor = &c4b73de
		    else
		      g.ForeColor = &cd0d0d0
		    end
		    
		    g.FillRect(0, 0, g.Width, g.Height)
		  end
		  
		  if row < Me.ListCount then
		    RaiseEvent CellContentPaint(g, row, column)
		  end
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  'if y <> mRowSelected and RaiseEvent CancelChange() then
		  'return true
		  'end
		  
		  if not ReadOnly then
		    LastCell = new Point(column, row)
		    return RaiseEvent CellClick(row, column, x, y)
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub CellGotFocus(row as Integer, column as Integer)
		  mCellActive = new Point(column, row)
		  
		  RaiseEvent CellGotFocus(row, column)
		End Sub
	#tag EndEvent

	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  if Browseable and asc(key) = Keys.TAB then
		    if Keyboard.AsyncShiftKey and column > 0 then
		      RaiseEvent CellDoubleClick(row, column - 1)
		    elseif column < Me.ColumnCount then
		      RaiseEvent CellDoubleClick(row, column + 1)
		    end if
		  end if
		  
		  return RaiseEvent CellKeyDown(row, column, key)
		End Function
	#tag EndEvent

	#tag Event
		Sub CellLostFocus(row as Integer, column as Integer)
		  mCellActive = nil
		  RaiseEvent CellLostFocus(row, column)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Change()
		  mRowSelected = Me.ListIndex
		  
		  
		  if not mIgnoreChanges then
		    RaiseEvent Change()
		  end
		  
		  RefreshDisplay()
		  
		  
		  //
		  // On vérifie si la sélection a été modifiée
		  //
		  dim selection() as Integer = SelectedRows()
		  
		  if mSelectionRefresh <= 0 then
		    // mSelectionRefresh est à true si on sait que la sélection est changée, mais que
		    // les lignes sélectionnées n'ont pas réellement été modifiées (eg. lors du
		    // tri d'une colonne)
		    dim hasSelectionChanged as Boolean = false
		    
		    if selection.Ubound = mSelection.Ubound then
		      // Même nombre d'éléments, on vérifie s'ils sont tous identiques.
		      // On suppose que SelectedRows() retourne les lignes sélectionnées
		      // en ordre croissant des indexes
		      for i as Integer = 0 to mSelection.Ubound
		        if selection(i) <> mSelection(i) then
		          hasSelectionChanged = true // L'index i est changé
		          exit for
		        end
		      next
		    else
		      // On a un nombre différent de lignes sélectionnées
		      hasSelectionChanged = true
		    end
		    
		    
		    //
		    // La sélection a été modifiée
		    //
		    if hasSelectionChanged then
		      mSelection = selection
		      RaiseEvent SelectionChange()
		      
		      if ListIndex < 0 then
		        RaiseEvent SelectionEmpty()
		      end
		    end
		  else
		    // mSelectionRefresh = true
		    mSelection = selection
		    mSelectionRefresh = mSelectionRefresh - 1
		  end
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if RaiseEvent CompareRows(row1, row2, column, result) then
		    return true
		  end
		  
		  
		  dim sort_type as Integer = ColumnSortType(column)
		  
		  if sort_type = SortTypeNumeric then
		    
		    //
		    // Gestion du tri numéric
		    //
		    dim number1 as Double = Val(Me.Cell(row1,column))
		    dim number2 as Double = Val(Me.cell(row2,column))
		    
		    If number1 > number2 then
		      result = 1
		    elseif number1 < number2 then
		      result = -1
		    else
		      result = 0
		    end if
		    
		    return true
		    
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub DoubleClick()
		  if LastCell <> nil then
		    if LastCell.y <= Me.LastIndex and Me.CellRealType(LastCell.y, LastCell.x) = Listbox.TypeEditable then
		      Me.EditCell(LastCell.y, LastCell.x)
		    end
		    
		    RaiseEvent CellDoubleClick(LastCell.y, LastCell.x)
		  end
		  
		  RaiseEvent DoubleClick()
		End Sub
	#tag EndEvent

	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  if not RaiseEvent DragReorderRows(newPosition, parentRow) then
		    mSelectionRefresh = 2
		  end
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  if RaiseEvent MouseDown(x, y) then
		    return true
		  end
		  
		  
		  if y > HeaderHeight then
		    dim row as Integer = RowFromXY(x, y)
		    
		    if (row <> mRowSelected or mRowSelected < 0) and RaiseEvent CancelChange() then
		      return true
		    end
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  mSelection = SelectedRows()
		  
		  RaiseEvent Open()
		End Sub
	#tag EndEvent

	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  // if not RaiseEvent SortColumn(column) then
		  // mSelectionRefresh = 1
		  // end
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function Untitled1() As Boolean Handles Untitled1.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function CellActive() As Point
		  Return mCellActive
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellRealType(row as Integer, column as Integer) As Integer
		  dim type as Integer = Me.CellType(row, column)
		  if type = 0 then
		    return Me.ColumnType(column)
		  end
		  
		  return type
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnCount(column as Integer) As Integer
		  dim value as Integer = 0
		  
		  for row as Integer = 0 to ListCount-1
		    if Cell(row, column) <> "" then
		      value = value + 1
		    end
		  next
		  
		  return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnFocusNext() As Boolean
		  if mCellActive = nil then
		    return false
		  end
		  
		  for column as Integer = (mCellActive.x+1) to (ColumnCount - 1)
		    if CellRealType(mCellActive.y, column) = Listbox.TypeEditable then
		      Me.EditCell(mCellActive.y, column)
		      return true
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnFocusPrevious() As Boolean
		  if mCellActive = nil then
		    return false
		  end
		  
		  for column as Integer = (mCellActive.x-1) DownTo 0
		    if CellRealType(mCellActive.y, column) = Listbox.TypeEditable then
		      Me.EditCell(mCellActive.y, column)
		      return true
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnResized(column as Integer)
		  LogToDesktop("Column "+Str(column)+" resized")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnSortType(column as Integer) As Integer
		  if column < 0 then
		    Raise new OutOfBoundsException
		  end
		  
		  if column <= mColumnSortType.Ubound then
		    return mColumnSortType(column)
		  end
		  
		  return SortTypeNatural
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnSortType(column as Integer, Assigns sort_type as Integer)
		  if column < 0 then
		    Raise new OutOfBoundsException
		  end
		  
		  while mColumnSortType.Ubound < column
		    mColumnSortType.Append(SortTypeNatural)
		  wend
		  
		  mColumnSortType(column) = sort_type
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnSum(column as Double) As Double
		  dim value as Double = 0
		  
		  for row as Integer = 0 to ListCount-1
		    value = value + Val(Cell(row, column))
		  next
		  
		  return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnWidth(column As Integer = 0) As Double
		  if column < 0 or column > Me.ColumnCount - 1 then
		    Raise new OutOfBoundsException()
		  end if
		  
		  dim stringArray() As String= Me.ColumnWidths.ReplaceAll(" ", "").Split(",")
		  if column > stringArray.Ubound + 1 then
		    System.Log(System.LogLevelERROR, "Default column size not supported !")
		  end if
		  // la valeur a été définie manuellement, on peut la retourner.
		  
		  if stringArray(column) = "" then
		    return 0.0
		  end if
		  
		  return stringArray(column).toDouble
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountNotEmptyRow() As Integer
		  dim count As Integer = 0
		  for row as Integer = 0 to Me.ListCount() - 1
		    
		    for column as Integer = 0 to Me.ColumnCount - 1
		      
		      if(Cell(row, column) <> "") then
		        count = count + 1
		        exit
		      end if
		      
		    next column
		    
		  next row
		  
		  return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentCell(column as Integer = 0) As String
		  if Me.ListIndex < 0 then
		    return ""
		  end
		  
		  return Me.Cell(Me.ListIndex, column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CurrentCell(column as Integer = 0, Assigns value as String)
		  if Me.ListIndex < 0 then
		    return
		  end
		  
		  Me.Cell(Me.ListIndex, column) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  Super.DeleteAllRows()
		  mRowSelected = Me.ListIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRowsWithTag(tag as Variant)
		  for row as Integer = Me.ListCount-1 downTo 0
		    if Me.RowTag(row) = tag then
		      Me.RemoveRow(row)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditCurrentCell(column as Integer = 0)
		  if Me.ListIndex < 0 then
		    return
		  end
		  
		  Me.EditCell(Me.ListIndex, column)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Export() As Dictionary
		  dim dict as new Dictionary
		  
		  for i as Integer = 1 to Me.ListCount
		    for j as Integer = 1 to Me.ColumnCount
		      dict.Value(str(i) + "," + str(j)) = Me.Cell(i - 1, j - 1)
		    next
		  next
		  
		  return dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FirstRowForTag(tag as Variant) As Integer
		  // Retourne la première ligne correspondant au tag spécifié
		  for row as Integer = 0 to Me.ListCount-1
		    if Me.RowTag(row) = tag then
		      return row
		    end
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContent() As Variant
		  // Part of the BHControl interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HaveSelection() As Boolean
		  // Retourne si le listbox a un objet de sélectionné
		  return (Me.ListIndex >= 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Import(dict as Dictionary)
		  ' A utiliser exclusivement après une exportation avec la méthode export.
		  
		  for each key as Variant in dict.Keys
		    dim strKey() as String = key.StringValue.Split(",")
		    if Me.ListCount < strKey(0).toInt then
		      Me.AddRow
		    end if
		    Me.Cell(strKey(0).toInt - 1, strKey(1).toInt - 1) = dict.Value(key.StringValue)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(row As Integer, items() As String)
		  Super.InsertRow(row, "")
		  
		  for column as Integer = 0 to items.Ubound
		    Cell(LastIndex, column) = items(column)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(row As Integer, ParamArray items As String)
		  InsertRow(row, items)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(row As Integer, item As String, indent as Integer)
		  Super.InsertRow(row, item, indent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateRow(row as Integer)
		  for column as Integer = 0 to (Me.ColumnCount-1)
		    InvalidateCell(row, column)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEditing() As Boolean
		  Return mCellActive <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RefreshDisplay()
		  // Check CellBackgroundPaint for warning color and stuff
		  InvalidateRow(0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshSorting()
		  Sort()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCurrentRow()
		  if Me.ListIndex >= 0 then
		    Me.RemoveRow(Me.ListIndex)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveEmptyRows(column as Integer = - 1)
		  if column >= 0 then
		    
		    for row as Integer = (Me.ListCount-1) DownTo 0
		      if Me.Cell(row, column) = "" then
		        Me.RemoveRow(row)
		      end
		    next
		    
		  else
		    
		    for row as Integer = (Me.ListCount-1) DownTo 0
		      dim estEmpty as Boolean = true
		      
		      for column = 0 to (Me.ColumnCount-1)
		        estEmpty = (estEmpty and Me.Cell(row, column) <> "")
		      next
		      
		      if estEmpty then
		        Me.RemoveRow(row)
		      end
		    next
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(Index As Integer)
		  dim rowToRemove As Integer = index
		  
		  Super.RemoveRow(index)
		  
		  if rowToRemove > 0 then
		    Me.ListIndex = rowToRemove - 1
		  elseif rowToRemove = 0 and Me.ListCount > 0 then
		    Me.ListIndex = rowToRemove
		  end if
		  
		  RefreshDisplay()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowExists(row as Integer) As Boolean
		  return row >= 0 and row < Me.ListCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowFocusNext() As Boolean
		  if mCellActive = nil then
		    return false
		  end
		  
		  for row as Integer = (mCellActive.y+1) to Me.LastIndex
		    if CellRealType(row, mCellActive.x) = Listbox.TypeEditable then
		      Me.EditCell(row, mCellActive.x)
		      return true
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowFocusPrevious() As Boolean
		  if mCellActive = nil then
		    return false
		  end
		  
		  for row as Integer = (mCellActive.y+1) downto 0
		    if CellRealType(row, mCellActive.x) = Listbox.TypeEditable then
		      Me.EditCell(row, mCellActive.x)
		      return true
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag() As Variant
		  // Retourne le row tag pour la ligne sélectionnée, nil sinon
		  if not Me.HaveSelection() then
		    return nil
		  end
		  
		  return Me.RowTag(Me.ListIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRows() As Integer()
		  dim rows() as integer
		  
		  // Aucune ligne de sélectionnées
		  if Me.ListIndex < 0 then
		    return rows
		  end
		  
		  // Une seule ligne de sélectionnée
		  if SelectionType = SelectionSingle then
		    return Array(Me.ListIndex)
		  end
		  
		  // Plusieurs lignes de sélectionnées, ListIndex possède la plus petite
		  // ligne sélectionnes
		  For i as integer = Me.ListIndex to Me.ListCount - 1  //Indexes are zero-based
		    if Me.Selected(i) then
		      rows.Append(i)  //This row is selected
		    end if
		  Next
		  
		  return rows
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetContent(value As Variant)
		  // Part of the BHControl interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetListIndexSilently(index as Integer)
		  mIgnoreChanges = true
		  Me.ListIndex = index
		  mIgnoreChanges = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UncheckAll(column as Integer)
		  for row as Integer = 0 to Me.LastIndex
		    Me.CellCheck(row, column) = false
		  next
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CancelChange() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellBackgroundPaint(g as Graphics, row as Integer, column as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellContentPaint(g as Graphics, row as Integer, column as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellDoubleClick(row as Integer, column as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellGotFocus(row as Integer, column as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellKeyDown(row As Integer, column As Integer, key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellLostFocus(row as Integer, column as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClick()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionEmpty()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SortColumn(column as Integer) As Boolean
	#tag EndHook


	#tag Note, Name = Documentation
		
		Browseable : Définit si une liste peut être parcourue par la touche TAB. Désactivé par défaut.
	#tag EndNote


	#tag Property, Flags = &h0
		AlternateRows As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Browseable As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Error As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mErrorColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mErrorColor = value
			  RefreshDisplay()
			End Set
		#tag EndSetter
		ErrorColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mErrorDarkColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mErrorDarkColor = value
			  RefreshDisplay()
			End Set
		#tag EndSetter
		ErrorDarkColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LastCell As Point = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellActive As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnSortType() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mErrorColor As Color = &cFFC3B7
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mErrorDarkColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIgnoreChanges As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		mLastKnownColumnWidths() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadOnly As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowSelected As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelection() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionRefresh As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWarningColor As Color = &cFFFBB7
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWarningDarkColor As Color = &cFFF85D
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mReadOnly
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mReadOnly = value
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRowSelected
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.ListIndex = value
			  mRowSelected = value
			End Set
		#tag EndSetter
		RowSelected As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SaveState As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Warning As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mWarningColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWarningColor = value
			  RefreshDisplay()
			End Set
		#tag EndSetter
		WarningColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mWarningDarkColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWarningDarkColor = value
			  RefreshDisplay()
			End Set
		#tag EndSetter
		WarningDarkColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		WarningOnEmpty As Boolean = False
	#tag EndProperty


	#tag Constant, Name = SortTypeNatural, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SortTypeNumeric, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Untitled, Type = , Dynamic = False, Default = \"", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
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
			Name="Error"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorDarkColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
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
			Name="Warning"
			Visible=true
			Group="Validation"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WarningColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WarningDarkColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WarningOnEmpty"
			Visible=true
			Group="Validation"
			InitialValue="False"
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
