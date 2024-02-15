ResourcePath = "Homeopatix/MusicMan/Resources/";

Images = {
	MinimizedIcon = ResourcePath .. "MusicMan.tga",
};

function CreateLocalizationInfo()
	Strings = {};

	if Turbine.Engine.GetLanguage() == Turbine.Language.German then
		Strings.PluginName = "Music";
		Strings.PluginText = "Von Homeopatix";
		Strings.PluginPrimary = "Fernwaffe";
		Strings.PluginCanneapeche = "Musikinstrument";
		Strings.PluginValidate = "Auswahl validieren";
		Strings.PluginAltEnable = "Alt-Taste aktiviert";
		Strings.PluginAltDesable = "Alt-Taste deaktiviert";
		Strings.PluginWindowShow = "Schaufenster.";
		Strings.PluginWindowHide = "Verstecke das Fenster.";
		Strings.PluginPlayMusicAlias = "/musik";
		Strings.PluginOptionShowWindow = "Zeigen Sie das Optionsfenster an";
		Strings.PluginClear = "L\195\182schen Sie die Verkn\195\188pfungen";
		Strings.PluginHelp = " *** MusicMan Hilfe ***\n\n" ..
		"/Mu show Zeigen MusicMan an\n" ..
		"/Mu hide Verstecke MusicMan\n" ..
		"/Mu alt - Aktivieren oder deaktivieren Sie die alt-Taste um das Symbol zu verschieben.\n\n" ..
		"/Mu toggle - Fenster ein-oder ausblenden\n\n" ..
		"Sie k\195\182nnen Ihre Angelrute im Symbol rechts ziehen und ablegen";

elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
		Strings.PluginName = "Music";
		Strings.PluginText = "Par Homeopatix";
		Strings.PluginPrimary = "Arme \195\160 distance";
		Strings.PluginCanneapeche = "Instrument de musique";
		Strings.PluginValidate = "Valider Selection";
		Strings.PluginOptionShowWindow = "Affiche la fen\195\170tre d'options"
		Strings.PluginClear = "Efface les raccourcis";
		Strings.PluginAltEnable = "Touche Alt activ\195\169";
		Strings.PluginAltDesable = "Touche Alt desactiv\195\169";
		Strings.PluginWindowShow = "Affiche la fen\195\168tre.";
		Strings.PluginWindowHide = "Cache la fen\195\168tre.";
		Strings.PluginPlayMusicAlias = "/musique";
		Strings.PluginHelp = " *** MusicMan Aide ***\n\n" ..
		"/Mu show affiche MusicMan\n" ..
		"/Mu hide cache MusicMan\n" ..
		"/Mu alt - Active ou d\195\169sactive la touche alt pour le d\195\169placement de l'icon.\n\n" ..
		"/Mu toggle - affiche ou cache la fenetre\n\n" ..
		"Vous pouvez faire glisser et d\195\169poser votre canne a peche dans l'icon de droite";

elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
		Strings.PluginName = "Music";
		Strings.PluginText = "By Homeopatix";
		Strings.PluginPrimary = "Ranged Weapon";
		Strings.PluginCanneapeche = "Music instrument";
		Strings.PluginValidate = "Validate Selection";
		Strings.PluginOptionShowWindow = "Display the options window";
		Strings.PluginClear = "Delete the shortcuts";
		Strings.PluginAltEnable = "Alt key Activated";
		Strings.PluginAltDesable = "Alt key Desactivated";
		Strings.PluginWindowShow = "Show the window.";
		Strings.PluginWindowHide = "Hide the window.";
		Strings.PluginPlayMusicAlias = "/music";
		Strings.PluginHelp = " *** MusicMan Help ***\n\n" ..
		"/Mu show Display MusicMan\n" ..
		"/Mu hide Hide MusicMan\n" ..
		"/Mu alt - Activate or deactivate the alt key to move the icon.\n\n" ..
		"/Mu toggle - display or hide the window\n\n" ..
		"You can drag and drop your fishing rod in the icon on the right";
	end
end
