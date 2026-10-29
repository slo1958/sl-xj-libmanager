#tag DesktopWindow
Begin DesktopWindow Window1 Implements itfShareProgress
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
   Height          =   700
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   71530495
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   640
   Begin DesktopLabel Label2
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "If the project is open in the IDE, make sure you save all changes before proceeding."
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   527
   End
   Begin DesktopListBox lb_logs
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
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   135
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
      Top             =   545
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   600
      _ScrollWidth    =   -1
   End
   Begin ccProjectPicker ccTargetProject
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   97
      Transparent     =   False
      Visible         =   True
      Width           =   600
   End
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   336
      Transparent     =   False
      Visible         =   True
      Width           =   600
   End
   Begin DesktopListBox lb_librariesInSource
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
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   138
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
      Top             =   388
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopListBox lb_librariesInTarget
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
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   138
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
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   149
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel Label3
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "User Project"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   137
   End
   Begin DesktopLabel Label4
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Library source"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   306
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   137
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  
		  ccSourceProject.Prepare("Select source", "Select the projet containing the libraries", clXojoProject.UsedAs.LibrarySource, self)
		  ccTargetProject.Prepare("Select target", "Select the target project", clXojoProject.UsedAs.Destination, self)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ShareStatus(MsgTime as string, MsgText as string)
		  lb_logs.ColumnCount = 2
		  
		  lb_logs.AddRow(MsgTime)
		  lb_logs.CellTextAt(lb_logs.LastAddedRowIndex,1) = MsgText
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowExtraInfo(dct as Dictionary)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowLibraryInfo(OutputListBox as DesktopListBox, project as clXojoProject)
		  
		  if project = nil then Return
		  
		  var m as FolderItem = project.ProjFolderItem
		  var cc() as clXojoLibraryInfo = project.LibraryInformation
		  
		  
		  OutputListBox.RemoveAllRows
		  OutputListBox.ColumnCount = 6
		  OutputListBox.HasHeader = true
		  
		  const ProjectColumn as integer = 1
		  const ProjectIdColumn as integer = 2
		  const ProjectNameColumn as integer  = 3
		  const ProjectAuthorColumn  as integer  = 4
		  const ProjectVersionColumn as integer  = 5 
		  
		  OutputListBox.HeaderAt(0) = "Select" 
		  OutputListBox.HeaderAt(ProjectColumn) = "Project" 
		  OutputListBox.HeaderAt(ProjectIdColumn) =  "ID"
		  OutputListBox.HeaderAt( ProjectNameColumn) = "Name"
		  OutputListBox.HeaderAt( ProjectAuthorColumn) = "Auhtor"
		  OutputListBox.HeaderAt( ProjectVersionColumn) = "Version"
		  
		  OutputListBox.ColumnTypeAt(0) = DesktopListBox.CellTypes.CheckBox
		  
		  for each c as clXojoLibraryInfo in cc
		    OutputListBox.AddRow("")
		    
		    OutputListBox.CellTextAt(OutputListBox.LastAddedRowIndex, ProjectColumn) = c.projName
		    OutputListBox.CellTextAt(OutputListBox.LastAddedRowIndex, ProjectIdColumn) = c.Path
		    OutputListBox.CellTextAt(OutputListBox.LastAddedRowIndex, ProjectNameColumn) = c.name
		    OutputListBox.CellTextAt(OutputListBox.LastAddedRowIndex, ProjectAuthorColumn) = c.Author
		    OutputListBox.CellTextAt(OutputListBox.LastAddedRowIndex, ProjectVersionColumn) = c.Version
		    
		    OutputListBox.RowTagAt(OutputListBox.LastAddedRowIndex) =c.ProjectAttributes
		    
		  next
		  
		  
		  return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SourceProject() As clXojoProject
		  
		  Return ccSourceProject.selectedProject
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TargetProject() As clXojoProject
		  
		  Return ccSourceProject.selectedProject
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events ccTargetProject
	#tag Event
		Sub TargetSelected()
		  
		  if ccTargetProject.selectedProject = nil then Return
		  
		  ShowLibraryInfo(lb_librariesInTarget, ccTargetProject.selectedProject )
		  
		  return
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClearSelected()
		  lb_librariesInTarget.RemoveAllRows
		  Return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccSourceProject
	#tag Event
		Sub TargetSelected()
		  
		  if ccSourceProject.selectedProject = nil then Return
		  
		  ShowLibraryInfo(lb_librariesInSource, ccSourceProject.selectedProject )
		  
		  return
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClearSelected()
		  lb_librariesInSource.RemoveAllRows
		  Return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lb_librariesInSource
	#tag Event
		Sub SelectionChanged()
		  
		  var currow as integer = me.SelectedRowIndex
		  
		  if currow < 0 then 
		    ShowExtraInfo(nil)
		    Return
		    
		  end if
		  
		  if currow > me.LastRowIndex then 
		    ShowExtraInfo(nil)
		    Return
		    
		  end if
		  
		  var r as variant = me.RowTagAt(currow)
		  
		  if r isa Dictionary then 
		    ShowExtraInfo(Dictionary(r))
		    
		  else
		    ShowExtraInfo(nil)
		    
		  end if
		  
		  return
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lb_librariesInTarget
	#tag Event
		Sub SelectionChanged()
		  
		  var currow as integer = me.SelectedRowIndex
		  
		  if currow < 0 then 
		    ShowExtraInfo(nil)
		    Return
		    
		  end if
		  
		  if currow > me.LastRowIndex then 
		    ShowExtraInfo(nil)
		    Return
		    
		  end if
		  
		  var r as variant = me.RowTagAt(currow)
		  
		  if r isa Dictionary then 
		    ShowExtraInfo(Dictionary(r))
		    
		  else
		    ShowExtraInfo(nil)
		    
		  end if
		  
		  return
		  
		  
		  
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
