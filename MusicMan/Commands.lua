
MusicManCommand = Turbine.ShellCommand();

------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function MusicManCommand:Execute( command, arguments )

	if ( arguments == "help" ) then
		Turbine.Shell.WriteLine(Strings.PluginHelp);
	elseif ( arguments == "show" ) then
		--Turbine.Shell.WriteLine("Show the MusicMan Window");
		MusicManWindow:SetVisible(true);
		settings.isWindowVisible = true;
		SaveSettings();
	elseif ( arguments == "hide" ) then
		--Turbine.Shell.WriteLine("Hide the MusicMan Window");
		MusicManWindow:SetVisible(false);
		settings.isWindowVisible = false;
		SaveSettings();
	elseif ( arguments == "options" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginOptionShowWindow);
		OptionsWindow:SetVisible(true);
		MusicManWindow:SetVisible(false);
		settings.isWindowVisible = false;
		settings.isOptionsWindowVisible = true;
	elseif ( arguments == "toggle" ) then
		if(settings.isWindowVisible == true)then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowHide);
			MusicManWindow:SetVisible(false);
			settings.isWindowVisible = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowShow);
			MusicManWindow:SetVisible(true);
			settings.isWindowVisible = true;
		end
		SaveSettings();
------------------------------------------------------------------------------------------
-- alt command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings.altEnable == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltDesable);
			settings.altEnable = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltEnable);
			settings.altEnable = true;
		end
		SaveSettings();
	elseif ( arguments == "clear" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginClear);
		settings.shortcutData_2 = tostring(""); 
		settings.shortcutData_3 = tostring(""); 
		settings.shortcutType_2 = tostring("0");
		settings.shortcutType_3 = tostring("0");
		centerQS2:SetShortcut(Turbine.UI.Lotro.Shortcut()); 
		SaveSettings();
	end
end

Turbine.Shell.AddCommand( "Mu;MusicMan", MusicManCommand );