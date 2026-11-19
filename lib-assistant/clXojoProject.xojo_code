#tag Class
Protected Class clXojoProject
	#tag Method, Flags = &h0
		Sub BuildTree()
		  
		  self.ItemID = new Dictionary
		  
		  for each s as clXojoProjectSourceLine in self.SourceLines
		    if s.isItemForTree() then
		      var key as int64 = s.OwnID
		      
		      self.ItemID.Value(key) = s
		      
		    end if
		    
		  next
		  
		  self.ItemTreeHead = new clXojoProjectTreeHead
		  self.ItemID.Value(0) = self.ItemTreeHead
		  
		  for each k as int64 in self.Itemid.Keys
		    var s as clXojoProjectSourceLine = self.ItemID.Value(k)
		    var v2 as int64 = s.ParentID
		    
		    var p as clXojoProjectSourceLine = self.ItemID.Lookup(v2, nil)
		    
		    if p <> nil then
		      p.AddItemToChildren(s)
		      
		    end if
		    
		  next
		  
		  
		  return
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(prmProjectFolder as FolderItem, prmProgressLog as itfShareProgress)
		  
		  self.ProjectFolder = prmProjectFolder
		  self.log = prmProgressLog
		  
		  self.projectFile = LocateProjectFile()
		  
		  ParseProjectFile(projectFile, Log)
		  
		  BuildTree()
		  
		  ParseTree()
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocateProjectFile() As FolderItem
		  
		  self.projectFile = nil
		  
		  for each fld as FolderItem in self.projectfolder.Children
		    if fld.IsFolder then
		      
		    elseif fld.Extension = clXojoProjectConstants.XojoProjectFileExt then
		      self.projectFile = fld
		      
		    else
		      
		    end if
		    
		  next
		  
		  Return self.projectFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateTreeNode(NodeID as int64) As clXojoProjectSourceLine
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NavigateSubTree(h as clXojoProjectSourceLine, lvl as integer)
		  
		  var msg as string = FixStr("-", lvl*2) + h.key +" " + h.value
		  
		  self.WriteToLog(msg)
		  
		  for each s as clXojoProjectSourceLine in h.Children
		    NavigateSubTree(s, lvl + 1)
		    
		  next
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseProjectFile(projectFile as FolderItem, progressLog as itfShareProgress)
		  
		  if not IsExistingFIle(projectFile) then Return
		  
		  var s() as string = LoadTextByLine(projectFile)
		  
		  
		  for each line as string in s
		    var n as new clXojoProjectSourceLine(line)
		    
		    Self.SourceLines.Add(n)
		    
		  next
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseTree()
		  
		  
		  NavigateSubTree(self.ItemTreeHead, 0)
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteToLog(msg as string)
		  
		  if self.log = nil then return
		  
		  self.log.ShareStatus(DateTime.Now.SQLDateTime, msg)
		  
		  Return
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Untitled
		
		
		BuildSteps
		Class
		DesktopWindow
		Folder
		Interface
		MenuBar
		Module
		
		
	#tag EndNote

	#tag Note, Name = XojoProjectFile
		RBProjectVersion=2026.021
		MinIDEVersion=20210300
		OrigIDEVersion=20260201
		Class=App;App.xojo_code;&h000000002A224FFF;&h0000000000000000;false
		DesktopWindow=Window1;Window1.xojo_window;&h0000000002F35FFF;&h0000000000000000;false
		MenuBar=MainMenuBar;MainMenuBar.xojo_menu;&h00000000044377FF;&h0000000000000000;false
		BuildSteps=Build Automation;Build Automation.xojo_code;&h000000006E86EFFF;&h0000000000000000;false
		Folder=UserInterface;UserInterface;&h000000005E95A7FF;&h0000000000000000;false
		DesktopWindow=wnd_lib_source;UserInterface/wnd_lib_source.xojo_window;&h0000000023CC2FFF;&h000000005E95A7FF;false
		Class=DesktopTaggedButton;UserInterface/DesktopTaggedButton.xojo_code;&h0000000023FADFFF;&h000000005E95A7FF;false
		Folder=LibraryManagement;LibraryManagement;&h000000006232DFFF;&h0000000000000000;false
		Class=clCodeLibray;LibraryManagement/clCodeLibray.xojo_code;&h000000005A7037FF;&h000000006232DFFF;false
		Class=clLibDependency;LibraryManagement/clLibDependency.xojo_code;&h0000000070072FFF;&h000000006232DFFF;false
		Class=clLibraryVersionInfo;LibraryManagement/clLibraryVersionInfo.xojo_code;&h0000000028A45FFF;&h000000006232DFFF;false
		Folder=XojoProjectInfo;XojoProjectInfo;&h0000000070EFF7FF;&h0000000000000000;false
		Class=clXojoProject;XojoProjectInfo/clXojoProject.xojo_code;&h0000000046E817FF;&h0000000070EFF7FF;false
		Class=clXojoProjectItem;XojoProjectInfo/clXojoProjectItem.xojo_code;&h000000007A6BD7FF;&h0000000070EFF7FF;false
		DesktopWindow=wnd_project_info;wnd_project_info.xojo_window;&h0000000021A687FF;&h0000000000000000;false
		Module=mdHelpers;mdHelpers.xojo_code;&h00000000488207FF;&h0000000000000000;false
		Folder=GitHubInterface;GitHubInterface;&h00000000699CCFFF;&h0000000000000000;false
		Module=GitHubHelper;GitHubInterface/GitHubHelper.xojo_code;&h000000002996E7FF;&h00000000699CCFFF;false
		DesktopWindow=wnd_tests;wnd_tests.xojo_window;&h000000002E67CFFF;&h0000000000000000;false
		Interface=itfShareProgress;itfShareProgress.xojo_code;&h0000000068B31FFF;&h0000000000000000;false
		DesktopWindow=ccProjectPicker;ccProjectPicker.xojo_window;&h000000004FC06FFF;&h0000000000000000;false
		Class=clXojoLibraryInfo;XojoProjectInfo/clXojoLibraryInfo.xojo_code;&h0000000016FFDFFF;&h0000000070EFF7FF;false
		DefaultWindow=Window1
		AppMenuBar=MainMenuBar
		MajorVersion=1
		MinorVersion=0
		
	#tag EndNote


	#tag Property, Flags = &h0
		ItemID As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemTreeHead As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		log As itfShareProgress
	#tag EndProperty

	#tag Property, Flags = &h0
		projectFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLines() As clXojoProjectSourceLine
	#tag EndProperty


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProjectFolder"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
