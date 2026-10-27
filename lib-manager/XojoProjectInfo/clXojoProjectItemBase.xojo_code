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
		  System.DebugLog(KeyString  _
		  +"..." + paramStr(0) _
		  +"..." + paramStr(1) _
		  +"..." + paramStr(2) _
		  +"..." + paramStr(3) _
		  +" ["  +  paramStr.LastIndex.ToString+ "]" _
		  )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ProcessLine(Source as String) As clXojoProjectItemBase
		  
		  
		  var ret as clXojoProjectItemBase = nil
		  
		  var keyEndPosition as integer = Source.IndexOf("=")
		  var lineKey as string = Source.Left(keyEndPosition)
		  
		  var params() as string = Source.Middle(keyEndPosition+1, 999).Split(";")
		  
		   
		  if params.LastIndex >= 4 and params(1).left(clXojoProjectItem.ShareableText.Length) = clXojoProjectItem.ShareableText then
		    
		    if Linekey  = "Folder" and params(0) = ShareableText then
		      ret  = new clXojoProjectFolder(source, lineKey, params)
		      
		    else
		      ret  = new clXojoProjectItem(source, lineKey, params)
		      
		    end if
		    
		  end if
		  
		  Return ret
		  
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


	#tag Constant, Name = ShareableText, Type = String, Dynamic = False, Default = \"Shareable", Scope = Public
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
