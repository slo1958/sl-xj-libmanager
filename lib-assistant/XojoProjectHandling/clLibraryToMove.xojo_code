#tag Class
Protected Class clLibraryToMove
	#tag Method, Flags = &h0
		Sub Constructor(prmLibrarySource as string, prmLibrary as string)
		  
		  self.LibraryName = prmLibrary
		  self.LibrarySource = prmLibrarySource
		  self.ProjectSourceLine = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InPublished() As Boolean
		  
		  return self.LibrarySource = clXojoProjectConstants.ShareableText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InUsed() As Boolean
		  
		  return self.LibrarySource = clXojoProjectConstants.DestinationText
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		LibraryName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		LibrarySource As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectSourceLine As clXojoProjectSourceLine
	#tag EndProperty

	#tag Property, Flags = &h0
		TopIDInSource As int64
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
			Name="LibraryName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LibrarySource"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopIDInSource"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
