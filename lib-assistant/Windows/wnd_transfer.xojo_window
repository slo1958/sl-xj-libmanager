#tag DesktopWindow
Begin DesktopWindow wnd_transfer
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   800
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   740
   Begin ccProjectPicker ccSourceProject
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   40
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   45
      Transparent     =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopListBox lb_src_libraries
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   12.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   140
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   125
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   14.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Source project"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopLabel Label2
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   14.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Destination project"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   295
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
   End
   Begin ccProjectPicker ccDestinationProject
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   40
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   315
      Transparent     =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopListBox lb_dst_libraries
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   12.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   140
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   395
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel Label3
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Libraries available in source project"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   103
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopLabel Label4
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Libraries discovered in destination project"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   373
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopListBox lb_actions
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "tahoma"
      FontSize        =   12.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   193
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   587
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   574
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel Label5
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "Tahoma"
      FontSize        =   14.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Actions"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   563
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopButton Button1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Proceed"
      Default         =   False
      Enabled         =   True
      FontName        =   "tahoma"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   640
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   760
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel lb_pub_info
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   538
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   700
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  ccSourceProject.Prepare("Select source" _
		  , "Select the projet containing the libraries" _
		  , app.GetConfiguration.XojoFolderBase _
		  , app)
		  
		  lb_src_libraries.ColumnCount = 5
		  
		  lb_src_libraries.HeaderAt(0) = "Discovered libraries"
		  lb_src_libraries.HeaderAt(1) = "Name" 
		  lb_src_libraries.HeaderAt(2) =  "Version"
		  lb_src_libraries.HeaderAt(3) = "Author"
		  lb_src_libraries.HeaderAt(4) = "Transfer"
		  
		  //lb_src_libraries.ColumnTypeAt(4) = DesktopListBox.CellTypes.CheckBox
		  
		  
		  lb_dst_libraries.ColumnCount = 5
		  
		  lb_dst_libraries.HeaderAt(0) = "Discovered libraries"
		  lb_dst_libraries.HeaderAt(1) = "Name" 
		  lb_dst_libraries.HeaderAt(2) =  "Version"
		  lb_dst_libraries.HeaderAt(3) = "Author"
		  lb_dst_libraries.HeaderAt(4) = "Remove"
		  
		  //lb_dst_libraries.ColumnTypeAt(4) = DesktopListBox.CellTypes.CheckBox
		  
		  
		  Return
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckReadyToTransfer()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractDestinationInfo()
		  var res as boolean = ExtractInfo(DestinationProject,  array( _
		  DestinationProject.FindUsedLibraryFolder _
		  , DestinationProject.FindShareableFolder _
		  ), lb_dst_libraries)
		  
		  
		  lb_pub_info.Visible = not res
		  
		  if res then Return
		  
		  lb_pub_info.Text = "Publish means the project also has published libraries, which cannot be deleted here."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractInfo(prj as clXojoProject, libraryHeads() as clXojoProjectSourceLine, lb_out as DesktopListBox) As Boolean
		  
		  // TODO: update to show used libraries instead of published libraries in destination
		  
		  var rowidx as integer
		  var txt as string = ""
		  
		  lb_out.RemoveAllRows
		  
		  for each libraryHead as clXojoProjectSourceLine in libraryHeads
		    var r() as clXojoProjectSourceLine = prj.FindLibraryHeads(libraryHead)
		    
		    
		    for each sourceItem as clXojoProjectSourceLine in r
		      var d as Dictionary = prj.GetAllLibraryInformation(sourceItem.value, libraryHead)
		      
		      lb_out.AddRow("")
		      rowidx = lb_out.LastAddedRowIndex
		      
		      lb_out.RowTagAt(rowidx) = sourceItem
		      
		      lb_out.CellTextAt(rowidx, 0) = sourceItem.value
		      
		      lb_out.CellTextAt(rowidx, 1) = d.Lookup(clXojoLibraryInfo.cstLibraryName, "")
		      lb_out.CellTextAt(rowidx, 2) = d.Lookup(clXojoLibraryInfo.cstLibraryVersion, "")
		      lb_out.CellTextAt(rowidx, 3) = d.Lookup(clXojoLibraryInfo.cstLibraryAuthor, "")
		      
		      if txt = "" then
		        lb_out.CellTypeAt(rowidx, 4) = DesktopListBox.CellTypes.CheckBox
		        
		      else
		        lb_out.CellTextAt(rowidx, 4) = txt
		        
		      end if
		      
		    next
		    
		    txt = "published"
		    
		  next
		  
		  return txt = ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractSourceInfo()
		  
		  call ExtractInfo(SourceProject,   array(SourceProject.FindShareableFolder),   lb_src_libraries)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateActions()
		  
		  lb_actions.RemoveAllRows
		  
		  var lb as DesktopListBox 
		  
		  
		  // Identify libraries to remove
		  
		  lb = lb_dst_libraries
		  
		  self.RemoveFromDestination.RemoveAll
		  
		  
		  for i as integer = 0 to  lb.LastRowIndex
		    var chk as Boolean = lb.CellCheckBoxValueAt(i, 4)
		    var nam as String = lb.CellTextAt(i,0)
		    
		    
		    if chk then 
		      lb_actions.AddRow("Remove " + nam)
		      
		      var head as clXojoProjectSourceLine = clXojoProjectSourceLine(lb.RowTagAt(i))
		      
		      var results() as pair = SourceProject.NavigateSubTree(head, 0)
		      
		      for each p as pair in results
		        var h as clXojoProjectSourceLine = clXojoProjectSourceLine(p.right)
		        
		        self.RemoveFromDestination.Add(h)
		        
		        
		      next
		      
		      
		    end if
		    
		  next
		  
		  
		  // Identify libraries to transfer
		  
		  lb = lb_src_libraries 
		  
		  self.MoveFromSourceToDestination.RemoveAll
		  
		  for i as integer = 0 to  lb.LastRowIndex
		    var chk as Boolean = lb.CellCheckBoxValueAt(i, 4)
		    var nam as String = lb.CellTextAt(i,0)
		    
		    if chk then 
		      lb_actions.AddRow("Transfer " + nam)
		      
		      var head as clXojoProjectSourceLine = clXojoProjectSourceLine(lb.RowTagAt(i))
		      
		      var results() as pair = SourceProject.NavigateSubTree(head, 0)
		      
		      for each p as pair in results
		        var h as clXojoProjectSourceLine = clXojoProjectSourceLine(p.right)
		        
		        self.MoveFromSourceToDestination.Add(h)
		        
		        
		      next
		      
		    end if
		    
		  next
		  
		  
		  
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateDestinationProject()
		  
		  var parentIDInSourceProject as int64 = SourceProject.FindShareableFolder().GetloadedID
		  
		  DestinationProject.AddAssetsForImportedLibraries(true)
		  
		  var res as string = DestinationProject.ImportItems(MoveFromSourceToDestination, parentIDInSourceProject, true)
		  
		  if res = DestinationProject.cstOperationOK then
		    DestinationProject.Save()
		    
		    DestinationProject.ReloadProject()
		    
		  else
		    DestinationProject.ReloadProject()
		    
		  end if
		  
		  lb_actions.RemoveAllRows
		  
		  MoveFromSourceToDestination.RemoveAll
		  
		  ExtractDestinationInfo
		  
		  return
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DestinationProject As clXojoProject = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MoveFromSourceToDestination() As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		RemoveFromDestination() As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceProject As clXojoProject = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events ccSourceProject
	#tag Event
		Sub TargetSelected()
		  SourceProject = ccSourceProject.getSelectedProject()
		  
		  ExtractSourceInfo
		  
		  Return
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClearSelected()
		  SourceProject = nil
		  CheckReadyToTransfer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lb_src_libraries
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  UpdateActions
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccDestinationProject
	#tag Event
		Sub TargetSelected()
		  DestinationProject = ccDestinationProject.getSelectedProject()
		  
		  ExtractDestinationInfo
		  
		  Return
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClearSelected()
		  DestinationProject = nil
		  CheckReadyToTransfer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lb_dst_libraries
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  UpdateActions
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Pressed()
		  if MoveFromSourceToDestination.Count > 0 then updateDestinationProject
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
