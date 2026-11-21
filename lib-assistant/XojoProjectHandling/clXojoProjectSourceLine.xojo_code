#tag Class
Protected Class clXojoProjectSourceLine
	#tag Method, Flags = &h0
		Sub AddItemToChildren(item as clXojoProjectSourceLine)
		  
		  if item  isa clXojoProjectTreeHead then Return
		  
		  self.Children.Add(item)
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Classify()
		  
		  var klist() as String
		  
		  klist.Add(clXojoProjectConstants.cstBuildSteps)
		  klist.Add(clXojoProjectConstants.cstClass)
		  klist.Add(clXojoProjectConstants.cstDesktopWindow)
		  
		  klist.Add(clXojoProjectConstants.cstFolder)
		  klist.Add(clXojoProjectConstants.cstInterface)
		  klist.Add(clXojoProjectConstants.cstMenuBar)
		  
		  klist.Add(clXojoProjectConstants.cstModule)
		  
		  self.isItemForTree = self.isMatchingAnyKeys(klist())
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(prmProjectFolder as folderitem)
		  
		  self.source = ""
		  self.projectFolder = prmProjectFolder
		  self.loadedFromProject = false
		  
		  self.isItemForTree = true
		  
		  self.SetKeyValuesToDefault()
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(prmProjectFolder as FolderItem, prmSource as clXojoProjectSourceLine)
		  
		  
		  self.loadedFromProject = false
		  
		  self.isItemForTree = prmSource.isItemForTree
		  self.key = prmSource.key
		  
		  self.loadedOwnID = prmSource.loadedOwnID
		  self.loadedOwnIDStr = prmSource.loadedOwnIDStr
		  
		  self.loadedParentID = prmSource.loadedParentID
		  self.loadedParentIDStr = prmSource.loadedParentIDStr
		  
		  self.parameters.RemoveAll
		  for each p as string in prmSource.parameters
		    self.parameters.add(p)
		    
		  next
		  
		  self.projectFolder = prmProjectFolder
		  
		  self.relativePathElements.RemoveAll
		  for each p as string in prmSource.relativePathElements
		    self.relativePathElements.Add(p)
		    
		  next
		  
		  self.source = prmSource.source
		  
		  self.updatedOwnID = prmSource.updatedOwnID
		   
		  self.updatedParentID = prmSource.updatedParentID
		  
		  self.updatedRelativePathElements.RemoveAll
		  for each p as string in prmSource.updatedRelativePathElements
		    self.updatedRelativePathElements.Add(p)
		    
		  next
		  
		  self.value = prmSource.value
		  
		  Return
		  
		  
		  
		  
		  self.SetKeyValuesToDefault()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(prmProjectFolder as folderitem, prmSourceLine as string)
		  
		  self.Source = prmSourceLine
		  self.projectFolder = prmProjectFolder
		  self.loadedFromProject = true
		  
		  
		  self.ProcessLine()
		  
		  self.Classify()
		  
		  self.SetKeyValuesToDefault()
		  
		  self.UpdateKeyValuesFromSource()
		  
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFIle(SourceProjectFolder as FolderItem, TargetProjectFolder as FolderItem)
		  
		  var copyFromFolder as FolderItem
		  var copyToFolder as FolderItem
		  
		  if SourceProjectFolder = nil and TargetProjectFolder = nil then Return
		  
		  if SourceProjectFolder = nil then
		    copyFromFolder = self.projectFolder
		    
		  else
		    copyFromFolder = SourceProjectFolder
		    
		  end if
		  
		  
		  if TargetProjectFolder = nil then
		    copyToFolder = self.projectFolder
		    
		  else
		    copyToFolder = TargetProjectFolder
		    
		  end if
		  
		  
		  var fldin as FolderItem = self.FullPath(copyFromFolder)
		  var tin as TextInputStream = TextInputStream.Open(fldin)
		  
		  var fldout as FolderItem = self.UpdatedFullPath(copyToFolder, true)
		  var tout as TextOutputStream = TextOutputStream.Create(fldout)
		  
		  System.DebugLog("Transfering " + self.FullPath(copyFromFolder).NativePath  + " to "  + self.UpdatedFullPath(copyToFolder, false).NativePath)
		  
		  while not tin.EndOfFile
		    tout.WriteLine(tin.ReadLine)
		    
		  wend
		  
		  tin.Close
		  tout.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateItemOnDisk(Body() as String) As Boolean
		  
		  
		  var fld as FolderItem = self.ProjectFolder
		  
		  var lastElement as String = self.updatedRelativePathElements(self.updatedRelativePathElements.LastIndex)
		  
		  var tout as TextOutputStream = nil
		  
		  for each t as string in self.updatedRelativePathElements
		    
		    if fld = nil then return false
		    
		    if t = lastElement then 
		      // Time to create our text file
		      tout = TextOutputStream.Create(fld.Child(t))
		      
		    elseif fld.Child(t).Exists then
		      fld = fld.Child(t)
		      
		    else
		      fld.Child(t).CreateFolder
		      fld = fld.Child(t)
		      System.DebugLog("CreateItemConstants created the folder " + fld.NativePath)
		      
		    end if
		    
		  next
		  
		  if tout = nil then return false
		  
		  for each s as string in Body
		    tout.WriteLine(s)
		    
		  next
		  
		  tout.Close
		  
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractItemConstants() As Dictionary
		  //
		  // Extract the values of all constants from the item passed as parameter.
		  // Normally used to extract the values defined in the library information module
		  //
		  // Parameters
		  // - itemToProcess: line from project file 'pointing' to the module to be processed
		  //
		  // Returns 
		  // - Dictionary with the constant name as key and the default value as value
		  //
		  
		  var results as new Dictionary
		  
		  var path as string = self.GetRelativePath()
		  
		  if path.Length = 0 then return results
		  
		  var fld as FolderItem = self.ProjectFolder
		  
		  var tmp() as string = path.Split("/")
		  
		  for each t as string in tmp
		    
		    if fld <> nil and fld.Child(t).Exists then
		      fld = fld.Child(t)
		      
		    else
		      System.DebugLog("Cannot find " + t + " under " + fld.NativePath)
		      fld = nil
		      
		    end if
		    
		  next
		  
		  var src() as string = LoadTextByLine(fld)
		  
		  for each t as string in src
		    //
		    // #tag Constant, Name = LibraryName, Type = String, Dynamic = False, Default = \"NiceLibrary", Scope = Protected
		    //
		    
		    if t.IndexOf("Constant") >0 and t.indexof("EndConstant") < 0 then 
		      var v1 as string = getValue(t, "Name")
		      var v2 as string = getValue(t, "Default")
		      results.Value(v1) = v2
		      
		    end if
		    
		    
		  next
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FullPath(alternateProjectFolder as FolderItem = nil) As FolderItem
		  
		  var f as FolderItem 
		  
		  if alternateProjectFolder = nil then
		    f = self.projectFolder
		  else
		    f = alternateProjectFolder
		    
		  end if
		   
		  for each s as string in self.relativePathElements
		    f = f.Child(s)
		    
		  next
		  
		  return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetloadedID() As int64
		  Return self.loadedOwnID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetloadedParentID() As int64
		  Return self.loadedParentID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMatchingChildren(pKeyValue as string) As clXojoProjectSourceLine()
		  var results() as clXojoProjectSourceLine
		  
		  for each item as clXojoProjectSourceLine in self.Children
		    
		    if item.isMatchingKey(pKeyValue) then
		      results.Add(item)
		      
		    end if
		    
		  next
		  
		  return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMatchingChildren(pKeyValue as string, pValue as string) As clXojoProjectSourceLine()
		  var results() as clXojoProjectSourceLine
		  
		  for each item as clXojoProjectSourceLine in self.Children
		    
		    if  item.isMatchingKeyValue(pKeyValue, pValue) then
		      results.Add(item)
		      
		    end if
		    
		  next
		  
		  return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRelativePath() As String
		  return String.FromArray(self.relativePathElements, "/")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRelativePathElements() As String()
		  
		  var results() as string
		  
		  for each s as string in self.relativePathElements
		    results.Add(s)
		    
		  next
		  
		  return results
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSourceLine(doUpdate as Boolean) As string
		  
		  if self.loadedFromProject then
		    //
		    // here we write a line loaded from a Xojo project file
		    // A correct layout is available
		    // We may have to update the ownID and the parentID
		    //
		    if not self.isItemForTree then
		      return self.source
		      
		    end if
		    
		    
		    if (loadedOwnID = updatedOwnID) and (loadedParentID = updatedParentID) then
		      return self.source
		      
		    end if
		    
		    var tmp as string = self.source
		    
		    tmp = tmp.Replace(loadedOwnIDStr, Hexa16(updatedOwnID))
		    tmp = tmp.Replace(loadedParentIDStr , Hexa16(updatedParentID))
		    
		    return tmp
		    
		  else
		    // 
		    // Here we create a line from scratch
		    //
		    
		    if not self.isItemForTree then return "" // Unsupported
		    
		    //
		    // Here, we should have a key, a value, a valid relative path, valid ownID, valid parentID
		    //
		    var lineitems() as string
		    
		    lineitems.Add(key + "=" + value)
		    lineitems.Add(GetUpdatedRelativePath)
		    lineitems.Add(Hexa16(updatedOwnID))
		    lineitems.Add(Hexa16(updatedParentID))
		    lineitems.Add("false") // all those items have a 'false' mark at the end
		    
		    Return String.FromArray(lineitems, ";")
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUpdatedRelativePath() As String
		  return String.FromArray(self.updatedRelativePathElements, "/")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMatchingAnyKeys(pKeyValues() as string) As Boolean
		  
		  for each k as string in pKeyValues
		    if self.isMatchingKey(k) then return true
		    
		  next
		  
		  return false
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMatchingKey(pKeyValue as string) As Boolean
		  Return self.key = pKeyValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMatchingKeyValue(pKeyValue as string, pValue as string) As Boolean
		  
		  Return self.key = pKeyValue and self.value.trim = pValue.trim
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessLine()
		  
		  var keyEndPosition as integer = Source.IndexOf("=")
		  var lineKey as string = Source.Left(keyEndPosition)
		  
		  var params() as string = Source.Middle(keyEndPosition+1, 999).Split(";")
		  
		  self.key = Source.Left(keyEndPosition)
		  
		  var startIndex as integer
		  
		  if params.LastIndex >= 0 then
		    self.value = params(0)
		    startIndex = 1
		    
		  else
		    startIndex = 0
		    
		  end if
		  
		  for i as integer = startIndex to params.LastIndex
		    self.parameters.Add(params(i))
		    
		  next
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetKeyValuesToDefault()
		  
		  self.loadedOwnIDStr = ""
		  self.loadedOwnID = -1
		  self.updatedOwnID = -1
		  
		  self.loadedParentIDStr = ""
		  self.loadedParentID = -1
		  self.updatedParentID = -1
		  
		  self.relativePathElements.RemoveAll
		  self.updatedRelativePathElements.RemoveAll
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRelativePath(prmRelativePath as string)
		  
		  self.relativePathElements = prmRelativePath.Split("/")
		  self.updatedRelativePathElements = prmRelativePath.Split("/")
		  
		  return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UpdatedFullPath(alternateProjectFolder as FolderItem, createMissingFolder as boolean) As FolderItem
		  
		  var f as FolderItem 
		  
		  if alternateProjectFolder = nil then
		    f = self.projectFolder
		  else
		    f = alternateProjectFolder
		    
		  end if
		  
		  var slast as string = self.UpdatedRelativePathElements(UpdatedRelativePathElements.LastIndex)
		  
		  for each s as string in self.updatedRelativePathElements
		    
		    f = f.Child(s)
		    
		    if not f.Exists and s <> slast and createMissingFolder then
		      f.CreateFolder
		      
		    end if
		    
		  next
		  
		  return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateKeyValue(prmKey as string, prmValue as string)
		  key = prmKey
		  value = prmValue
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateKeyValuesFromSource()
		  //
		  // item for tree should have at least three parameters:
		  // the relative path to the source file
		  // the item ID
		  // the parent item ID
		  //
		  
		  self.relativePathElements.RemoveAll
		  self.loadedOwnID = -1
		  self.loadedParentID = -1
		  
		  if not self.isItemForTree then return
		  
		  if self.parameters.LastIndex >= 0 then self.SetRelativePath(self.parameters(0))
		  
		  if self.parameters.LastIndex >= 1 then 
		    self.loadedOwnIDStr = self.parameters(1)
		    self.loadedOwnID = self.parameters(1).ToInt64
		    self.updatedOwnID = self.loadedOwnID
		    
		  end if
		  
		  if self.parameters.LastIndex >= 2 then 
		    self.loadedParentIDStr = self.parameters(2)
		    self.loadedParentID = self.parameters(2).ToInt64
		    self.updatedParentID = self.loadedParentID
		    
		  end if
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMatchingItemID(oldItemID as int64, newItemID as int64, traceUpdates as boolean = false)
		  
		  if self.loadedOwnID = oldItemID then
		    if traceUpdates then System.DebugLog("OwnID from " + self.loadedOwnID.ToString + " to " + newItemID.ToString)
		    self.updatedOwnID = newItemID
		    
		  end if
		  
		  if self.loadedParentID = oldItemID then
		    if traceUpdates then System.DebugLog("ParentID from " + self.loadedParentID.ToString + " to " + newItemID.ToString)
		    self.updatedParentID = newItemID
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMatchingPathElements(oldPath() as string, newPath() as string)
		  
		  if oldPath.Count <> newPath.count then
		    System.DebugLog("In " + CurrentMethodName + " array not same size.")
		    Return
		    
		  end if
		  
		  if oldPath.Count > self.updatedRelativePathElements.Count then
		    system.DebugLog("In " + CurrentMethodName + " new path too long")
		    Return
		    
		  end if
		  
		  for i as integer = 0 to oldPath.LastIndex
		    if self.updatedRelativePathElements(i) = oldPath(i) then 
		      self.updatedRelativePathElements(i) = newPath(i)
		      
		    end if
		    
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateOwnID(newID as int64)
		  self.updatedOwnID = newID
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateParentID(newID as int64)
		  self.updatedParentID = newID
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRelativePath(prmRelPath as string)
		  
		  self.updatedRelativePathElements = prmRelPath.Split("/")
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function wasLoaded() As Boolean
		  
		  return self.loadedFromProject
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Children() As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		isItemForTree As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		key As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private loadedFromProject As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected loadedOwnID As int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private loadedOwnIDStr As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected loadedParentID As int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private loadedParentIDStr As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected parameters() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		projectFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected relativePathElements() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected source As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected updatedOwnID As int64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected updatedParentID As int64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected updatedRelativePathElements() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		value As string
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
			Name="key"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isItemForTree"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
