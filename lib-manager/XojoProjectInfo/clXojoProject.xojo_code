#tag Class
Protected Class clXojoProject
	#tag Method, Flags = &h0
		Sub Constructor(ProjectFolder as FolderItem)
		  
		  self.ProjFolder = ProjectFolder
		  
		  LocateProject()
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LocateProject()
		  var projectfolder as FolderItem = self.ProjFolder
		  var projectFile as FolderItem = nil
		  
		  var xtend as string = "xojo_project"
		  
		  for each fld as FolderItem in projectfolder.Children
		    if fld.IsFolder then
		      
		    elseif fld.Extension = xtend then
		      projectFile = fld
		      
		    else
		      
		    end if
		    
		  next
		  
		  var s() as string = TextInputStream.Open(projectFile).ReadAll.Split(chr(10))
		  
		  const keyFolder as String = "Folder="
		  const shareable as string = clXojoProjectItem.ShareableText
		  
		  //
		  // RBProjectVersion=2026.021
		  // Folder=Shareable;Shareable;&h00000000455A6FFF;&h0000000000000000;false
		  // Class=clClass1;Shareable/clClass1.xojo_code;&h000000000BA74FFF;&h00000000455A6FFF;false
		  // Module=mdBase;Shareable/mdBase.xojo_code;&h00000000694717FF;&h00000000455A6FFF;false
		  //
		  var hasShareable as Boolean = false
		  
		  for each line as string in s
		    if line.left(keyFolder.Length) = keyFolder then
		      hasShareable = true
		      
		    end if
		    
		    
		  next
		  
		  for each line as string in s
		    var item as clXojoProjectItemBase = clXojoProjectItemBase.ProcessLine(line)
		    
		    if item = nil then
		      
		    elseif item isa clXojoProjectFolder then
		      self.ProjFolderBase = clXojoProjectFolder(item)
		      
		    elseif item isa clXojoProjectItem then
		      self.ProjectItems.Add(clXojoProjectItem(item))
		      
		    end if
		    
		    if item <> nil then
		      item.Dump
		      
		    end if
		    
		  next
		  
		  Return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ProjectItems() As clXojoProjectItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjFolderBase As clXojoProjectFolder
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
