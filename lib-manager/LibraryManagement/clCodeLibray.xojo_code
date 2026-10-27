#tag Class
Protected Class clCodeLibray
	#tag Method, Flags = &h0
		Sub Constructor(JSONSource as String)
		  
		  var js as new JSONItem(JSONSource)
		  
		  //
		  // {"Signature":"Something","Information":{"Name":"Test library","Author":"John Doe"},"Requirements":[{"Libary":"Another library","Version":"AAA"},{"Libary":"A new library","Version":"AAA"}]}
		  //
		  
		  var stSignature as string = ""
		  var sgInformation as JSONItem = nil
		  var sgRequirements as JSONItem = nil
		  var sgReqArray() as JSONItem
		  var sgdep() as clLibDependency
		  
		  var x as integer
		  
		  for each k as string in js.Keys
		    
		    select case k
		      
		    case "Signature"
		      
		      try
		        stSignature = js.value(k)
		        
		      catch
		        
		      end try
		      
		      x=0
		      
		    case "Information"
		      sgInformation = js.value(k)
		      
		    case "Requirements"
		      sgRequirements = js.Child(k)
		      
		      if sgRequirements.IsArray then
		        
		        for i as integer = 0 to sgRequirements.LastRowIndex
		          sgReqArray.Add(sgRequirements.ValueAt(i))
		          
		          sgdep.Add(new clLibDependency(sgRequirements.ValueAt(i)))
		          
		        next
		        
		      end if
		       
		      
		    case else
		      
		    end select
		    
		    System.DebugLog(k)
		    
		  next
		  
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Description()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDependcies() As clLibDependency()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryLabel() As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryZipCache() As FolderItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Signature()
		  
		End Sub
	#tag EndMethod


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
