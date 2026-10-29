#tag Class
Protected Class clXojoProject
	#tag Method, Flags = &h0
		Sub AddItem(item as clXojoProjectItem)
		  
		  self.ProjectItems.Add(item)
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllFolderItems(LibraryName as string) As FolderItem()
		  
		  //
		  // Get list of folderItem of items in the selected library
		  //
		  
		  var ItemList() as clXojoProjectItem = self.FindAllLibraryItems(LibraryName)
		  var returnList() as FolderItem
		  
		  for each pi as clXojoProjectItem in ItemList
		    var fld as FolderItem = CalcPathToItem(pi.GetPath)
		    if fld <> nil then returnList.Add(fld)
		    
		  next
		  
		  Return returnList
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildProjectTree()
		  //
		  // process the list of item and create the project tree
		  //
		  
		  self.TopElements.RemoveAll
		  
		  for each item as clXojoProjectItem in self. ProjectItems
		    var parentIDStr as string = item.GetParentID
		    var parentID as int64 = parentIDStr.ToInt64
		    
		    if parentID = 0 then
		      self.TopElements.Add(item)
		      item.AddedToTree =  true
		      
		    else
		      for each parentItem as clXojoProjectItem in self. ProjectItems
		        var ItemIDStr as string = parentItem.GetOwnID
		        var ItemID as int64 = ItemIDStr.ToInt64
		        
		        if ItemID = parentID then
		          parentItem.Children.Add(item)
		          item.AddedToTree = true
		          
		        end if
		        
		        
		      next
		      
		    end if
		    
		  next
		  
		  var nbc as integer  = CountNotLinked
		  
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcPathToItem(subPath as string) As FolderItem
		  
		  
		  var pathElements() as string = subPath.Split("/")
		  
		  var fld as FolderItem = self.ProjFolderItem
		  
		  try 
		    for each s as string in pathElements
		      fld = fld.Child(s)
		      
		    next
		    
		    Return fld
		    
		  Catch
		    Return nil
		    
		  end try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ProjectFolder as FolderItem, mode as UsedAs, progressLog as itfShareProgress)
		  
		  self.ProjFolderItem = ProjectFolder
		  
		  self.Projmode = mode
		  
		  select case mode 
		    
		  case UsedAs.Destination
		    self.FolderOfInterest = DestinationText
		    
		  case UsedAs.LibrarySource
		    self.FolderOfInterest = self.ShareableText
		    
		  case UsedAs.SomethingElse
		    self.FolderOfInterest = "???"
		    
		  end select
		  
		  WriteTo(progressLog, "Searching project file")
		  
		  var projectFile as FolderItem = LocateProjectFile()
		  
		  if projectFile = nil then
		    WriteTo(progressLog, "Project file not found.")
		    Return
		    
		  end if
		  
		  ParseProjectFile(projectFile, progressLog)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CountNotLinked() As integer
		  //
		  // Count project items that yet linked to the tree
		  //
		  
		  var cnt as integer
		  
		  for each item as clXojoProjectItem in self. ProjectItems
		     
		    if  not item.AddedToTree then
		      cnt = cnt + 1
		      
		    end if
		    
		  next
		  
		  Return cnt
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindAllLibraryItems(LibraryName as string) As clXojoProjectItem()
		  
		  //
		  // Identify all items in the selected library
		  //
		  
		  var listByParent() as string
		  var ItemList() as clXojoProjectItem
		  
		  //
		  // Identify the root
		  //
		  var item as clXojoProjectItem = self.FindLibraryRoot(LibraryName)
		  
		  if item = nil then Return ItemList
		  
		  listByParent.Add(item.GetOwnID)
		  
		  var lastCount as integer = 0
		  
		  while lastCount <>  listByParent.Count
		    lastCount = listByParent.Count
		    
		    for each pi as clXojoProjectItem in self.ProjectItems
		      var itemParent as string = pi.GetParentID
		      var itemID as string = pi.GetOwnID
		      
		      if listByParent.IndexOf(itemParent) > -1 and listByParent.IndexOf(itemID) < 0 then
		        listByParent.Add(itemid)
		        ItemList.add(pi)
		        // System.DebugLog("Adding " + pi.ToString(false))
		        
		      end if
		      
		    next
		    
		  Wend
		  
		  
		  
		  Return ItemList
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindLibraryInfo(LibraryName as string) As Dictionary
		  
		  var ItemList() as clXojoProjectItem = self.FindAllLibraryItems(LibraryName)
		  
		  for each item as clXojoProjectItem in ItemList
		    if item.IsLibraryInfoModule() then
		      var fld as FolderItem = CalcPathToItem(item.GetPath)
		      
		      if fld.Exists and not fld.IsFolder then
		        var retdct as Dictionary = self.ParseLinInfoModule(fld)
		        
		        Return retdct
		        
		      end if
		      
		      
		    end if
		    
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindLibraryRoot(LibraryName as string) As clXojoProjectItem
		  
		  
		  for each item as clXojoProjectItem in self.LibrariesTopFolder
		    if item.GetName = LibraryName then
		      Return item
		      
		    end if
		    
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSourceOfLibraries() As Boolean
		  return self.Projmode = UsedAs.LibrarySource
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibrariesTopFolder() As clXojoProjectItem()
		  //
		  // Extract the list of libraries
		  // They are one level under the folder or interest
		  //
		  
		  var ret() as clXojoProjectItem
		  
		  for each item as clXojoProjectItem in self.ProjectItems
		    if item.IsLibraryTopFolder( self.FolderOfInterest) then ret.Add(item)
		    
		  next
		  
		  return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryFolderItem(LibraryName as string) As FolderItem
		  
		  var item as clXojoProjectItem = self.FindLibraryRoot(LibraryName)
		  
		  if item = nil then return nil
		  
		  return self.CalcPathToItem(item.GetPath)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryInformation() As clXojoLibraryInfo()
		  
		  var ret() as clXojoLibraryInfo
		  
		  // if not self.IsSourceOfLibraries then return ret
		  
		  for each fldDesc as clXojoProjectItem in self.LibrariesTopFolder
		    
		    var thisProjectName as string = fldDesc.GetName
		    
		    var fld as FolderItem = self.LibraryFolderItem(thisProjectName)
		    
		    var fdList() as FolderItem = self.AllFolderItems(thisProjectName)
		    
		    var retdct as Dictionary = self.FindLibraryInfo(thisProjectName)
		    
		    var libInfo as new clXojoLibraryInfo
		    
		    libInfo.projName = thisProjectName
		    
		    if retdct = nil then
		      libInfo.Author = "No information"
		      libInfo.Name = "No information"
		      libInfo.Path = fldDesc.GetPath
		      libInfo.ProjectAttributes = nil
		      libInfo.Version = "no information"
		      
		    else
		      libInfo.Author = ""
		      libInfo.Name = ""
		      libInfo.Path = fldDesc.GetPath
		      libInfo.ProjectAttributes = nil
		      libInfo.Version = ""
		       
		      // Extract standard keys
		      
		      if retdct.HasKey("LibraryAuthor") then
		        libInfo.Author = retdct.value("LibraryAuthor")
		        retdct.Remove("LibraryAuthor")
		        
		      end if
		      
		      if retdct.HasKey("LibraryName") then
		        libInfo.Name = retdct.value("LibraryName")
		        retdct.Remove("LibraryName")
		        
		      end if
		      
		      if retdct.HasKey("LibraryVersion") then
		        libInfo.Version = retdct.value("LibraryVersion")
		        retdct.Remove("LibraryVersion")
		        
		      end if
		      
		      libInfo.ProjectAttributes = retdct
		      
		      ret.add(libInfo)
		      
		    end if
		    
		  next
		  
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocateProjectFile() As FolderItem
		  var projectfolder as FolderItem = self.ProjFolderItem
		  var projectFile as FolderItem = nil
		  
		  
		  for each fld as FolderItem in projectfolder.Children
		    if fld.IsFolder then
		      
		    elseif fld.Extension = XojoProjectFileExt then
		      projectFile = fld
		      
		    else
		      
		    end if
		    
		  next
		  
		  Return projectFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseLinInfoModule(sourceFile as FolderItem) As Dictionary
		  
		  const cstTagConstant as string ="#tag Constant"
		  const cstName as string = "Name ="
		  const cstDefault as string = "Default ="
		  
		  var retdct as new Dictionary
		  
		  
		  var sourcelines() as string = LoadTextByLine(sourceFile)
		  
		  // #tag Constant, Name = LibraryAuthor, Type = String, Dynamic = False, Default = \"alpha",
		  
		  for each s as string in sourcelines
		    var idx1 as integer = s.IndexOf(cstTagConstant)
		    var idx2Start as integer = s.IndexOf(cstName)
		    var idx3Start as integer = s.IndexOf(cstDefault)
		    
		    var dictKeyStr as string
		    var dictValueStr as string
		    
		    if idx1 > 0 and idx2Start > 0 and idx3Start > 0 then 
		      var idxComma as integer
		      
		      idxComma = s.IndexOf(idx2Start,",")
		      dictKeyStr = s.Middle(idx2Start + cstName.Length, idxComma - idx2Start - cstName.Length).trim()
		      
		      idxComma = s.IndexOf(idx3Start,",")
		      dictValueStr =  s.Middle(idx3Start + cstDefault.Length, idxComma - idx3Start - cstDefault.Length).trim()
		      
		      if dictValueStr.left(2) = "\""" then dictValueStr = dictValueStr.Middle(2,999)
		      if dictValueStr.Right(1) = """" then dictValueStr = dictValueStr.left(dictValueStr.Length-1)
		      
		      if dictKeyStr.Length > 0 then
		        retdct.Value(dictKeyStr) = dictValueStr
		        
		      end if
		      
		    end if
		    
		  next
		  
		  return retdct
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseProjectFile(projectFile as FolderItem, progressLog as itfShareProgress)
		  
		  if not IsExistingFIle(projectFile) then Return
		  
		  var s() as string = LoadTextByLine(projectFile)
		  
		  // var s() as string = TextInputStream.Open(projectFile).ReadAll.Split(chr(10))
		  
		  const keyFolder as String = "Folder="
		  
		  
		  //
		  // RBProjectVersion=2026.021
		  // Folder=Shareable;Shareable;&h00000000455A6FFF;&h0000000000000000;false
		  // Class=clClass1;Shareable/clClass1.xojo_code;&h000000000BA74FFF;&h00000000455A6FFF;false
		  // Module=mdBase;Shareable/mdBase.xojo_code;&h00000000694717FF;&h00000000455A6FFF;false
		  //
		  
		  writeto(progressLog, "Looking for folder " + self.FolderOfInterest + "...")
		  
		  var lineCounter as integer = 0
		  
		  for each line as string in s
		    lineCounter = lineCounter + 1
		    
		    var item as clXojoProjectItem = self.ProcessLine(lineCounter, line, self.FolderOfInterest)
		    
		    
		    if item <> nil then
		      self.ProjectItems.Add(item)
		      
		      
		      if item.IsFolderOfInterest( self.FolderOfInterest) then 
		        self.ProjFolderOfInterest = item
		        WriteTo(progressLog, "Found " + self.FolderOfInterest)
		        
		      end if
		      
		      item.Dump
		      
		    end if
		    
		  next
		  
		  
		  BuildProjectTree
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProcessLine(SourceLine as integer, Source as String, FolderOfInterest as string) As clXojoProjectItem
		  
		  
		  var ret as clXojoProjectItem = nil
		  
		  var keyEndPosition as integer = Source.IndexOf("=")
		  var lineKey as string = Source.Left(keyEndPosition)
		  
		  var params() as string = Source.Middle(keyEndPosition+1, 999).Split(";")
		  
		  
		  if params.LastIndex >= 4 and params(1).left(FolderOfInterest.Length) = FolderOfInterest  then
		    ret  = new clXojoProjectItem(SourceLine, source, lineKey, params, FolderOfInterest)
		    
		  end if
		  
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteTo(progressLog as itfShareProgress, Message as string)
		  if progressLog = nil then Return
		  
		  progressLog.ShareStatus(DateTime.Now.SQLDateTime,Message)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FolderOfInterest As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectItems() As clXojoProjectItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjFolderOfInterest As clXojoProjectItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Projmode As UsedAs
	#tag EndProperty

	#tag Property, Flags = &h0
		TopElements() As clXojoProjectItem
	#tag EndProperty


	#tag Constant, Name = DestinationText, Type = String, Dynamic = False, Default = \"UsedSourceLibraries", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ShareableText, Type = String, Dynamic = False, Default = \"Shareable", Scope = Public
	#tag EndConstant

	#tag Constant, Name = XojoProjectFileExt, Type = String, Dynamic = False, Default = \"xojo_project", Scope = Public
	#tag EndConstant


	#tag Enum, Name = UsedAs, Type = Integer, Flags = &h0
		Destination
		  LibrarySource
		SomethingElse
	#tag EndEnum


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
			Name="FolderOfInterest"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
