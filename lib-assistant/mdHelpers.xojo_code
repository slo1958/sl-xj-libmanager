#tag Module
Protected Module mdHelpers
	#tag Method, Flags = &h0
		Function FixStr(c as string, n as integer) As string
		  
		  
		  var results as string = ""
		  
		  for i as integer = 0 to n-1
		    results = results + c
		    
		  next
		  
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getValue(Source as string, key as string) As string
		  // #tag Constant, Name = LibraryName, Type = String, Dynamic = False, Default = \"NiceLibrary", Scope = Protected
		  
		  var idxKey as integer = Source.IndexOf(key)
		  var idxEqual as integer = source.IndexOf(idxKey+1, "=")
		  var idxComma as integer = source.IndexOf(idxEqual+1, ",")
		  
		  if idxKey < 0 or idxEqual < 0 or idxComma < 0 then return ""
		  
		  var ret as string =  source.Middle(idxEqual+1, idxComma - idxEqual-1).trim
		  
		  if ret.left(1) = "\" then ret = ret.Middle(1, 9999)
		  
		  if ret.left(1) = """" and ret.right(1) = """" then
		    ret = ret.middle(1, ret.Length-2)
		    
		  end if
		  
		  Return ret
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hexa16(v as int64) As String
		  
		  var tmp as string 
		  
		  tmp = Hex(v)
		  
		  tmp = right("0000000000000000" + tmp, 16)
		  
		  Return "&h"+tmp
		  
		  
		  
		End Function
	#tag EndMethod

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
