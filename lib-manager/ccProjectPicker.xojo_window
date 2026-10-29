#tag DesktopWindow
Begin DesktopContainer ccProjectPicker
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   40
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   False
   Visible         =   True
   Width           =   666
   Begin DesktopLabel lbl_Target
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      Left            =   119
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select your target project. "
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   419
   End
   Begin DesktopButton btn_selectTarget
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Select xyz"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   107
   End
   Begin DesktopButton btn_ClearTarget
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   566
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Prepare(ButtonLabel as string, Message as string, projMode as clXojoProject.UsedAs, log as itfShareProgress)
		  self.DefaultXForText = lbl_Target.left
		  self.TextForButton = ButtonLabel
		  self.TextForLabel = Message
		  self.LogWriter = log
		  self.mode = projMode
		  
		  btn_selectTarget.Caption = ButtonLabel
		  UpdateTargetSelectionUI(nil)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SelectProject(mode as clXojoProject.UsedAs) As clXojoProject
		  Var dlg As New SelectFolderDialog
		  
		  dlg.ActionButtonCaption = "Select"
		  dlg.Title = "Title Property"
		  dlg.PromptText = "Select the folder containing the project"
		  
		  #If Not TargetLinux Then
		    dlg.InitialFolder = SpecialFolder.Documents
		    
		  #Else ' open Home directory on linux
		    dlg.InitialFolder = SpecialFolder.Home
		    
		  #EndIf
		  
		  Var f As FolderItem = dlg.ShowModal
		  
		  if f = nil then Return nil
		  
		  var p as new clXojoProject(f, mode, LogWriter)
		  
		  return p
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateTargetSelectionUI(SelectedTarget as clXojoProject)
		  
		  if SelectedTarget = nil then
		    lbl_Target.left = self.DefaultXForText
		    lbl_Target.text = self.TextForLabel
		    btn_selectTarget.Visible = true
		    btn_ClearTarget.Visible = false
		    self.selectedProject = nil
		    
		  else
		    self.lbl_Target.text = SelectedTarget.ProjFolderItem.Name
		    self.selectedProject = SelectedTarget
		    btn_selectTarget.Visible = false
		    btn_ClearTarget.Visible = true
		    self.lbl_Target.left = btn_selectTarget.Left+1
		    
		  end if
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DefaultXForText As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LogWriter As itfShareProgress
	#tag EndProperty

	#tag Property, Flags = &h0
		mode As clXojoProject.UsedAs
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedProject As clXojoProject
	#tag EndProperty

	#tag Property, Flags = &h0
		TextForButton As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TextForLabel As String
	#tag EndProperty


#tag EndWindowCode

#tag Events btn_selectTarget
	#tag Event
		Sub Pressed()
		  var f as clXojoProject =  SelectProject(self.mode)
		  
		  UpdateTargetSelectionUI(f)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_ClearTarget
	#tag Event
		Sub Pressed()
		  
		  UpdateTargetSelectionUI(nil)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Super"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextForButton"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextForLabel"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultXForText"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mode"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="clXojoProject.UsedAs"
		EditorType="Enum"
		#tag EnumValues
			"0 - Destination"
			"1 - LibrarySource"
			"2 - SomethingElse"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
