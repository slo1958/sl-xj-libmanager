#tag Class
Protected Class clLibDependency
	#tag Method, Flags = &h0
		Sub Constructor(Source as JSONItem)
		  
		  // {"Libary":"Another library","Version":"AAA"}
		  
		  try
		    self.mLibraryLabel = source.Value("Library")
		    self.mBaseVersion = source.Value("Version")
		    
		  Catch
		    self.mLibraryLabel = ""
		    self.mBaseVersion = ""
		    
		  end try
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryLabel() As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryVersionMaximum() As clLibraryVersionInfo
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryVersionMinimum() As clLibraryVersionInfo
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		mBaseVersion As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mLibraryLabel As string
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
	#tag EndViewBehavior
End Class
#tag EndClass
