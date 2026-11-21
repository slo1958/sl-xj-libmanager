#tag Module
Protected Module GitHubHelper
	#tag Method, Flags = &h0
		Function LocateTags(SourceText as string, GitHubRepoOwner as string, GitHubRepoName as string) As string()
		  
		  //href="/slo1958/sl-xj-lib-loging/archive/refs/tags/BaseVersion2026.zip"
		  
		  var ReturnStr() as string
		  var SearchStr as string = "href=""/$owner/$repo"
		  var currentIndex as integer
		  var previousIndex as integer = 0
		  var zipIndex as integer
		  var closingIndex as integer
		  
		  SearchStr = SearchStr.ReplaceAll("$owner", GitHubRepoOwner)
		  SearchStr = SearchStr.ReplaceAll("$repo", GitHubRepoName)
		  
		  
		  currentIndex = SourceText.IndexOf(previousIndex, SearchStr)
		  
		  while currentIndex > 0 
		    zipIndex = SourceText.IndexOf(currentIndex + SearchStr.Length, ".zip")
		    closingIndex = SourceText.IndexOf(currentIndex + SearchStr.Length, ">")
		    
		    if zipIndex > currentIndex and closingIndex > zipIndex then
		      var tempStr as string = SourceText.Middle(currentIndex, zipIndex - currentIndex)
		      
		      var slashIndex as integer = tempStr.IndexOf("/")
		      if slashIndex > 0 then tempStr = tempStr.Middle(slashindex, 99999)
		      
		      ReturnStr.Add(tempStr)
		      
		    end if
		    
		    previousIndex = currentIndex + SearchStr.Length
		    currentIndex = SourceText.IndexOf(previousIndex, SearchStr)
		    
		  wend
		  
		  return ReturnStr
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Untitled
		
		//
		// For a GitHub repo, there's a zip at https://github.com/<user>/<repo>/archive/<branch>.zip, 
		// so you can download it with:
		// wget https://github.com/<user>/<repo>/archive/<branch>.zip
		//
		//
		// GH_USER=REPLACE_WITH_USER \
		// GH_REPO=REPLACE_WITH_REPO \
		// GH_BRANCH=REPLACE_WITH_BRANCH \
		// wget https://github.com/${GH_USER}/${GH_REPO}/archive/refs/tags/${GH_BRANCH}.zip \
		// -O "${GH_REPO}-${GH_BRANCH}.zip" && \ 
		// unzip ./"${GH_REPO}-${GH_BRANCH}.zip" && \
		// rm ./"${GH_REPO}-${GH_BRANCH}.zip"
		
		
		
		var GH_RepoOwner as string = "slo1958"
		var GH_RepoName as string = "sl-xj-lib-loging"
		var GH_RepoBranch as string = "BaseVersion2026"
		
		
		var repo_url as string = "https://github.com/${GH_USER}/${GH_REPO}/archive/refs/tags/${GH_BRANCH}.zip"
		
		repo_url = repo_url.ReplaceAll("${GH_USER}", GH_RepoOwner)
		repo_url = repo_url.ReplaceAll("${GH_REPO}", GH_RepoName)
		repo_url = repo_url.ReplaceAll("${GH_BRANCH}", GH_RepoBranch)
		
		repo_url = "https://github.com/slo1958/sl-xj-lib-loging/tags"
		repo_url = "https://github.com/slo1958/sl-xj-lib-data/tags"
		
		System.DebugLog(repo_url)
		
		URLConnection1.Send("GET",repo_url)
		
		
		
		
	#tag EndNote


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
End Module
#tag EndModule
