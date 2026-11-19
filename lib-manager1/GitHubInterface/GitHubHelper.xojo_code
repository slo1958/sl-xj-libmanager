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


End Module
#tag EndModule
