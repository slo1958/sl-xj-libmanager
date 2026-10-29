#tag Class
Protected Class clXojoProjectItem
	#tag Method, Flags = &h0
		Sub Constructor(SourceLine as integer, Source as String, Key as string, params() as string, FolderOfInterest as string)
		  
		  Self.SourceLineNumber= SourceLine
		  self.SourceLineStr = source
		  self.KeyString = key
		  self.AddedToTree = False
		  
		  self.paramStr.RemoveAll
		  
		  for each s as string in params
		    self.paramStr.Add(s)
		    
		  next
		  
		  
		  if key  = "Folder" and self.paramStr(0) = FolderOfInterest then
		    self.FolderID = self.paramStr(2)
		    
		  end if
		  
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Dump()
		  
		  System.DebugLog(self.ToString())
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetName() As String
		  
		  return self.paramStr(0)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOwnID() As string
		  Return paramStr(2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParentID() As string
		  Return paramStr(3)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPath() As string
		  return self.paramStr(1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolder() As boolean
		  
		  return self.KeyString = FolderKeyString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolderOfInterest(FolderOfInterest as string) As Boolean
		  return self.IsFolder() and paramStr(0) = FolderOfInterest 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLibraryInfoModule() As Boolean
		  
		  Return self.KeyString = ModuleKeyString and self.GetName.left(ModNameForInfo.Length) = ModNameForInfo
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLibraryTopFolder(FolderOfInterest as string) As boolean
		  
		  var NbSubfolders as integer = paramStr(1).Middle(FolderOfInterest.Length+1,9999).IndexOf("/")
		  
		  return self.IsFolder and paramStr(1).Left(FolderOfInterest.Length+1) = FolderOfInterest+"/" and paramStr(1).Middle(FolderOfInterest.Length+1,9999).IndexOf("/") < 1
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(fullContent as Boolean = true) As String
		  
		  if fullContent then
		    return KeyString  _
		    +"..." + paramStr(0) _
		    +"..." + paramStr(1) _
		    +"..." + paramStr(2) _
		    +"..." + paramStr(3) _
		    +" ["  +  paramStr.LastIndex.ToString+ "]" 
		    
		  else
		    return paramStr(0) _
		    +"..." + paramStr(1) _
		    +"..." + paramStr(2) _
		    +"..." + paramStr(3) 
		  end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AddedToTree As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Children() As clXojoProjectItem
	#tag EndProperty

	#tag Property, Flags = &h0
		FolderID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		KeyString As string
	#tag EndProperty

	#tag Property, Flags = &h0
		paramStr() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLineNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLineStr As string
	#tag EndProperty


	#tag Constant, Name = FolderKeyString, Type = String, Dynamic = False, Default = \"Folder", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ModNameForInfo, Type = String, Dynamic = False, Default = \"LibraryInfo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ModuleKeyString, Type = String, Dynamic = False, Default = \"Module", Scope = Private
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
		#tag ViewProperty
			Name="SourceLineStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
