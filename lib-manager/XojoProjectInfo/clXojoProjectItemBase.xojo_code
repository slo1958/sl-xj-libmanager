#tag Class
Protected Class clXojoProjectItemBase
	#tag Method, Flags = &h0
		Sub Constructor(Source as String, Key as string, params() as string)
		  
		  self.SourceLine = source
		  self.KeyString = key
		  
		  self.paramStr.RemoveAll
		  
		  for each s as string in params
		    self.paramStr.Add(s)
		    
		  next
		  
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
		Function IsLibraryInfoModule() As Boolean
		  
		  Return self.KeyString = "Module" and self.GetName.left(ModNameForInfo.Length) = ModNameForInfo
		   
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
		KeyString As string
	#tag EndProperty

	#tag Property, Flags = &h0
		paramStr() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLine As string
	#tag EndProperty


	#tag Constant, Name = ModNameForInfo, Type = String, Dynamic = False, Default = \"LibraryInfo", Scope = Public
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
			Name="SourceLine"
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
