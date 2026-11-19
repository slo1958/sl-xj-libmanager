#tag Module
Protected Module mdHelpers
	#tag Method, Flags = &h0
		Function IsExistingFIle(fld as FolderItem) As Boolean
		  if fld = nil then return false
		  
		  if not fld.Exists then return false
		  
		  return not fld.IsFolder
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsExistingFolder(fld as FolderItem) As Boolean
		  if fld = nil then return false
		  
		  if not fld.Exists then return false
		  
		  return fld.IsFolder
		  
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
End Module
#tag EndModule
