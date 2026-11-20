#tag Class
Protected Class clXojoSCAConfiguration
	#tag Method, Flags = &h0
		Function Clone() As clXojoSCAConfiguration
		  
		  var results as new clXojoSCAConfiguration("")
		  
		  results.XojoFolderBase = self.XojoFolderBase
		  
		  Return results
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(filename as string)
		  
		  self.prefFilename = filename
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilePath() As FolderItem
		  
		  var results as FolderItem = SpecialFolder.ApplicationData
		  
		  results = results.Child(self.prefFilename)
		  
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load() As Boolean
		  var currentSection as string
		  
		  if not FilePath.Exists then return false
		  
		  var src as TextInputStream = TextInputStream.Open(FilePath)
		  
		  while not src.EndOfFile
		    var s as string = src.ReadLine
		    var equIndex as integer = s.IndexOf("=")
		    
		    
		    if s.left(1) = "[" and s.right(1) = "]" then
		      currentSection =  s.Middle(1, s.Length-2).Trim
		      
		      if self.Sections.IndexOf(currentSection)  < 0 then self.Sections.Add(currentSection)
		      
		      
		    elseif equIndex > 0 then
		      var k as string = s.Left(equIndex).Trim
		      var v as string = s.Right(s.Length - equIndex - 1).Trim
		      
		      UseKeyValue(currentSection, k, v)
		      
		    else 
		      UseKeyValue(currentSection, s)
		      
		      
		    end if
		    
		    
		    
		    
		    
		    
		  wend
		  
		  src.close
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  if FilePath.Exists then 
		    var tn as string = FilePath.Name
		    
		    var bu as String = DateTime.Now.SQLDateTime.ReplaceAll(":","").ReplaceAll("-","").ReplaceAll(" ","-")
		    
		    // assumption: the file name does not contain .txt
		    
		    tn = tn.Replace(".txt", "-[" + bu + "].txt")
		    
		    System.DebugLog("Rename " + FilePath.Name+" to " + tn)
		    
		    FilePath.Name = tn
		    
		  end if
		  
		  var src as TextOutputStream = TextOutputStream.Create(FilePath)
		  
		  // save the main parameters
		  
		  src.WriteLine(cstKeyXojoBaseFolder + "=" + self.XojoFolderBase)
		  
		  src.Close
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateFrom(src as clXojoSCAConfiguration)
		  
		  self.XojoFolderBase = src.XojoFolderBase
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseKeyValue(section as string, key as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseKeyValue(section as string, key as string, value as string)
		  
		  
		  if section = "" then 
		    
		    select case key
		      
		    case cstKeyXojoBaseFolder
		      self.mXojoFolderBase = value
		      
		      
		    case else
		      
		    end Select
		    
		  end if
		  
		  return
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mXojoFolderBase As string
	#tag EndProperty

	#tag Property, Flags = &h0
		prefFilename As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Sections() As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mXojoFolderBase
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mXojoFolderBase = value
			End Set
		#tag EndSetter
		XojoFolderBase As string
	#tag EndComputedProperty


	#tag Constant, Name = cstKeyXojoBaseFolder, Type = String, Dynamic = False, Default = \"XojoBaseFolder", Scope = Public
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
			Name="prefFilename"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
