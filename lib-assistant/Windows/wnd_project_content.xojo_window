#tag DesktopWindow
Begin DesktopWindow wnd_project_content
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
   Height          =   600
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   551247871
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Libraries in project"
   Type            =   0
   Visible         =   True
   Width           =   740
   Begin DesktopListBox lb_libraries
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
      Height          =   220
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
      Top             =   60
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopListBox lb_properties
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
      Height          =   240
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   340
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   320
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   8
      Transparent     =   False
      Visible         =   True
      Width           =   700
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   40
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   290
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   320
   End
   Begin DesktopCanvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   240
      Index           =   -2147483648
      Left            =   360
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   340
      Transparent     =   False
      Visible         =   True
      Width           =   340
   End
   Begin DesktopScrollbar scScrollPict
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   236
      Index           =   -2147483648
      Left            =   705
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   340
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   15
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
		  
		  lb_libraries.ColumnCount = 2
		  lb_libraries.HeaderAt(0) = "Usage"
		  lb_libraries.HeaderAt(1) = "Discovered libraries"
		  
		  lb_properties.ColumnCount = 2
		  lb_properties.HeaderAt(0) = "Properties"
		  lb_properties.HeaderAt(1) = " "
		  
		  //lb_structure.ColumnCount = 1
		  //lb_structure.HeaderAt(0) = "Structure"
		  
		  Canvas1.Refresh(true)
		  
		  Return
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AnalyzeProject()
		  
		  var SectionHead() as clXojoProjectSourceLine
		  var UserLabel() as string
		  
		  var prj as clXojoProject = self.project
		  
		  lb_libraries.RemoveAllRows
		  
		  
		  SectionHead.Add(prj.FindShareableFolder)
		  UserLabel.Add("Publishes")
		  
		  SectionHead.Add(prj.FindUsedLibraryFolder)
		  UserLabel.Add("Uses")
		  
		  
		  
		  for i as integer = 0 to 1
		    
		    var LibraryHeads() as clXojoProjectSourceLine = prj.GetLibrariesInTopFolder(SectionHead(i))
		    
		    for each LibraryHead as clXojoProjectSourceLine in LibraryHeads
		      var libraryName as String = LibraryHead.Value
		      
		      lb_libraries.AddRow("")
		      var idx as integer = lb_libraries.LastAddedRowIndex
		      
		      lb_libraries.CellTextAt(idx, 0) = UserLabel(i)
		      lb_libraries.CellTextAt(idx, 1)  = libraryName
		      
		      lb_libraries.CellTagAt(idx, 0) =  LibraryHead
		      // lb_libraries.CellTagAt(idx, 1) =
		      
		    next
		    
		  next
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetImage()
		  Self.StructurePict = nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowLibraryProperties(head as clXojoProjectSourceLine)
		  
		  lb_properties.RemoveAllRows
		  
		  var boldItems() as string = array ( _ 
		  clXojoLibraryInfo.cstLibraryAuthor _
		  ,clXojoLibraryInfo.cstLibraryName _
		  ,clXojoLibraryInfo.cstLibraryVersion _
		  ,clXojoLibraryInfo.cstLibraryRequirements _
		  )
		  
		  if head <> nil then 
		    
		    var d as Dictionary = project.GetAllLibraryInformation(head)
		    
		    for each k as string in d.keys
		      var newidx as integer 
		      var newstd as Boolean = false
		      
		      lb_properties.addrow("")
		      
		      newidx = lb_properties.LastAddedRowIndex
		      
		      newstd = boldItems.indexof(k) >= 0
		      
		      lb_properties.CellTextAt(newidx, 0) = k
		      lb_properties.CellTextAt(newidx, 1) = d.Value(k)
		      
		      lb_properties.CellBoldAt(newidx, 1) = newstd
		      
		      
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowLibraryStructure(head as clXojoProjectSourceLine)
		  const cstRowHeight as integer = 20
		  const cstTotalWidth as integer = 340
		  const cstOffset  as integer = -5
		  const cstDrawingOffset as integer = 10
		  
		  var vertLineLastY(20) as integer
		  
		  for i as integer = 0 to vertLineLastY.LastIndex
		    vertLineLastY(i) = -1
		    
		  next
		  
		  // lb_structure.RemoveAllRows
		  
		  self.StructurePict = nil
		  
		  if head = nil then return
		   
		  var results() as pair = project.NavigateSubTree(head, 0)
		  
		  //
		  // Calculate height of picture
		  //
		  var htot as integer = results.Count * cstRowHeight + cstRowHeight * 2
		  var wtot as integer = cstTotalWidth
		  var hcurrent as integer = cstRowHeight
		  
		  var lastlevel as integer = 0
		  
		  self.StructurePict = new Picture(wtot, htot, 32)
		  
		  var pct as Picture = self.StructurePict
		  
		  pct.Graphics.FontName = "Tahoma"
		  pct.Graphics.FontSize = 12
		  
		  scScrollPict.Value = 0
		  scScrollPict.MaximumValue = pct.Height - Canvas1.Height + 20
		  
		  for each p as pair in results
		    var h as clXojoProjectSourceLine = clXojoProjectSourceLine(p.right)
		    var str as string = h.key + "  " + h.value
		    var curlevel as integer = p.Left
		    
		    var xLineStart as integer = (curlevel - 1 ) * 20 + 5 + cstDrawingOffset
		    var xLineEnd as integer = curlevel * 20 - 5 + cstDrawingOffset
		    
		    if p.left > 0 then 
		      
		      var VertLineDrawFromY as integer
		      
		      if vertLineLastY( curlevel) > 0 then
		        VertLineDrawFromY = vertLineLastY( curlevel)
		        
		      else
		        VertLineDrawFromY  = hcurrent + cstOffset  - cstRowHeight + 10 
		        
		      end if
		      
		      pct.Graphics.DrawingColor = rgb(128, 128, 128)
		      pct.Graphics.DrawLine( xLineStart, hcurrent + cstOffset  , xLineEnd, hcurrent + cstOffset  )
		      pct.Graphics.DrawLine( xLineStart , VertLineDrawFromY, xLineStart, hcurrent + cstOffset)
		      
		      
		      vertLineLastY( p.left) = VertLineDrawFromY
		      
		      
		      for i as integer = curlevel + 1 to vertLineLastY.LastIndex
		        vertLineLastY(i) = -1
		        
		      next
		      
		      lastlevel = curlevel
		      
		    end if
		    
		    pct.Graphics.DrawingColor = rgb(0, 0, 0)
		    pct.Graphics.DrawText(str, p.left*20 + cstDrawingOffset , hcurrent)
		    
		    // lb_structure.AddRow (msg)
		    
		    hcurrent = hcurrent + cstRowHeight
		     
		  next
		  
		  Canvas1.Refresh(true)
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowLibraryStructure2(head as clXojoProjectSourceLine)
		  // 
		  // 
		  // lb_structure.RemoveAllRows
		  // 
		  // if head <> nil then 
		  // var results() as pair = project.NavigateSubTree(head, 0)
		  // 
		  // for each p as pair in results
		  // var h as clXojoProjectSourceLine = clXojoProjectSourceLine(p.right)
		  // 
		  // var msg as string = FixStr("-", p.left*2) + h.key + "  " + h.value
		  // 
		  // lb_structure.AddRow (msg)
		  // 
		  // next
		  // 
		  // end if
		  // 
		  // return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private project As clXojoProject
	#tag EndProperty

	#tag Property, Flags = &h0
		StructurePict As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events lb_libraries
	#tag Event
		Sub SelectionChanged()
		  
		  var idx as integer = me.SelectedRowIndex
		  
		  if idx < 0 then Return
		  
		  var r as variant = me.CellTagAt(idx, 0)
		  
		  var head as clXojoProjectSourceLine = nil
		  var name as string = lb_libraries.CellTextAt(idx, 1) 
		  
		  if r isa clXojoProjectSourceLine then head = clXojoProjectSourceLine(r)
		  
		  ShowLibraryProperties(head)
		  
		  ShowLibraryStructure(head)
		  
		  Return
		   
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ccSourceProject
	#tag Event
		Sub TargetSelected()
		  self.project = ccSourceProject.getSelectedProject
		  
		  AnalyzeProject
		  
		  return
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClearSelected()
		  self.project = nil
		  
		  lb_libraries.RemoveAllRows
		  lb_properties.RemoveAllRows
		  //lb_structure.RemoveAllRows
		  
		  Return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label1
	#tag Event
		Sub Opening()
		  me.Text = "This list contains all constants defined in the library information module."
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  
		  if self.StructurePict <> nil then g.DrawPicture(self.StructurePict, 0, -scScrollPict.Value)
		  
		  g.DrawingColor = rgb(200, 200, 200)
		  
		  g.DrawRectangle(0, 0, g.Width, g.Height)
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scScrollPict
	#tag Event
		Sub ValueChanged()
		  
		  Canvas1.Refresh(true)
		  
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
