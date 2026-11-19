#tag Class
Protected Class clXojoProjectSourceLine
	#tag Method, Flags = &h0
		Sub AddItemToChildren(item as clXojoProjectSourceLine)
		  
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
		Sub Constructor(sourceLine as string)
		  
		  self.Source = sourceLine
		  
		  self.ProcessLine()
		  
		  self.classify()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractKeyValues()
		  
		  if not self.isItemForTree then return
		  
		  // item for tree should have at least three parameters:
		  // the relative path to the source file
		  // the item ID
		  // the parent item ID
		  //
		  
		  self.relativePath = self.parameters(0)
		  self.originalOwnID = -1
		  self.originalParentID = -1
		  
		  
		  if self.parameters.LastIndex < 1 then return -1
		  
		  self.originalOwnID = self.parameters(1).ToInt64
		   
		  
		  if self.parameters.LastIndex < 2 then return -1
		  
		  self.originalParentID = self.parameters(2).ToInt64
		  
		  Return
		  
		  
		End Sub
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
		originalOwnID As int64
	#tag EndProperty

	#tag Property, Flags = &h0
		originalParentID As int64
	#tag EndProperty

	#tag Property, Flags = &h0
		parameters() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		relativePath As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		source As string
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
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
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
