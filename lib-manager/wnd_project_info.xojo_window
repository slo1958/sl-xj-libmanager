#tag DesktopWindow
Begin DesktopWindow wnd_project_info
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
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Libraries found in project"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin DesktopListBox ListBox1
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
      Height          =   240
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   270
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel Label1
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopListBox ListBox2
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
      Height          =   240
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   319
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   261
      _ScrollWidth    =   -1
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function Analyze() As clXojoProject
		  
		  if not IsExistingFolder(self.MainFolderItem) then return nil
		  
		  var c as new clXojoProject(MainFolderItem, clXojoProject.UsedAs.LibrarySource)
		  
		  
		  for each fldDesc as clXPLTopFolderDesc in c.LibraryTopFolder
		    
		    var thisProjectName as string = fldDesc.GetName
		    
		    var fld as FolderItem = c.LibraryFolderItem(thisProjectName)
		    
		    var fdList() as FolderItem = c.AllFolderItems(thisProjectName)
		    
		    var retdct as Dictionary = c.FindLibraryInfo(thisProjectName)
		    
		    if retdct = nil then
		      ProjectPath.Add(fldDesc.GetPath)
		      ProjectList.Add(thisProjectName)
		      projectName.Add("Not information")
		      ProjectAuthor.Add("Not information")
		      ProjectVersion.Add("Not information")
		      ProjectAttributes.add(nil)
		      
		    else
		      var thisDocProjectAuthor as string = ""
		      var thisDocProjectName as string = ""
		      var thisDocProjectVersion as string = ""
		      
		      // Extract standard keys
		      
		      if retdct.HasKey("LibraryAuthor") then
		        thisDocProjectAuthor = retdct.value("LibraryAuthor")
		        retdct.Remove("LibraryAuthor")
		        
		      end if
		      
		      if retdct.HasKey("LibraryName") then
		        thisDocProjectName = retdct.value("LibraryName")
		        retdct.Remove("LibraryName")
		        
		      end if
		      
		      if retdct.HasKey("LibraryVersion") then
		        thisDocProjectVersion = retdct.value("LibraryVersion")
		        retdct.Remove("LibraryVersion")
		        
		      end if
		      
		      ProjectPath.Add(fldDesc.GetPath)
		      ProjectList.Add(thisProjectName)
		      ProjectName.Add( thisDocProjectName)
		      ProjectVersion.Add( thisDocProjectVersion)
		      ProjectAuthor.Add( thisDocProjectAuthor)
		      ProjectAttributes.add(retdct)
		      
		    end if
		    
		  next
		  
		  Return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProjectFolder(projectFolder as folderitem)
		  self.MainFolderItem = projectFolder
		  
		  var r as clXojoProject = self.Analyze()
		  
		  if r <> nil then ShowAnalysisResults()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAnalysisResults()
		  
		  Label1.Text = MainFolderItem.NativePath
		  
		  Listbox1.RemoveAllRows
		  Listbox1.ColumnCount = 5
		  Listbox1.HasHeader = true
		  
		  const ProjectColumn as integer = 0
		  const ProjectIdColumn as integer = 1
		  const ProjectNameColumn as integer  = 2
		  const ProjectAuthorColumn  as integer  = 3
		  const ProjectVersionColumn as integer  = 4 
		    
		  Listbox1.HeaderAt(ProjectColumn) = "Project" 
		  Listbox1.HeaderAt(ProjectIdColumn) =  "ID"
		  Listbox1.HeaderAt( ProjectNameColumn) = "Name"
		  Listbox1.HeaderAt( ProjectAuthorColumn) = "Auhtor"
		  Listbox1.HeaderAt( ProjectVersionColumn) = "Version"
		  
		  
		  // ProjectColumn
		  // ProjectIdColumn
		  // ProjectAttributeColumn
		  // ProjectAttrValueColumn
		  
		  for i as integer = 0 to ProjectList.LastIndex
		    Listbox1.AddRow("")
		    
		    Listbox1.CellTextAt(Listbox1.LastAddedRowIndex, ProjectColumn) = ProjectList(i)
		    Listbox1.CellTextAt(Listbox1.LastAddedRowIndex, ProjectIdColumn) = ProjectPath(i)
		    Listbox1.CellTextAt(Listbox1.LastAddedRowIndex, ProjectNameColumn) = ProjectName(i)
		    Listbox1.CellTextAt(Listbox1.LastAddedRowIndex, ProjectAuthorColumn) = ProjectAuthor(i)
		    Listbox1.CellTextAt(Listbox1.LastAddedRowIndex, ProjectVersionColumn) = ProjectVersion(i)
		    
		    Listbox1.RowTagAt(Listbox1.LastAddedRowIndex) = ProjectAttributes(i)
		    
		  next
		  
		  return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowExtraInfo(dict as Dictionary)
		  
		  Listbox2.RemoveAllRows
		  Listbox2.HasHeader = false
		  Listbox2.ColumnCount = 1
		  
		  if dict = nil then return
		  
		  if dict.KeyCount = 0 then return
		  
		  Listbox2.HasHeader = true
		  Listbox2.ColumnCount = 2
		  Listbox2.HeaderAt(0)="Attribute"
		  Listbox2.HeaderAt(1)="Value"
		  
		  for each k as string in dict.Keys
		    Listbox2.AddRow(k)
		    Listbox2.CellTextAt(Listbox2.LastAddedRowIndex, 1) = dict.value(k)
		    
		  next
		  
		  Return
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MainFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Project As clXojoProject
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectAttributes() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectAuthor() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectList() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectName() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectPath() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectVersion() As string
	#tag EndProperty


#tag EndWindowCode

#tag Events ListBox1
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
