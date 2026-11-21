#tag Class
Protected Class clXojoLibraryInfo
	#tag Method, Flags = &h0
		Sub Constructor(source as Dictionary, projectFolderName as string)
		  
		  if source <> nil then
		    self.Author = Source.Lookup(cstLibraryAuthor, "Unknown")
		    self.Name = Source.Lookup(cstLibraryName, projectFolderName)
		    self.Version = source.Lookup(cstLibraryVersion, "Unspecified")
		    self.projName = projectFolderName
		    self.Requirements = source.Lookup(cstLibraryRequirement,"")
		    
		  else
		    self.Author = "Unknown"
		    self.Name = projectFolderName
		    self.Version = "Unspecified"
		    self.projName = projectFolderName
		    self.Requirements = source.Lookup(cstLibraryRequirement,"")
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(prmLibraryName as string, projectFolderName as string)
		  
		  self.Author = "Unknown"
		  self.Name = CleanName(prmLibraryName)
		  self.NameByUser = prmLibraryName.trim
		  self.Version = "Unspecified"
		  self.projName = projectFolderName
		  self.Requirements = ""
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DefaultModuleName() As String
		  
		  return clXojoProjectConstants.LibraryInfoSubstring + "_" + self.Name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLibraryInfoModuleBody() As string()
		  
		  var results() as string
		  
		  var template as string = "#tag Constant, Name = %0, Type = String, Dynamic = False, Default = \""%1"", Scope = Public"
		  
		  // TODO: clean up library name
		  
		  results.add("#tag Module")
		  results.add(ReplacePlaceHolders("Module %0" , self.DefaultModuleName))
		  
		  results.add(ReplacePlaceholders(template, cstLibraryName, self.LibraryNameByUser()))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  results.add(ReplacePlaceholders(template, cstLibraryVersion, self.LibraryVersion))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  
		  results.add(ReplacePlaceholders(template, cstLibraryAuthor, self.LibraryAuthor))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  results.Add(ReplacePlaceholders(template, cstLibraryRequirement, self.LibraryRequirements))
		  results.add("#tag EndConstant")
		  results.add("")
		  
		  
		  results.add("End Module")
		  results.Add("#tag EndModule")
		  
		  Return results
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryAuthor() As String
		  
		  return self.Author
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryName() As string
		  
		  Return self.Name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryNameByUser() As string
		  
		  Return self.NameByUser
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryRequirements() As String
		  
		  return self.Requirements
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryVersion() As string
		  Return self.Version
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Author As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequirements As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Name As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NameByUser As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PathO As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectAttributes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		projName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Required() As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRequirements
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRequirements = value
			  
			  if value.Trim.Length = 0 then
			    self.Required.RemoveAll
			    
			  else
			    self.Required = value.Split(",")
			    
			  end if
			  
			  Return
			End Set
		#tag EndSetter
		Requirements As string
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Version As string
	#tag EndProperty


	#tag Constant, Name = cstLibraryAuthor, Type = String, Dynamic = False, Default = \"LibraryAuthor", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cstLibraryName, Type = String, Dynamic = False, Default = \"LibraryName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cstLibraryRequirement, Type = String, Dynamic = False, Default = \"Requires", Scope = Public
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
			Name="PathO"
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
