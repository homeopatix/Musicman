------------------------------------------------------------------------------------------
-- import librarys
------------------------------------------------------------------------------------------
import "Homeopatix.MusicMan.Librarys";

Turbine.Shell.WriteLine("<rgb=#DAA520>MusicMan</rgb> <rgb=#DDDDDD>Version " .. plugin:GetVersion() .. " par Homeo</rgb>")

CreateLocalizationInfo();
LoadSettings();

------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
CreatMainWindow();
GenerateOptionsWindow();

if(settings.shortcutData_2 ~= "")then
	MusicManWindow:SetVisible( true );
	OptionsWindow:SetVisible( false ); 
	settings.isWindowVisible = true ;
	settings.isOptionsWindowVisible = false ;
else
	OptionsWindow:SetVisible( true ); 
	MusicManWindow:SetVisible( false );
	settings.isWindowVisible = false ;
	settings.isOptionsWindowVisible = true ;
end

------------------------------------------------------------------------------------------
-- mouse enter handler
------------------------------------------------------------------------------------------
SetMouseEnter();

------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
ClosingWindow();
EscapeKeyHandler();
------------------------------------------------------------------------------------------
-- handle minimizeIcon
------------------------------------------------------------------------------------------
if(settings.isWindowVisible == "true") then
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, MusicManWindow:SetVisible(true));
else
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, MusicManWindow:SetVisible(false));
end
MainMinimizedIcon:SetPosition(settings.minimizeX, settings.minimizeY);
MainMinimizedIcon:SetZOrder(0);

MainMinimizedIcon.PositionChanged = function()
	settings.minimizeX = MainMinimizedIcon:GetLeft();
	settings.minimizeY = MainMinimizedIcon:GetTop();
	SaveSettings();
end
