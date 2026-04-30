------------------------------------------------------------------------------------------
-- OptionWindow file
-- Written by Homeopatix
-- 7 january 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define size of the window
------------------------------------------------------------------------------------------
local windowWidth = 0;
local windowHeight = 0;
local positionInitiale = 0;

windowWidth = 200;
windowHeight = 220;
------------------------------------------------------------------------------------------
-- create the options window
------------------------------------------------------------------------------------------
function GenerateOptionsWindow()
		OptionsWindow=Turbine.UI.Lotro.GoldWindow(); 
		OptionsWindow:SetSize(windowWidth, windowHeight); 
		OptionsWindow:SetText("Options Window"); 
		OptionsWindow:SetPosition((Turbine.UI.Display:GetWidth()-OptionsWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-OptionsWindow:GetHeight())/2); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(150,10); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 17 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginText); 
		OptionsWindow:SetZOrder(0);
		OptionsWindow:SetWantsKeyEvents(true);	

		centerWindow = Turbine.UI.Extensions.SimpleWindow();
		centerWindow:SetSize( 40 , 40 );
		centerWindow:SetParent( OptionsWindow );
		centerWindow:SetPosition( 80 , 60);
		centerWindow:SetVisible( true );
		centerWindow:SetBackColor( Turbine.UI.Color( .3, .5, .7, .5) );

		centerQSWeapon = Turbine.UI.Lotro.Quickslot();
		centerQSWeapon:SetParent( centerWindow );
		centerQSWeapon:SetPosition( 1, 1 );
		centerQSWeapon:SetSize( 36, 36 );
		centerQSWeapon:SetUseOnRightClick(false);

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(140, 20); 
		OptionsWindow.Message:SetPosition(OptionsWindow:GetWidth()/2 - 70, 40); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginPrimary);  

		centerWindow3 = Turbine.UI.Extensions.SimpleWindow();
		centerWindow3:SetSize( 40 , 40 );
		centerWindow3:SetParent( OptionsWindow );
		centerWindow3:SetPosition( 80 , 130);
		centerWindow3:SetVisible( true );
		centerWindow3:SetBackColor( Turbine.UI.Color( .3, .5, .7, .5) );

		centerQSFishingRod = Turbine.UI.Lotro.Quickslot();
		centerQSFishingRod:SetParent( centerWindow3 );
		centerQSFishingRod:SetPosition( 1, 1 );
		centerQSFishingRod:SetSize( 36, 36 );
		centerQSFishingRod:SetUseOnRightClick(false);

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(150, 20); 
		OptionsWindow.Message:SetPosition(OptionsWindow:GetWidth()/2 - 75, 110 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginCanneapeche); 

		buttonValider = Turbine.UI.Lotro.GoldButton();
		buttonValider:SetParent( OptionsWindow );
		buttonValider:SetPosition(windowWidth/2 - 75, 180);
		buttonValider:SetSize( 150, 20 );
		buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		buttonValider:SetText(Strings.PluginValidate);
		buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		buttonValider:SetVisible(true);
		buttonValider:SetMouseVisible(true);

		ClosingTheOptionsWindow();
		DeleteShortCutes();
		DragAndDrop();
		SettingTheShortCuts();
		ValidateChanges();
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function ValidateChanges()
	buttonValider.MouseClick = function(sender, args)
		OptionsWindow:SetVisible(false);
		settings.isOptionsWindowVisible = false ;
		SaveSettings();
		CreatMainWindow();
		MusicManWindow:SetVisible(true);
		settings.isWindowVisible = true ;
	end
end
------------------------------------------------------------------------------------------
-- setting the shortcuts	
------------------------------------------------------------------------------------------
function SettingTheShortCuts()
	if(settings.shortcutData_3 ~= "") then
		centerQSWeapon:SetShortcut( Turbine.UI.Lotro.Shortcut( settings.shortcutType_3, settings.shortcutData_3 ) );
	end
	if(settings.shortcutData_2 ~= "") then
		centerQSFishingRod:SetShortcut( Turbine.UI.Lotro.Shortcut( settings.shortcutType_2, settings.shortcutData_2 ) );
	end
end
------------------------------------------------------------------------------------------
-- setting the shortcuts for drag and drop	
------------------------------------------------------------------------------------------
function DragAndDrop()
	centerQSWeapon.DragDrop = function(sender, args)
		local tmp = Turbine.UI.Lotro.Quickslot();

		tmp = centerQSWeapon:GetShortcut();
		tmp = tmp:GetData();

		tmp2 = centerQSWeapon:GetShortcut();
		tmp2 = tmp2:GetType();

		--Turbine.Shell.WriteLine(tmp);
		--Turbine.Shell.WriteLine(tmp2);

		settings.shortcutData_3 = tmp;
		settings.shortcutType_3 = tmp2;

		SaveSettings();
	end
	centerQSFishingRod.DragDrop = function(sender, args)
		local tmp = Turbine.UI.Lotro.Quickslot();

		tmp = centerQSFishingRod:GetShortcut();
		tmp = tmp:GetData();

		--Turbine.Shell.WriteLine(tmp);

		tmp2 = centerQSFishingRod:GetShortcut();
		tmp2 = tmp2:GetType();

		settings.shortcutData_2 = tmp;
		settings.shortcutType_2 = tmp2;

		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- delete the shortcut with mouse wheel
------------------------------------------------------------------------------------------
function DeleteShortCutes()
	centerQSWeapon.MouseWheel = function(sender, args)
		settings.shortcutData_3 = ""; 
		settings.shortcutType_3 = "";
		centerQSWeapon:SetShortcut(Turbine.UI.Lotro.Shortcut());
		SaveSettings();
	end
	centerQSFishingRod.MouseWheel = function(sender, args)
		settings.shortcutData_2 = ""; 
		settings.shortcutType_2 = "";
		centerQSFishingRod:SetShortcut(Turbine.UI.Lotro.Shortcut());
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheOptionsWindow()
	function OptionsWindow:Closing(sender, args)
		settings.isOptionsWindowVisible = false;
		SaveSettings();
	end
end