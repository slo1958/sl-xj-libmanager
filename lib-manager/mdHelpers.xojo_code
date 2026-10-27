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


End Module
#tag EndModule
