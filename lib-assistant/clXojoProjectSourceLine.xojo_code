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
		Sub Constructor()
		  
		  self.source = ""
		  self.loadedFromProject = false
		  
		  self.isItemForTree = true
		  
		  self.SetKeyValuesToDefault()
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sourceLine as string)
		  
		  self.Source = sourceLine
		  
		  self.ProcessLine()
		  
		  self.classify()
		  
		  self.SetKeyValuesToDefault()
		  
		  self.UpdateKeyValuesFromSource()
		  
		  self.loadedFromProject = true
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSourceLine(doUpdate as Boolean) As string
		  
		  if self.loadedFromProject then
		    //
		    // here we write a line loaded from a Xojo project file
		    // A correct layout is available
		    // We may have to update the ownID and the parentID
		    //
		    if not self.isItemForTree then
		      return self.source
		      
		    end if
		    
		    
		    if (originalOwnID = updatedOwnID) and (originalParentID = updatedParentID) then
		      return self.source
		      
		    end if
		    
		    var tmp as string = self.source
		    
		    tmp = tmp.Replace(originalOwnIDStr, Hexa16(updatedOwnID))
		    tmp = tmp.Replace(originalParentIDStr , Hexa16(updatedParentID))
		    
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
		    lineitems.Add(relativePath)
		    lineitems.Add(Hexa16(updatedOwnID))
		    lineitems.Add(Hexa16(updatedParentID))
		    lineitems.Add("false") // all those items have a 'false' mark at the end
		    
		    Return String.FromArray(lineitems, ";")
		    
		  end if
		  
		  
		  
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
		  
		  self.originalOwnIDStr = ""
		  self.originalOwnID = -1
		  self.updatedOwnID = -1
		  
		  self.originalParentIDStr = ""
		  self.originalParentID = -1
		  self.updatedParentID = -1
		  
		  self.relativePath = ""
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateItemID(oldItemID as int64, newItemID as int64)
		  
		  if self.originalOwnID = oldItemID then
		    self.updatedOwnID = newItemID
		    
		  end if
		  
		  if self.originalParentID = oldItemID then
		    self.updatedParentID = newItemID
		    
		  end if
		  
		End Sub
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
		  
		  self.relativePath = ""
		  self.originalOwnID = -1
		  self.originalParentID = -1
		  
		  if not self.isItemForTree then return
		  
		  if self.parameters.LastIndex >= 0 then self.relativePath = self.parameters(0)
		  
		  if self.parameters.LastIndex >= 1 then 
		    self.originalOwnIDStr = self.parameters(1)
		    self.originalOwnID = self.parameters(1).ToInt64
		    self.updatedOwnID = self.originalOwnID
		    
		  end if
		  
		  if self.parameters.LastIndex >= 2 then 
		    self.originalParentIDStr = self.parameters(2)
		    self.originalParentID = self.parameters(2).ToInt64
		    self.updatedParentID = self.originalParentID
		    
		  end if
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRelPath(prmRelPath as string)
		  relativePath = prmRelPath
		  
		  Return
		End Sub
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

	#tag Property, Flags = &h0
		loadedFromProject As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		originalOwnID As int64
	#tag EndProperty

	#tag Property, Flags = &h0
		originalOwnIDStr As String
	#tag EndProperty

	#tag Property, Flags = &h0
		originalParentID As int64
	#tag EndProperty

	#tag Property, Flags = &h0
		originalParentIDStr As string
	#tag EndProperty

	#tag Property, Flags = &h0
		parameters() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		relativePath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		source As string
	#tag EndProperty

	#tag Property, Flags = &h0
		updatedOwnID As int64
	#tag EndProperty

	#tag Property, Flags = &h0
		updatedParentID As int64
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
			Name="source"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="originalOwnID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="int64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="originalOwnIDStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="originalParentID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="int64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="originalParentIDStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="relativePath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="updatedOwnID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="int64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="updatedParentID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="int64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
