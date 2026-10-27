#tag Class
Protected Class clXojoProjectItem
Inherits clXojoProjectItemBase
	#tag Method, Flags = &h0
		Sub Constructor(Source as String, Key as string, params() as string)
		  
		  super.Constructor(Source, Key, params)
		  
		  self.ItemID = self.paramStr(2)
		  
		  self.ParentFolderID = self.paramStr(3)
		  
		  Return
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ItemID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentFolderID As string
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
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
