#tag Class
Protected Class clXojoProject
	#tag Method, Flags = &h0
		Sub AddAssetsForImportedLibraries(createOnDisk as Boolean)
		  
		  var UsedHead as clXojoProjectSourceLine = self.FindUsedLibraryFolder
		  var UsedHeadID as int64 = -1
		  
		  
		  UsedHeadID = AddTopAsset(ShareHead , clXojoProjectConstants.ShareableText, createOnDisk )
		  // reload if created
		  if UsedHead = nil then UsedHead  = self.FindUsedLibraryFolder
		  
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddAssetsForPublishedLibraries(info as clXojoLibraryInfo, createOnDisk as Boolean) As string
		  
		  //  Folder=Shareable;Shareable;&h00000000455A6FFF;&h0000000000000000;false
		  //  Folder=Library1;Shareable/Library1;&h0000000040A95FFF;&h00000000455A6FFF;false
		  //  Module=LibraryInfo;Shareable/Library1/LibraryInfo.xojo_code;&h0000000052EA47FF;&h0000000040A95FFF;false
		  
		  // 
		  // Add the Shareable folder if missing
		  //
		  
		  
		  var ShareHead as clXojoProjectSourceLine = self.FindShareableFolder
		  var ShareHeadID as int64 = -1
		  
		  var LibraryHead as clXojoProjectSourceLine = nil 
		  var LibraryHeadID as int64 = -1
		  var LibraryHeadRelPath as String
		  var LibraryHeadFld As  FolderItem = nil
		  
		  var infoModule as clXojoProjectSourceLine = nil
		  var infoModuleID as int64
		  var infoModuleRelPath as string 
		  var infoModuleFld as FolderItem = nil
		  
		   
		  LibraryHeadRelPath   = clXojoProjectConstants.ShareableText + "/" + info.LibraryName()
		  infoModuleRelPath  = clXojoProjectConstants.ShareableText + "/" + info.LibraryName() + "/" + info.DefaultModuleName + ".xojo_code"
		  
		  
		  ShareHeadID = AddTopAsset(ShareHead , clXojoProjectConstants.ShareableText, createOnDisk )
		  // reload if created
		  if ShareHead = nil then ShareHead  = self.FindShareableFolder
		  
		  
		  //
		  // Check if the Shareable folder contains a folder for the library
		  //
		  
		  var candidates() as clXojoProjectSourceLine 
		  
		  candidates = Sharehead.GetMatchingChildren( clXojoProjectConstants.cstFolder, info.LibraryName())
		  
		  if candidates.Count = 0 then 
		    LibraryHeadID = GetNewID()
		    LibraryHead = new clXojoProjectSourceLine(self.ProjectFolder)
		    LibraryHead.UpdateKeyValue(clXojoProjectConstants.cstFolder, info.LibraryName())
		    LibraryHead.UpdateRelativePath(LibraryHeadRelPath)
		    LibraryHead.UpdateOwnID(LibraryHeadID)
		    LibraryHead.UpdateParentID(ShareHeadID)
		    
		    if createOnDisk then
		      LibraryHeadFld = LibraryHead.UpdatedFullPath
		      LibraryHeadFld.CreateFolder
		      self.CreatedAssets.Add(LibraryHeadFld)
		      
		    end if
		    
		    Sharehead.AddItemToChildren(LibraryHead)
		    Self.SourceLines.Add(LibraryHead)
		    
		    
		  elseif candidates.Count = 1 then
		    LibraryHead = candidates(0)
		    LibraryHeadID = LibraryHead.GetloadedID
		    
		    LibraryHeadFld = LibraryHead.FullPath
		    
		  else
		    
		  end if
		  
		  //
		  // Check if we have a module for the constants
		  //
		  
		  if LibraryHead.wasLoaded then
		    
		    if createOnDisk then
		      infoModule = new clXojoProjectSourceLine(self.ProjectFolder)
		      
		      infoModule.UpdateRelativePath(infoModuleRelPath)
		      
		      var fld as FolderItem = infoModule.UpdatedFullPath
		      
		      if fld.Exists then 
		        // we are done here, the information module already exists, must be updated by the user
		        return "Information module already defined."
		        
		      end if
		      
		      
		    end if
		    
		  else
		    infoModuleID = GetNewID()
		    infoModule = new clXojoProjectSourceLine(self.ProjectFolder)
		    infoModule.UpdateKeyValue(clXojoProjectConstants.cstModule, info.DefaultModuleName)
		    infoModule.UpdateRelativePath(infoModuleRelPath)
		    infoModule.UpdateOwnID(infoModuleID)
		    infoModule.UpdateParentID(LibraryHeadID)
		    
		    LibraryHead.AddItemToChildren(infoModule)
		    Self.SourceLines.Add(infoModule)
		    
		    if createOnDisk then
		      infoModuleFld = infoModule.UpdatedFullPath
		      
		      call infoModule.CreateItemOnDisk(info.GetLibraryInfoModuleBody)
		      
		      self.CreatedAssets.Add(infoModuleFld)
		      
		    end if
		    
		    return cstOperationOK
		    
		  end if
		  
		  
		  
		  
		  
		  Return "Other error"
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddTopAsset(Head as clXojoProjectSourceLine, relativePath as string, createOnDisk as Boolean) As int64
		  
		  var TopHead as clXojoProjectSourceLine = Head
		  var TopHeadID as int64 = -1
		  var TopHeadRelPath as String
		  var TopHeadFld as FolderItem = nil
		  
		  if TopHead = nil then
		    // Need to add the folder
		    
		    TopHeadID = GetNewID()
		    TopHead = new clXojoProjectSourceLine(self.ProjectFolder)
		    TopHead.UpdateKeyValue(clXojoProjectConstants.cstFolder, clXojoProjectConstants.ShareableText)
		    TopHead.UpdateRelativePath(relativePath)
		    TopHead.UpdateOwnID(TopHeadID)
		    TopHead.UpdateParentID(0)
		    
		    Self.SourceLines.Add(TopHead)
		    
		    if createOnDisk then
		      TopHeadFld = TopHead.UpdatedFullPath
		      TopHeadFld.CreateFolder
		      self.CreatedAssets.Add(TopHeadFld)
		      
		    end if
		    
		  else
		    TopHeadID = TopHead.GetloadedID
		    TopHeadFld = TopHead.FullPath
		    
		  end if
		  
		  Return TopHeadID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildTree()
		  
		  self.LoadedItemIDDict = new Dictionary
		  
		  for each s as clXojoProjectSourceLine in self.SourceLines
		    if s.isItemForTree() then
		      var key as int64 = s.GetloadedID()
		      
		      self.LoadedItemIDDict.Value(key) = s
		      
		    end if
		    
		  next
		  
		  self.ItemTreeHead = new clXojoProjectTreeHead
		  self.LoadedItemIDDict.Value(0) = self.ItemTreeHead
		  
		  for each k as int64 in self.LoadedItemIDDict.Keys
		    var s as clXojoProjectSourceLine = self.LoadedItemIDDict.Value(k)
		    var v2 as int64 = s.GetloadedParentID()
		    
		    var p as clXojoProjectSourceLine = self.LoadedItemIDDict.Lookup(v2, nil)
		    
		    if p <> nil then
		      System.DebugLog("Adding " + s.key + "=" + s.value+" to " + p.key + " = " + p.value)
		      
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
		  
		  self.sourceProjectFile = LocateProjectFile()
		  
		  ParseProjectFile(sourceProjectFile, Log)
		  
		  BuildTree()
		  
		  ParseTree()
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFolder(name as string) As clXojoProjectSourceLine
		  
		  for each s as clXojoProjectSourceLine in SourceLines
		    
		    if s.isItemForTree then
		      if s.key = clXojoProjectConstants.cstFolder then
		        if s.value = name Then
		          return s
		          
		        end if
		        
		      end if
		      
		    end if
		    
		    
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindLibraryHeads(LibraryFolder as clXojoProjectSourceLine) As clXojoProjectSourceLine()
		  
		  var results() as clXojoProjectSourceLine
		  
		  var h as clXojoProjectSourceLine = LibraryFolder
		  
		  if h = nil then return results
		  
		  for each s as clXojoProjectSourceLine in h.Children
		    if s.key = clXojoProjectConstants.cstFolder then
		      results.Add(s)
		      
		      
		    end if
		    
		    
		  next
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindShareableFolder() As clXojoProjectSourceLine
		  
		  
		  return self.FindFolder(clXojoProjectConstants.ShareableText)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindUsedLibraryFolder() As clXojoProjectSourceLine
		  
		  
		  return self.FindFolder(clXojoProjectConstants.DestinationText)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllItemID() As int64()
		  
		  var results() as int64
		  
		  for each s as clXojoProjectSourceLine in self.SourceLines
		    if results.IndexOf(s.GetloadedID()) < 0 then results.Add(s.GetloadedID())
		    
		  next
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllLibraryInformation(libraryName as string, LibrariesTopFolder as clXojoProjectSourceLine) As Dictionary
		  //
		  // Returns all the information extracted from the library information module
		  // 
		  // Parameters
		  // - name of the library
		  // - top library folder (either shareable or used library)
		  //
		  // Returns
		  //  dictionary  populated with all information retrieved from the module constant
		  //
		  
		  var results as new Dictionary
		  
		  var libraries() as clXojoProjectSourceLine = FindLibraryHeads(LibrariesTopFolder)
		  var library as clXojoProjectSourceLine = nil 
		  var infomodule as clXojoProjectSourceLine = nil
		  
		  // Locate the requested library
		  for each r as clXojoProjectSourceLine in libraries
		    
		    if r.value = libraryName then library = r
		    
		  next
		  
		  if library = nil then 
		    system.DebugLog("Cannot find the library")
		    return results
		    
		  end if
		  
		  // Locate the library info module under the discovered folder
		  for each r as clXojoProjectSourceLine in library.Children
		    if r.key = clXojoProjectConstants.cstModule and r.value.IndexOf(clXojoProjectConstants.LibraryInfoSubstring) >= 0 then
		      infomodule = r
		      
		    end if
		    
		  next
		  
		  if infomodule = nil then 
		    system.DebugLog("Cannot find the library information module")
		    
		    Return results
		    
		  end if
		  
		  results = infoModule.ExtractItemConstants
		  
		  return results
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLibraryInformation(libraryName as string, LibrariesTopFolder as clXojoProjectSourceLine) As clXojoLibraryInfo
		  //
		  // Returns the information extracted from the library information module
		  // 
		  // Parameters
		  // - name of the library
		  // - top library folder (either shareable or used library)
		  //
		  // Returns
		  //  clXojoLibraryInfo object populated with information retrieved from the module or default values
		  //
		  
		  var d as Dictionary = GetAllLibraryInformation(libraryName, LibrariesTopFolder)
		  
		  // - The module should contain constants describing the library:
		  // - LibraryAuthor (string)
		  // - LibraryName (string)
		  // - LibraryVersion (string)
		  // 
		  // Those constants are presented to the user by the Assistant,and the following default values are used:
		  // - LibraryAuthor defaults to 'Unknown'
		  // - LibraryName defaults to the name of the folder
		  // - LibraryVersion defaults to 'Unspecified'
		  // 
		  
		  var results as new clXojoLibraryInfo(d, self.ProjectFolder.Name)
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNewID() As int64
		  
		  var isUnique as Boolean = false
		  
		  var alloc as int64
		  
		  
		  while not isUnique
		    
		    isUnique = true
		    alloc = Random.UUID(false).ToInt64
		    
		    // Already used in project 
		    if self.LoadedItemIDDict.HasKey(alloc) then isUnique = false
		    
		    // Already allocated
		    if allocatedItemID.IndexOf(alloc) >= 0  then isUnique = false
		    
		  wend
		  
		  self.allocatedItemID.Add(alloc)
		  
		  return alloc
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocateProjectFile() As FolderItem
		  
		  self.sourceProjectFile = nil
		  
		  for each fld as FolderItem in self.projectfolder.Children
		    if fld.IsFolder then
		      
		    elseif fld.Extension = clXojoProjectConstants.XojoProjectFileExt then
		      self.sourceProjectFile = fld
		      
		    else
		      
		    end if
		    
		  next
		  
		  Return self.sourceProjectFile
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
		    var n as new clXojoProjectSourceLine(self.ProjectFolder, line)
		    
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
		Sub ReloadProject()
		  self.allocatedItemID.RemoveAll
		  self.DestintationProjectFile = nil
		  self.ItemTreeHead = nil
		  self.LoadedItemIDDict = new Dictionary
		  self.SourceLines.RemoveAll
		  self.CreatedAssets.RemoveAll
		  
		  self.sourceProjectFile = LocateProjectFile()
		  
		  ParseProjectFile(sourceProjectFile, Log)
		  
		  BuildTree()
		  
		  ParseTree()
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  self.SaveAs(self.sourceProjectFile.Name)
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAs(destinationFileName as string)
		  
		  self.DestintationProjectFile = self.ProjectFolder.Child(destinationFileName)
		  
		  var tout as TextOutputStream = TextOutputStream.Create(self.DestintationProjectFile)
		  
		  for each s as clXojoProjectSourceLine in self.SourceLines
		    tout.WriteLine(s.getSourceLine(true))
		    
		  next
		  
		  tout.close
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMatchingItemID(oldItemID as int64, newItemID as int64)
		  
		  for each s as clXojoProjectSourceLine in self.SourceLines
		    s.UpdateMatchingItemID(oldItemID, newItemID)
		    
		  next
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteToLog(msg as string)
		  
		  if self.log = nil then return
		  
		  self.log.ShareStatus(DateTime.Now.SQLDateTime, msg)
		  
		  Return
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Project With lib assets
		
		Type=Desktop
		RBProjectVersion=2026.021
		MinIDEVersion=20210300
		OrigIDEVersion=20260201
		DesktopWindow=Window2;Window2.xojo_window;&h000000007723DFFF;&h0000000000000000;false
		Class=App;App.xojo_code;&h000000003B23C7FF;&h0000000000000000;false
		DesktopWindow=Window1;Window1.xojo_window;&h00000000161367FF;&h0000000000000000;false
		MenuBar=MainMenuBar;MainMenuBar.xojo_menu;&h000000003FDE07FF;&h0000000000000000;false
		BuildSteps=Build Automation;Build Automation.xojo_code;&h00000000714877FF;&h0000000000000000;false
		Folder=Shareable;Shareable;&h00000000455A6FFF;&h0000000000000000;false
		Folder=Library1;Shareable/Library1;&h0000000040A95FFF;&h00000000455A6FFF;false
		Module=mdBase;Shareable/Library1/mdBase.xojo_code;&h00000000694717FF;&h0000000040A95FFF;false
		Class=clClass1;Shareable/Library1/clClass1.xojo_code;&h000000000BA74FFF;&h0000000040A95FFF;false
		Class=clClass2;Shareable/Library1/clClass2.xojo_code;&h000000002033A7FF;&h0000000040A95FFF;false
		DesktopWindow=Container1;Shareable/Library1/Container1.xojo_window;&h0000000018E94FFF;&h0000000040A95FFF;false
		Module=LibraryInfo;Shareable/Library1/LibraryInfo.xojo_code;&h0000000052EA47FF;&h0000000040A95FFF;false
		Folder=LibLoger;Shareable/LibLoger;&h0000000053617FFF;&h00000000455A6FFF;false
		Module=ModRef;Shareable/LibLoger/ModRef.xojo_code;&h000000002918D7FF;&h0000000053617FFF;false
		Class=clLoger;Shareable/LibLoger/clLoger.xojo_code;&h000000005A8C2FFF;&h0000000053617FFF;false
		Module=LibraryInfo_log;Shareable/LibLoger/LibraryInfo_log.xojo_code;&h00000000376107FF;&h0000000053617FFF;false
		Class=clClass2;Shareable/LibLoger/ModRef/clClass2.xojo_code;&h0000000078E94FFF;&h000000002918D7FF;false
		Class=clClass3;Shareable/Library1/clClass3.xojo_code;&h000000006D2347FF;&h0000000040A95FFF;false
		DefaultWindow=Window1
		AppMenuBar=MainMenuBar
		
		
		
		Folder=Shareable;Shareable;&h00000000455A6FFF;&h0000000000000000;false
		Folder=Library1;Shareable/Library1;&h0000000040A95FFF;&h00000000455A6FFF;false
		Module=LibraryInfo;Shareable/Library1/LibraryInfo.xojo_code;&h0000000052EA47FF;&h0000000040A95FFF;false
		
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
		
		&h0000000000000000
		XX12345678901234567
		
		
		
		Folder=XojoProjectInfo;XojoProjectInfo;&h0000000070EFF7FF;&h0000000000000000;false
	#tag EndNote


	#tag Property, Flags = &h0
		allocatedItemID() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CreatedAssets() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		DestintationProjectFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemTreeHead As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		LoadedItemIDDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		log As itfShareProgress
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLines() As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		sourceProjectFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = cstOperationOK, Type = String, Dynamic = False, Default = \"OK", Scope = Public
	#tag EndConstant


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
	#tag EndViewBehavior
End Class
#tag EndClass
