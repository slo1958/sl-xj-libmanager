#tag Class
Protected Class clXojoLibraryInfo
	#tag Method, Flags = &h0
		Sub Constructor(source as Dictionary, projectFolderName as string)
		  
		  if source <> nil then
		    self.Author = Source.Lookup(cstLibraryAuthor, "Unknown")
		    self.Name = Source.Lookup(cstLibraryName, projectFolderName)
		    self.Version = source.Lookup(cstLibraryVersion, "Unspecified")
		    self.projName = projectFolderName
		    
		  else
		    self.Author = "Unknown"
		    self.Name = projectFolderName
		    self.Version = "Unspecified"
		    self.projName = projectFolderName
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLibraryInfoModuleTemplate(LibraryName as string, LibraryVersion as string, AuthorName as string) As string()
		  
		  var results() as string
		  
		  var tempStr as String
		  
		  var tempLibName as string = LibraryName
		  
		  // TODO: clean up library name
		  
		  results.add("#tag Module")
		  results.add(ReplacePlaceHolders("Module LibraryInfo_%0" , tempLibName))
		  
		  tempStr = "#tag Constant, Name = %0, Type = String, Dynamic = False, Default = \""%1"", Scope = Public"
		  
		  results.add(ReplacePlaceholders(tempStr, cstLibraryName, LibraryName))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  results.add(ReplacePlaceholders(tempStr, cstLibraryVersion, LibraryVersion))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  
		  results.add(ReplacePlaceholders(tempStr, cstLibraryAuthor, AuthorName))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  results.add("End Module")
		  results.Add("#tag EndModule")
		  
		  Return results
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Author As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectAttributes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		projName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As string
	#tag EndProperty


	#tag Constant, Name = cstLibraryAuthor, Type = String, Dynamic = False, Default = \"LibraryAuthor", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cstLibraryName, Type = String, Dynamic = False, Default = \"LibraryName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cstLibraryVersion, Type = String, Dynamic = False, Default = \"LibraryVersion", Scope = Public
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
			Name="Author"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Path"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="projName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
