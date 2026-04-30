------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingWindow()
	function MusicManWindow:Closing(sender, args)
		settings.isWindowVisible = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- mouse enter handler
------------------------------------------------------------------------------------------
function SetMouseEnter()
	centerQS2.MouseEnter = function(sender, args)
		MusicManWindow.Message:SetText("");
		if(settings.isMusicalInstrumentEquiped == false)then
			MusicManWindow.Message:SetText(Strings.PluginCanneapeche);
		end
		if(settings.isWeaponEquiped == false)then
			MusicManWindow.Message:SetText(Strings.PluginPrimary);
		end
	end
	centerQS2.MouseLeave = function(sender, args)
		MusicManWindow.Message:SetText(Strings.PluginText);
	end
end

------------------------------------------------------------------------------------------
-- event handling
------------------------------------------------------------------------------------------
function EscapeKeyHandler()
	if(settings.isWindowVisible == true)then
		UIShowSearchVisible=true;
	else
		UIShowSearchVisible=false;
	end-- used to retain the state of the window for when the HUD is toggled back on

	MusicManWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			MusicManWindow:SetVisible(false);
			settings.isWindowVisible = false;
			OptionsWindow:SetVisible(false);
			settings.isOptionsWindowVisible = false;
			SaveSettings();
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			hudVisible=not hudVisible;
			if hudVisible then
				UIShowSearchVisible = false ;
				MusicManWindow:SetVisible(UIShowSearchVisible);
				MainMinimizedIcon:SetVisible(false);
				OptionsWindow:SetVisible(false);
				settings.isOptionsWindowVisible = false;
			else
				UIShowSearchVisible=MusicManWindow:IsVisible();
				MusicManWindow:SetVisible(UIShowSearchVisible);
				MainMinimizedIcon:SetVisible(true);
			end
		end
	end
end
