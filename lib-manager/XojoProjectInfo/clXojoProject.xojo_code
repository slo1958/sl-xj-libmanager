#tag Class
Protected Class clXojoProject
	#tag Method, Flags = &h0
		Function AllFolderItems(LibraryName as string) As FolderItem()
		  
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
		Sub Constructor(ProjectFolder as FolderItem, mode as UsedAs)
		  
		  self.ProjFolderItem = ProjectFolder
		  
		  select case mode 
		    
		  case UsedAs.Destination
		    self.FolderOfInterest = DestinationText
		    
		  case UsedAs.LibrarySource
		    self.FolderOfInterest = self.ShareableText
		    
		  case UsedAs.SomethingElse
		    self.FolderOfInterest = "???"
		    
		  end select
		  
		  
		  LocateProject()
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindAllLibraryItems(LibraryName as string) As clXojoProjectItem()
		  
		  //
		  // Identify all items under the select root
		  //
		  
		  var listByParent() as string
		  var ItemList() as clXojoProjectItem 
		  
		  //
		  // Identify the root
		  //
		  var item as clXPLTopFolderDesc = self.FindLibraryRoot(LibraryName)
		  
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
		Function FindLibraryRoot(LibraryName as string) As clXPLTopFolderDesc
		  
		  
		  for each item as clXPLTopFolderDesc in self.LibraryTopFolder
		    if item.GetName = LibraryName then
		      Return item
		      
		    end if
		    
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryFolderItem(LibraryName as string) As FolderItem
		  
		  var item as clXPLTopFolderDesc = self.FindLibraryRoot(LibraryName)
		  
		  if item = nil then return nil
		  
		  return self.CalcPathToItem(item.GetPath)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadTextByLine(fld as FolderItem) As string()
		  
		  var ret() as string
		  
		  if fld = nil then return ret
		  
		  if not fld.Exists then return ret
		  
		  if fld.IsFolder then Return ret
		  
		  var ti as TextInputStream = TextInputStream.Open(fld)
		  
		  while not ti.EndOfFile
		    ret.add(ti.ReadLine)
		    
		  wend
		  
		  ti.Close
		  
		  return ret
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LocateProject()
		  var projectfolder as FolderItem = self.ProjFolderItem
		  var projectFile as FolderItem = nil
		   
		  
		  for each fld as FolderItem in projectfolder.Children
		    if fld.IsFolder then
		      
		    elseif fld.Extension = XojoProjectFileExt then
		      projectFile = fld
		      
		    else
		      
		    end if
		    
		  next
		  
		  var s() as string = self.LoadTextByLine(projectFile)
		  
		  // var s() as string = TextInputStream.Open(projectFile).ReadAll.Split(chr(10))
		  
		  const keyFolder as String = "Folder="
		  
		  
		  //
		  // RBProjectVersion=2026.021
		  // Folder=Shareable;Shareable;&h00000000455A6FFF;&h0000000000000000;false
		  // Class=clClass1;Shareable/clClass1.xojo_code;&h000000000BA74FFF;&h00000000455A6FFF;false
		  // Module=mdBase;Shareable/mdBase.xojo_code;&h00000000694717FF;&h00000000455A6FFF;false
		  //
		  var hasShareable as Boolean = false
		  
		  for each line as string in s
		    if line.left(keyFolder.Length) = keyFolder then
		      hasShareable = true
		      
		    end if
		    
		    
		  next
		  
		  
		  
		  for each line as string in s
		    var item as clXojoProjectItemBase = self.ProcessLine(line, self.FolderOfInterest)
		    
		    if item = nil then
		      
		    elseif item isa clXPLShareableFolderDesc then
		      self.ProjFolderBase = clXPLShareableFolderDesc(item)
		      
		    elseif item isa clXPLFolderDesc then
		      self.SubFolder.Add(clXPLFolderDesc(item))
		      
		    elseif item isa clXPLTopFolderDesc then
		      self.LibraryTopFolder.Add(clXPLTopFolderDesc(item))
		      
		    elseif item isa clXojoProjectItem then
		      self.ProjectItems.Add(clXojoProjectItem(item))
		      
		    end if
		    
		    if item <> nil then
		      item.Dump
		      
		    end if
		    
		  next
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseLinInfoModule(sourceFile as FolderItem) As Dictionary
		  
		  const cstTagConstant as string ="#tag Constant"
		  const cstName as string = "Name ="
		  const cstDefault as string = "Default ="
		  
		  var retdct as new Dictionary
		  
		  
		  var sourcelines() as string = self.LoadTextByLine(sourceFile)
		  
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

	#tag Method, Flags = &h0
		Function ProcessLine(Source as String, FolderOfInterest as string) As clXojoProjectItemBase
		  
		  
		  var ret as clXojoProjectItemBase = nil
		  
		  var keyEndPosition as integer = Source.IndexOf("=")
		  var lineKey as string = Source.Left(keyEndPosition)
		  
		  var params() as string = Source.Middle(keyEndPosition+1, 999).Split(";")
		  
		  
		  if params.LastIndex >= 4 and params(1).left(FolderOfInterest.Length) = FolderOfInterest  then
		    
		    if Linekey  = "Folder" and params(0) = FolderOfInterest  then
		      ret = new clXPLShareableFolderDesc(source, lineKey, params)
		      
		    elseif LineKey = "Folder" and params(1).Left(FolderOfInterest.Length+1) = FolderOfInterest+"/" then
		      ret = new clXPLTopFolderDesc(source, lineKey, params)
		      
		    elseif LineKey = "Folder" then
		      ret  = new clXPLFolderDesc(source, lineKey, params)
		      
		    else
		      ret  = new clXojoProjectItem(source, lineKey, params)
		      
		    end if
		    
		  end if
		  
		  Return ret
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		FolderOfInterest As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LibraryTopFolder() As clXPLTopFolderDesc
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectItems() As clXojoProjectItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjFolderBase As clXPLShareableFolderDesc
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		SubFolder() As clXPLFolderDesc
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
	#tag EndViewBehavior
End Class
#tag EndClass
