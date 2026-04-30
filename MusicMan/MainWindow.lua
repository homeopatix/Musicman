------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
function CreatMainWindow()
	MusicManWindow=Turbine.UI.Lotro.GoldWindow(); 
	MusicManWindow:SetSize(200,120); 
	MusicManWindow:SetText(Strings.PluginName); 
	MusicManWindow.Message=Turbine.UI.Label(); 
	MusicManWindow.Message:SetParent(MusicManWindow); 
	MusicManWindow.Message:SetSize(150,15); 
	MusicManWindow.Message:SetPosition(MusicManWindow:GetWidth()/2 - 75, MusicManWindow:GetHeight()/2 + 40); 
	MusicManWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	MusicManWindow.Message:SetText(Strings.PluginText); 
	MusicManWindow:SetWantsKeyEvents(true);
	MusicManWindow:SetVisible( true );
	MusicManWindow:SetPosition(settings.positionX, settings.positionY);
------------------------------------------------------------------------------------------
-- yel helper center window
------------------------------------------------------------------------------------------

	if(settings.isWeaponEquiped == true) then
		centerWindow2 = Turbine.UI.Extensions.SimpleWindow();
		centerWindow2:SetSize( 40 , 40 );
		centerWindow2:SetParent( MusicManWindow );
		centerWindow2:SetPosition(MusicManWindow:GetWidth()/2 - 20, MusicManWindow:GetHeight()/2 - 12);
		centerWindow2:SetVisible( true );
		centerWindow2:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );
		centerWindow2:SetZOrder(1000);

		releaseWindow = Turbine.UI.Extensions.SimpleWindow();
		releaseWindow:SetSize( 40, 40 );
		releaseWindow:SetParent( MusicManWindow );
		releaseWindow:SetPosition(111, MusicManWindow:GetHeight()/2 - 11);
		releaseWindow:SetOpacity( 1 );
		releaseWindow:SetFadeSpeed( 0.5 );
		releaseWindow:SetVisible( false );
		releaseWindow:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );
	else
		centerWindow2 = Turbine.UI.Extensions.SimpleWindow();
		centerWindow2:SetSize( 40 , 40 );
		centerWindow2:SetParent( MusicManWindow );
		centerWindow2:SetPosition( 50 ,MusicManWindow:GetHeight()/2 - 12);
		centerWindow2:SetVisible( true );
		centerWindow2:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );
		centerWindow2:SetZOrder(1000);

		releaseWindow = Turbine.UI.Extensions.SimpleWindow();
		releaseWindow:SetSize( 38, 38 );
		releaseWindow:SetParent( MusicManWindow );
		releaseWindow:SetPosition(111, MusicManWindow:GetHeight()/2 - 11);
		releaseWindow:SetOpacity( 1 );
		releaseWindow:SetFadeSpeed( 0.5 );
		releaseWindow:SetVisible( true );
		releaseWindow:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );

		releaseQSBack = Turbine.UI.Control();
		releaseQSBack:SetParent( releaseWindow );
		releaseQSBack:SetZOrder(-1);
		releaseQSBack:SetSize( 38, 38 );

		releaseQS = Turbine.UI.Lotro.Quickslot();
		releaseQS:SetParent(  releaseQSBack );
		releaseQS:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, Strings.PluginPlayMusicAlias));
		releaseQS:SetSize( 38, 38 );
		releaseQS:SetPosition( 0, 0 );
		releaseQS:SetAllowDrop(false);

		releaseQS.MouseClick = function(sender, args)
			if(settings.isPlayingMusic == true)then
				settings.isPlayingMusic = false;
				--Turbine.Shell.WriteLine("isPlayingMusic : " .. tostring(settings.isPlayingMusic));
				SaveSettings();
				CreatMainWindow();
			else
				settings.isPlayingMusic = true;
				--Turbine.Shell.WriteLine("isPlayingMusic : " .. tostring(settings.isPlayingMusic));
				SaveSettings();
				CreatMainWindow();
			end
		end
	end

	centerQS2 = Turbine.UI.Lotro.Quickslot();
	centerQS2:SetParent( centerWindow2 );
	centerQS2:SetPosition( 1, 1 );
	centerQS2:SetSize( 36, 36 );
	centerQS2:SetUseOnRightClick(false);
	centerQS2:SetZOrder(1000);
	centerQS2:SetAllowDrop(false);
	if(settings.isPlayingMusic == true)then
		centerWindow2:SetVisible( false );
		centerQS2:SetEnabled(false);
	else
		centerWindow2:SetVisible( true );
		centerQS2:SetEnabled(true);
	end

	if(settings.isWeaponEquiped == true) then
		centerQS2:SetShortcut( Turbine.UI.Lotro.Shortcut( settings.shortcutType_2, settings.shortcutData_2 ) );
	else
		centerQS2:SetShortcut( Turbine.UI.Lotro.Shortcut( settings.shortcutType_3, settings.shortcutData_3 ) );
	end

	centerQS2.MouseClick = function(sender, args)
		if(settings.isWeaponEquiped == true)then
			settings.isWeaponEquiped = false;
			settings.isMusicalInstrumentEquiped = true;
			SaveSettings();
			CreatMainWindow();
		else
			settings.isWeaponEquiped = true;
			settings.isMusicalInstrumentEquiped = false;
			SaveSettings();
			CreatMainWindow();
		end
	end

	SetMouseEnter();
	PositionChanged();
	EscapeKeyHandler();
end
------------------------------------------------------------------------------------------
-- if the position changes, save the new window location
------------------------------------------------------------------------------------------
function PositionChanged()
	MusicManWindow.PositionChanged = function( sender, args )
		local x,y = MusicManWindow:GetPosition();
		settings.positionX = x;
		settings.positionY = y;
		SaveSettings();
	end
end
