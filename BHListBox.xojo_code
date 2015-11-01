#tag Class
Protected Class BHListBox
Inherits ListBox
Implements BHControl
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If AlternateRows And row Mod 2 = 0 then
		    g.ForeColor = AlternateRowColor
		    g.FillRect(0, 0, g.Width, g.Height)
		  End
		  
		  If row < Me.ListCount Then
		    
		    // Check the cell
		    If Not Me.CheckCell(row, column) Then
		      g.ForeColor = ErrorColor
		      g.FillRect(0, 0, g.Width, g.Height)
		    End If
		    
		    RaiseEvent CellContentPaint(g, row, column)
		    
		  End If
		  
		  Return RaiseEvent CellBackgroundPaint(g, row, column)
		End Function
	#tag EndEvent

	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Me.LastRow = row
		  Me.LastColumn = column
		  
		  Return RaiseEvent CellClick(row, column, x, y)
		End Function
	#tag EndEvent

	#tag Event
		Sub CellGotFocus(row as Integer, column as Integer)
		  FocusRow = row
		  FocusColumn = column
		  
		  RaiseEvent CellGotFocus(row, column)
		End Sub
	#tag EndEvent

	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  If Not RaiseEvent CellKeyDown(row, column, key) Then
		    
		    If Asc(key) = 9 Then // TAB
		      
		      Dim pBeginIndex As Integer = column + 1
		      Dim pEndIndex As Integer = Me.ColumnCount - 1
		      Dim pStep As Integer = 1
		      
		      If Keyboard.AsyncShiftKey Then // Shift + TAB
		        pBeginIndex = column - 1
		        pEndIndex = 0
		        pStep = -1
		      End If
		      
		      For pColumn As Integer = pBeginIndex To pEndIndex Step pStep
		        
		        Select Case Me.CellType(row, column)
		          
		        Case BHListBox.TypeEditable, BHListBox.TypeEditableTextArea
		          Me.EditCell(row, pColumn)
		          Return True
		          
		        End Select
		        
		      Next
		      
		    End If
		    
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub CellLostFocus(row as Integer, column as Integer)
		  FocusRow = -1
		  FocusColumn = -1
		  
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
		    if LastCell.y <= Me.LastIndex and Me.CellType(LastCell.y, LastCell.x) = Listbox.TypeEditable then
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
		  If RaiseEvent MouseDown(x, y) Then
		    Return True
		  End If
		  
		  
		  // Manages the BHListBox double click
		  
		  // Maximum delay of 300 ms
		  Dim pCurrentTime As Double = Microseconds()
		  
		  If mLastClickMicroseconds + 300000  >= pCurrentTime Then
		    RaiseEvent ListBoxDoubleClick(x, y)
		  End If
		  
		  mLastClickMicroseconds = pCurrentTime
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  mSelection = SelectedRows()
		  
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddRow(pRowTag As Variant, pItems() As String)
		  Me.AddRow()
		  
		  Me.RowTag(Me.LastIndex) = pRowTag
		  Me.Row(Me.LastIndex, pItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(pRowTag As Variant, ParamArray pItems As String)
		  Me.AddRow(pRowTag, pItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(pRowTag As Variant, pTags() As Variant)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRows(pCount As Integer, pItems() As String)
		  For i As Integer = 1 To pCount
		    AddRow(pItems)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRows(pCount As Integer, ParamArray pItems As String)
		  AddRows(pCount, pItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cell(pRow As Integer, pColumn As Integer, pTag As Variant, pValue As String)
		  Me.CellTag(pRow, pColumn) = pTag
		  Me.Cell(pRow, pColumn) = pValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cell(pRow As Integer, pColumn As String) As String
		  Return Super.Cell(pRow, Me.Columns.IndexOf(pColumn))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cell(pRow As Integer, pColumn As String, Assigns pText As String)
		  Super.Cell(pRow, Me.Columns.IndexOf(pColumn)) = pText
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellActive() As Point
		  // @deprecated use FocusCell instead
		  Return FocusCell
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellItalic(pRow As Integer, pColumn As String) As Boolean
		  Return Super.CellItalic(pRow, Me.Columns.IndexOf(pColumn))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellItalic(pRow As Integer, pColumn As String, Assigns pItalic As Boolean)
		  Super.CellItalic(pRow, Me.Columns.IndexOf(pColumn)) = pItalic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellTag(pRow As Integer, pColumn As Integer, Assigns pTag As Variant)
		  Super.CellTag(pRow, pColumn) = pTag
		  
		  RaiseEvent CellTagChange(pRow, pColumn)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellTag(pRow As Integer, pColumn As String) As Variant
		  Return Me.CellTag(pRow, Me.Columns.IndexOf(pColumn))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellTag(pRow As Integer, pColumn As String, Assigns pTag As Variant)
		  Me.CellTag(pRow, Me.Columns.IndexOf(pColumn)) = pTag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellType(row As Integer, column As Integer) As Integer
		  If Super.CellType(row, column) = BHListBox.TypeDefault Then
		    Return Me.ColumnType(column)
		  End If
		  
		  Return Super.CellType(row, column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Check() As Boolean
		  If Me.NotEmpty And Me.ListCount = 0 Then
		    Return False
		  End If
		  
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If Not Me.CheckRow(pRow) Then
		      Return False
		    End If
		  Next
		  
		  Return Not RaiseEvent Check
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckCell(pRow As Integer, pColumn As Integer) As Boolean
		  Return Not RaiseEvent CheckCell(pRow, pColumn)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckRow(pRow As Integer) As Boolean
		  For pColumn As Integer = 0 To Me.ColumnCount
		    If Not Me.CheckCell(pRow, pColumn) Then
		      Return False
		    End If
		  Next
		  
		  Return Not RaiseEvent CheckRow(pRow)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnAlignment(pColumn As String, Assigns pAlignment As Integer)
		  Me.ColumnAlignment(Me.Columns.IndexOf(pColumn)) = pAlignment
		End Sub
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
		Function ColumnFocusNext(skipZeroSizedColumns as Boolean = true) As Boolean
		  if mCellActive = nil then
		    return false
		  end
		  
		  for column as Integer = (mCellActive.x+1) to (ColumnCount - 1)
		    if skipZeroSizedColumns and Me.ColumnWidth(column) = 0 then
		      continue
		    end
		    
		    if CellType(mCellActive.y, column) = Listbox.TypeEditable then
		      Me.EditCell(mCellActive.y, column)
		      return true
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnFocusPrevious(skipZeroSizedColumns as Boolean = true) As Boolean
		  if mCellActive = nil then
		    return false
		  end
		  
		  for column as Integer = (mCellActive.x-1) DownTo 0
		    if skipZeroSizedColumns and Me.ColumnWidth(column) = 0 then
		      continue
		    end
		    
		    if CellType(mCellActive.y, column) = Listbox.TypeEditable then
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
		  // if column < 0 or column > Me.ColumnCount - 1 then
		  // Raise new OutOfBoundsException()
		  // end if
		  //
		  // dim stringArray() As String= Me.ColumnWidths.ReplaceAll(" ", "").Split(",")
		  // if column > stringArray.Ubound + 1 then
		  // System.Log(System.LogLevelERROR, "Default column size not supported !")
		  // end if
		  // // la valeur a été définie manuellement, on peut la retourner.
		  //
		  // if stringArray(column) = "" then
		  // return 0.0
		  // end if
		  //
		  // return stringArray(column).toDouble
		  
		  Return Me.Column(column).WidthActual
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
		  mRowSelected = -1 //Me.ListIndex  // wtf ?! si tu deletes tout, comment peux-tu avoir un listindex ?!
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRowsWithTag(tag as Variant)
		  for row as Integer = Me.ListCount - 1 downTo 0
		    if Me.RowTag(row) = tag then
		      Me.RemoveRow(row)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditCell(pRow As Integer, pColumn As String)
		  Super.EditCell(pRow, Me.Columns.IndexOf(pColumn))
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
		Sub EmptySelection()
		  // Unselect all selected rows
		  For Each i As Integer In Me.SelectedRows()
		    Me.Selected(i) = False
		  Next
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
		Sub Fill()
		  RaiseEvent Fill()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pTag As Variant) As Integer
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If pTag = Me.RowTag(pRow) Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByColumn(pColumn As Integer, pString As String) As Integer
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If pString = Me.Cell(pRow, pColumn) Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByColumn(pColumn As Integer, pTag As Variant) As Integer
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If pTag = Me.CellTag(pRow, pColumn) Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByRow(pRow As Integer, pString As String) As Integer
		  For pColumn As Integer = 0 To Me.ColumnCount - 1
		    If pString = Me.Cell(pRow, pColumn) Then
		      Return pColumn
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByRow(pRow As Integer, pTag As Variant) As Integer
		  For pColumn As Integer = 0 To Me.ColumnCount - 1
		    If pTag = Me.CellTag(pRow, pColumn) Then
		      Return pColumn
		    End If
		  Next
		  
		  Return -1
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
		Sub InsertRow(pRow As Integer, pRowTag As Variant, pItems() As String)
		  Super.InsertRow(pRow, "")
		  
		  Me.RowTag(pRow) = pRowTag
		  Me.Row(Me.LastIndex, pItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(pRow As Integer, pRowTag As Variant, ParamArray pItems As String)
		  Me.InsertRow(pRow, pRowTag, pItems)
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

	#tag Method, Flags = &h0
		Sub PadRows(pCount As Integer, ParamArray pItems As String)
		  If pCount > Me.ListCount Then
		    AddRows(pCount - Me.ListCount, pItems)
		  End If
		End Sub
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
		Sub RemoveRow()
		  Me.RemoveRow(Me.ListIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRows(pFrom As Integer, pTo As Integer)
		  // Remove rows from pFrom to pTo inclusively
		  
		  For pRow As Integer = pTo DownTo pFrom
		    Me.RemoveRow(pRow)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRowsFrom(pFrom As Integer)
		  Me.RemoveRows(pFrom, Me.ListCount - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRowsTo(pTo As Integer)
		  Me.RemoveRows(0, pTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Row(pRow As Integer) As String()
		  Dim pValues() As String
		  
		  For pColumn As Integer = 0 To Me.ColumnCount - 1
		    pValues.Append(Me.Cell(pRow, pColumn))
		  Next
		  
		  Return pValues
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(pRow As Integer, pValues() As String)
		  For pColumn As Integer = 0 To pValues.UBound
		    Me.Cell(pRow, pColumn) = pValues(pColumn)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(pRow As Integer, ParamArray pValues As String)
		  Me.Row(pRow, pValues)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(pRow As Integer, pTags() As Variant)
		  For pColumn As Integer = 0 To pTags.UBound
		    Me.CellTag(pRow, pColumn) = pTags(pColumn)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowBold(pRow As Integer, Assigns pBold As Boolean)
		  For pColumn As Integer = 0 To Me.ColumnCount
		    Me.CellBold(pRow, pColumn) = pBold
		  Next
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
		    if CellType(row, mCellActive.x) = Listbox.TypeEditable then
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
		    if CellType(row, mCellActive.x) = Listbox.TypeEditable then
		      Me.EditCell(row, mCellActive.x)
		      return true
		    end
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag() As Variant
		  Return Super.RowTag(Me.ListIndex)  // FIXME #7964
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowTag(Assigns pTag As Variant)
		  Super.RowTag(Me.ListIndex) = pTag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowType(pRow As Integer, Assigns pCellType As Integer)
		  // Change cell type for the row
		  For pColumn As Integer = 0 To Me.ColumnCount - 1
		    Me.CellType(pRow, pColumn) = pCellType
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRows() As Integer()
		  // Retourne une liste de row sélectionnées
		  
		  dim pSelectedRows() as integer
		  
		  // Aucune ligne de sélectionnées
		  if Me.ListIndex < 0 then
		    return pSelectedRows
		  end
		  
		  // Une seule ligne de sélectionnée
		  if SelectionType = SelectionSingle then
		    return Array(Me.ListIndex)
		  end
		  
		  // Plusieurs lignes de sélectionnées, ListIndex possède la plus petite
		  // ligne sélectionnes
		  For i as integer = Me.ListIndex To Me.ListCount - 1  //Indexes are zero-based
		    if Me.Selected(i) then
		      pSelectedRows.Append(i)  //This row is selected
		    end if
		  Next
		  
		  return pSelectedRows
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectRowTag(pValue As Variant)
		  // Selects the MenuItem that contains pValue as its rowtag
		  Dim pIndex As Integer = 0
		  For pRow As Integer = 0 To Me.ListCount - 1
		    If Me.RowTag(pRow) = pValue Then
		      pIndex = pRow
		    End If
		  Next
		  // If the selected index doesn't exist, the first row will be selected
		  Me.ListIndex = pIndex
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
		Sub Type(Assigns pType As Integer)
		  // Set the type of all columns
		  
		  For pColumn As Integer = 0 To Me.ColumnCount - 1
		    Me.ColumnType(pColumn) = pType
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UncheckAll(column as Integer)
		  for row as Integer = 0 to Me.LastIndex
		    Me.CellCheck(row, column) = false
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleRowCount() As Integer
		  // Returns the number of visible rows
		  Return Ceil(Me.Height / Me.RowHeight)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XMLValue(pXmlDocument As XmlDocument) As XmlNode
		  // Converts a listbox to an XML document
		  
		  Dim pXmlNode As XmlNode = pXmlDocument.CreateElement("list")
		  
		  Dim node As XmlNode
		  Dim pDate as new Date()
		  
		  // Headers (columns with a width < 0px are hidden)
		  For pIndex As Integer = 0 To Me.ColumnCount - 1
		    If Me.Column(pIndex).WidthActual > 0 Then
		      node = pXmlNode.AppendChild(pXmlDocument.CreateElement("header"))
		      node.AppendChild(pXmlDocument.CreateTextNode(Me.Heading(pIndex)))
		    End If
		  Next
		  
		  // Content
		  For pRow As Integer = 0 To Me.ListCount - 1
		    node = pXmlNode.AppendChild(pXmlDocument.CreateElement("row"))
		    
		    Dim pColumnIndex As Integer = 0
		    For Each pField As String In Me.Columns
		      If Me.Column(pColumnIndex).WidthActual > 0 Then
		        node.SetAttribute(pField, Me.Cell(pRow, pColumnIndex))
		      End If
		      pColumnIndex = pColumnIndex + 1
		    Next
		  Next
		  
		  Return pXmlNode
		End Function
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
		Event CellTagChange(pRow As Integer, pColumn As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Check() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CheckCell(pRow As Integer, pColumn As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CheckRow(pRow As Integer) As Boolean
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
		Event Fill()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ListBoxDoubleClick(x As Integer, y As Integer)
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


	#tag Note, Name = Documentation
		
		Browseable : Définit si une liste peut être parcourue par la touche TAB. Désactivé par défaut.
	#tag EndNote

	#tag Note, Name = Untitled
	#tag EndNote


	#tag Property, Flags = &h0
		AlternateRowColor As Color = &cedf3fe
	#tag EndProperty

	#tag Property, Flags = &h0
		AlternateRows As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Browseable As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Columns() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorColor As Color = &cFFC3B7
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return New Point(Me.FocusColumn, Me.FocusRow)
			End Get
		#tag EndGetter
		FocusCell As Point
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		FocusColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		FocusRow As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return New Point(Me.LastColumn, Me.LastRow)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.LastColumn = value.x
			  Me.LastRow = value.y
			End Set
		#tag EndSetter
		LastCell As Point
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LastColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		LastRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCellActive As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnSortType() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mIgnoreChanges As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastClickMicroseconds As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastKey As String
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

	#tag Property, Flags = &h0
		NotEmpty As Boolean
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


	#tag Constant, Name = CellCheckWidth, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SortTypeNatural, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SortTypeNumeric, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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
			Name="LastColumn"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastRow"
			Group="Behavior"
			InitialValue="-1"
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
