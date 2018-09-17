<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="00 - Parse Metadata" Type="Folder">
			<Item Name="ChangeTypeInternalVariables.vi" Type="VI" URL="../VIs/ParseMetadata/ChangeTypeInternalVariables.vi"/>
			<Item Name="Parse Metadata.vi" Type="VI" URL="../VIs/ParseMetadata/Parse Metadata.vi"/>
			<Item Name="Stage Format JSON input.vi" Type="VI" URL="../VIs/ParseMetadata/Stage Format JSON input.vi"/>
			<Item Name="Update Progress Bar from Data Type.vi" Type="VI" URL="../VIs/ParseMetadata/Update Progress Bar from Data Type.vi"/>
		</Item>
		<Item Name="01 - Convert File" Type="Folder">
			<Item Name="Binaryto TDMS converter11-30-2017.vi" Type="VI" URL="../VIs/ConvertFile/Binaryto TDMS converter11-30-2017.vi"/>
			<Item Name="CheckIfTDMS.vi" Type="VI" URL="../VIs/ConvertFile/CheckIfTDMS.vi"/>
			<Item Name="Stage Conditional Convert to TDMS.vi" Type="VI" URL="../VIs/ConvertFile/Stage Conditional Convert to TDMS.vi"/>
		</Item>
		<Item Name="02 - PlayFile" Type="Folder">
			<Item Name="Stage Playback with send.vi" Type="VI" URL="../VIs/PlayFile/Stage Playback with send.vi"/>
			<Item Name="TDMS Playback Functional.vi" Type="VI" URL="../VIs/PlayFile/TDMS Playback Functional.vi"/>
		</Item>
		<Item Name="03 - Send Message" Type="Folder">
			<Item Name="RF_Harness_InstructionsListener.vi" Type="VI" URL="../VIs/SendMessage/RF_Harness_InstructionsListener.vi"/>
			<Item Name="Stage Finished Playback.vi" Type="VI" URL="../VIs/SendMessage/Stage Finished Playback.vi"/>
		</Item>
		<Item Name="04 - Handle Error" Type="Folder">
			<Item Name="Move Error to Structure for Reporting.vi" Type="VI" URL="../VIs/ReportError/Move Error to Structure for Reporting.vi"/>
		</Item>
		<Item Name="99 - Others" Type="Folder">
			<Item Name="ChangeStateJumpToError.vi" Type="VI" URL="../VIs/MainVI/ChangeStateJumpToError.vi"/>
			<Item Name="GlobalVariableS.vi" Type="VI" URL="../VIs/MainVI/GlobalVariableS.vi"/>
			<Item Name="Loop Status.vi" Type="VI" URL="../VIs/MainVI/Loop Status.vi"/>
		</Item>
		<Item Name="LICENSE.txt" Type="Document" URL="../LICENSE.txt"/>
		<Item Name="README.txt" Type="Document" URL="../README.txt"/>
		<Item Name="v1" Type="Web Service">
			<Property Name="ws.guid" Type="Str">{4A3F3217-FC03-4DBB-8FFF-378D9BCEF986}</Property>
			<Item Name="Startup VIs" Type="Startup VIs Container"/>
			<Item Name="Web Resources" Type="HTTP WebResources Container">
				<Item Name="Main_System.vi" Type="VI" URL="../VIs/MainVI/Main_System.vi">
					<Property Name="ws.method" Type="Int">3</Property>
					<Property Name="ws.type" Type="Int">1</Property>
				</Item>
			</Item>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="niRFSG Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Close.vi"/>
				<Item Name="niRFSG Configure Output Enabled.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Configure Output Enabled.vi"/>
				<Item Name="niRFSG Configure RF.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Configure RF.vi"/>
				<Item Name="niRFSG Error Message.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Error Message.vi"/>
				<Item Name="niRFSG Get Session Reference.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Get Session Reference.vi"/>
				<Item Name="niRFSG Initialize With Options.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Initialize With Options.vi"/>
				<Item Name="niRFSG Initiate.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Initiate.vi"/>
				<Item Name="niRFSG IVI Error Converter.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG IVI Error Converter.vi"/>
				<Item Name="niRFSG Write Arb Waveform (Complex DBL).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (Complex DBL).vi"/>
				<Item Name="niRFSG Write Arb Waveform (Complex Input SGL).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (Complex Input SGL).vi"/>
				<Item Name="niRFSG Write Arb Waveform (Complex Input).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (Complex Input).vi"/>
				<Item Name="niRFSG Write Arb Waveform (Complex SGL).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (Complex SGL).vi"/>
				<Item Name="niRFSG Write Arb Waveform (CWDT SGL).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (CWDT SGL).vi"/>
				<Item Name="niRFSG Write Arb Waveform (CWDT).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (CWDT).vi"/>
				<Item Name="niRFSG Write Arb Waveform (Direct DMA).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (Direct DMA).vi"/>
				<Item Name="niRFSG Write Arb Waveform (I-Q SGL).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (I-Q SGL).vi"/>
				<Item Name="niRFSG Write Arb Waveform (I-Q).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (I-Q).vi"/>
				<Item Name="niRFSG Write Arb Waveform (I16).vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform (I16).vi"/>
				<Item Name="niRFSG Write Arb Waveform.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/niRFSG Write Arb Waveform.vi"/>
				<Item Name="rfsg_Validate I-Q Arrays.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/rfsg_Validate I-Q Arrays.vi"/>
				<Item Name="rfsg_Validate I16 Array.vi" Type="VI" URL="/&lt;instrlib&gt;/niRFSG/niRFSG.llb/rfsg_Validate I16 Array.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="AsciiToInt.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/AsciiToInt.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Clear-68016.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/Clear-68016.vi"/>
				<Item Name="ClearError.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/ClearError.vi"/>
				<Item Name="configureNumberOfValues.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/configureNumberOfValues.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="ExtractSubstring.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/ExtractSubstring.vi"/>
				<Item Name="fileViewerConfigData.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/fileViewerConfigData.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="formatPropertyList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/formatPropertyList.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get Type of Variant.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Get Type of Variant.vi"/>
				<Item Name="getChannelList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/getChannelList.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="getNamesFromPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/getNamesFromPath.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="GoTo.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/GoTo.vi"/>
				<Item Name="initFileContentsTree.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/initFileContentsTree.vi"/>
				<Item Name="InitFromConfiguration.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/InitFromConfiguration.vi"/>
				<Item Name="initHelpButtonVisibility.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/initHelpButtonVisibility.vi"/>
				<Item Name="InitScrollbarAndListBox.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/InitScrollbarAndListBox.vi"/>
				<Item Name="initTabValues.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/initTabValues.vi"/>
				<Item Name="LabVIEWHTTPClient.lvlib" Type="Library" URL="/&lt;vilib&gt;/httpClient/LabVIEWHTTPClient.lvlib"/>
				<Item Name="loadAndFormatValues.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/loadAndFormatValues.vi"/>
				<Item Name="LoadBufferForMultiListBoxAndFormat.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/LoadBufferForMultiListBoxAndFormat.vi"/>
				<Item Name="LogicalSort.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/LogicalSort.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="LVRowAndColumnUnsignedTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRowAndColumnUnsignedTypeDef.ctl"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_WebServices.lvlib" Type="Library" URL="/&lt;vilib&gt;/wsapi/NI_WebServices.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="panelResize_tdms.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/panelResize_tdms.vi"/>
				<Item Name="panelstate.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/panelstate.ctl"/>
				<Item Name="Path To Command Line String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Path To Command Line String.vi"/>
				<Item Name="PathToUNIXPathString.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/CFURL.llb/PathToUNIXPathString.vi"/>
				<Item Name="ScaleGetErr.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/ScaleGetErr.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="setListBoxColumnWidths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/setListBoxColumnWidths.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="sizeaction.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/sizeaction.ctl"/>
				<Item Name="status.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/status.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="TDMS - File Viewer.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS - File Viewer.vi"/>
				<Item Name="TDMS Create Scaling Information (Linear).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Linear).vi"/>
				<Item Name="TDMS Create Scaling Information (Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Polynomial).vi"/>
				<Item Name="TDMS Create Scaling Information (Reciprocal).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Reciprocal).vi"/>
				<Item Name="TDMS Create Scaling Information (RTD Resistance Configuration).ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (RTD Resistance Configuration).ctl"/>
				<Item Name="TDMS Create Scaling Information (RTD).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (RTD).vi"/>
				<Item Name="TDMS Create Scaling Information (Strain Config).ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Strain Config).ctl"/>
				<Item Name="TDMS Create Scaling Information (Strain).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Strain).vi"/>
				<Item Name="TDMS Create Scaling Information (Table).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Table).vi"/>
				<Item Name="TDMS Create Scaling Information (Thermistor).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Thermistor).vi"/>
				<Item Name="TDMS Create Scaling Information (Thermocouple Type).ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Thermocouple Type).ctl"/>
				<Item Name="TDMS Create Scaling Information (Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information (Thermocouple).vi"/>
				<Item Name="TDMS Create Scaling Information.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Create Scaling Information.vi"/>
				<Item Name="TDMS Creating Scaling Information (Thermistor Excitation Type).ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMS Creating Scaling Information (Thermistor Excitation Type).ctl"/>
				<Item Name="TDMSFileViewer_LaunchHelp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMSFileViewer_LaunchHelp.vi"/>
				<Item Name="TDMSFileViewerLocalizedText.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/TDMSFileViewerLocalizedText.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Type Enum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Enum.ctl"/>
				<Item Name="UpdateBufferForMultiListBoxIfNecessary.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/UpdateBufferForMultiListBoxIfNecessary.vi"/>
				<Item Name="UpdateListBoxAfterKeyEvent.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/UpdateListBoxAfterKeyEvent.vi"/>
				<Item Name="UpdateScrollbarBeforeKeyEvent.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/UpdateScrollbarBeforeKeyEvent.vi"/>
				<Item Name="VariantType to Type Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/VariantType to Type Code.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="DMA Output ConfigureMod.vi" Type="VI" URL="../VIs/PlayFile/Player/DMA Output ConfigureMod.vi"/>
			<Item Name="DMA Output DisableMod.vi" Type="VI" URL="../VIs/PlayFile/Player/DMA Output DisableMod.vi"/>
			<Item Name="DMA Output StatusMod.vi" Type="VI" URL="../VIs/PlayFile/Player/DMA Output StatusMod.vi"/>
			<Item Name="DMA WriteMod3.vi" Type="VI" URL="../VIs/PlayFile/Player/DMA WriteMod3.vi"/>
			<Item Name="NiFpgaLv.dll" Type="Document" URL="NiFpgaLv.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niRFSG_64.dll" Type="Document" URL="niRFSG_64.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Output Select and EnableMod.vi" Type="VI" URL="../VIs/PlayFile/Player/Output Select and EnableMod.vi"/>
			<Item Name="Output StatusMod2.vi" Type="VI" URL="../VIs/PlayFile/Player/Output StatusMod2.vi"/>
			<Item Name="RF Internal Data Structure (string).ctl" Type="VI" URL="../VIs/TypeDef/RF Internal Data Structure (string).ctl"/>
			<Item Name="RF Internal Data Structure (types).ctl" Type="VI" URL="../VIs/TypeDef/RF Internal Data Structure (types).ctl"/>
			<Item Name="RF_StateMachine.ctl" Type="VI" URL="../VIs/TypeDef/RF_StateMachine.ctl"/>
			<Item Name="SpectrumAnn SCPI commands.vi" Type="VI" URL="../VIs/PlayFile/Player/SpectrumAnn SCPI commands.vi"/>
			<Item Name="ws_runtime.dll" Type="Document" URL="ws_runtime.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
