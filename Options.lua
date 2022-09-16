BuckUI.defaults = {
	profile = {
		someToggle = true,
		-- chat
		ChatChannel = false,
		ChatEmote = false,
		ChatArrowKey = false,
		ChatScrollDown = false,
		ChatScrollDownAlpha = 1,
		ChatClassColor = false,
		-- minimap
		MinimapBorderTop = false,
		MinimapZoneText	= false,
		MinimapNorthTag = false,
		MinimapPlusSign = false,
		MinimapMinusSign = false,
		MinimapWorldMap = false,
		-- Unit Frame
		TargetCastBar = 1,
		FocusCastBar = 1,
		-- Action Bar
		HideKeybind = false,
		HidePetBarKeybind = false,
		HideMacroName = false,
		HideStanceKeybind = false,
		-- Cast bar
		CastBarActivation = false,
		CastBarSize = 1,
		CastBarPositionx = 1,
		CastBarPositiony = 1,
		-- Miscellaneous
		CombatIndicator = false,
		TopScreenNotification = false,
		ClassColorEnemyNameplate = 0,
		ClassColorFriendlyNameplate = 0,
		HideBgText = false,		
	},
}

-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
BuckUI.options = {
	type = "group",
	name = "BuckUI Options",
	descStyle = "inline",
	childGroups = "tab",
	handler = BuckUI,
	args = {
		vers = {
			order = 1,
			type = "description",
			name = "|cffffd700".."Version".."|r "..GetAddOnMetadata("BuckUI", "Version").."\n",
			cmdHidden = true
		},
		desc = {
			order = 2,
			type = "description",
			name = "|cffffd700".."Author".."|r "..GetAddOnMetadata("BuckUI","Author").."\n",
			cmdHidden = true
		},
		group0Reload = {
			type = "execute",
			name = "Reload UI",
			order = 3,
			func = "Reload",
		},
		group1Chat = {
			type = "group",
			order = 4,
			name = "Chat Settings",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				ChatChannel = {
					type = "toggle",
					order = 1,
					name = "Hide Channel",
					desc = "Hide left chat channel button",
					width = "double",
				},
				ChatEmote = {
					type = "toggle",
					order = 2,
					name = "Hide Emote",
					desc = "Hide left chat emote button",
					width = "double",
				},
				ChatArrowKey = {
					type = "toggle",
					order = 3,
					name = " Hide Arrow Up/Down",
					desc = "Hide left chat up/down arrow  buttons",
					width = "double",
				},
				ChatScrollDown = {
					type = "toggle",
					order = 4,
					name = " Hide Scroll Down",
					desc = "Hide left chat scroll down arrow button (if u toggle this the scroll down opacity is not gonna work)",
					width = "double",
				},
				ChatScrollDownAlpha = {
					type = "range",
					order = 5,
					name = "Scroll Down Opacity",
					min = 0,
					max = 1,
					step= 0.05,
				},
				ChatClassColor = {
					type = "toggle",
					order = 6,
					name = "Hide Class Color Chat",
					desc = "Activate class color in player name chat(keep unToggle to have class color)",
					width = "double",
				},
			},
		},
		group2Minimap = {
			type = "group",
			order = 5,
			name = "Minimap Settings",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				MinimapBorderTop = {
					type = "toggle",
					order = 1,
					name = "Hide Border Top",
					desc = "Hide border around the zone name",
					width = "double",
				},
				MinimapZoneText = {
					type = "toggle",
					order = 2,
					name = "Hide Zone Name",
					desc = "Hide zone text name",
					width = "double",
				},
				MinimapNorthTag = {
					type = "toggle",
					order = 3,
					name = "Hide North Tag",
					desc = "Hide North tag",
					width = "double",
				},
				MinimapPlusSign = {
					type = "toggle",
					order = 4,
					name = "Hide '+' Sign",
					desc = "Hide '+' Sign",
					width = "double",
				},
				MinimapMinusSign = {
					type = "toggle",
					order = 5,
					name = "Hide '-' Sign",
					desc = "Hide '-' Sign",
					width = "double",
				},
				MinimapWorldMap = {
					type = "toggle",
					order = 6,
					name = "Hide World Map Icon",
					desc = "Hide World Map Icon",
					width = "double",
				},
			},
		},
		group3UnitFrameCastBAR = {
			type = "group",
			order = 6,
			name = "UnitFrame Cast Bar",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				TargetCastBar = {
					type = "range",
					order = 1,
					name = "Target Cast Bar Size",
					min = 0,
					max = 2,
					step= 0.05,
				},
				FocusCastBar = {
					type = "range",
					order = 2,
					name = "Focus Cast Bar Size",
					min = 0,
					max = 2,
					step= 0.05,
				},
			},
		},
		group4ActionBar = {
			type = "group",
			order = 7,
			name = "Hide Keybind & Macro Name",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				HideKeybind = {
					type = "toggle",
					order = 1,
					name = "Hide Keybind",
					desc = "Hide Keybind on action bar",
					width = "double",
				},
				HidePetBarKeybind = {
					type = "toggle",
					order = 2,
					name = "Hide Pet Bar Keybind",
					desc = "Hide Keybind on pet action bar",
					width = "double",
				},
				HideMacroName = {
					type = "toggle",
					order = 3,
					name = "Hide Macro Name",
					desc = "Hide Macro name on action bar",
					width = "double",
				},
				HideStanceKeybind = {
					type = "toggle",
					order = 4,
					name = "Hide Stance Keybind",
					desc = "Hide Keybind on stance/form/aura bar",
					width = "double",
				}
			},
		},
		group5CastBar = {
			type = "group",
			order = 8,
			name = "Cast Bar",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				CastBarActivation = {
					type = "toggle",
					order = 0,
					name = "Activate Blizz Cast Bar",
					desc = "Activate The Default Cast Bar",
					width = "triple",
				},
				CastBarSize = {
					type = "range",
					order = 1,
					name = "Cast Bar Size",
					min = 0,
					max = 2,
					step= 0.05,
				},
				CastBarPositionx = {
					type = "range",
					order = 2,
					name = "X position",
					min = -500,
					max = 500,
					step= 0.1,
				},
				CastBarPositiony = {
					type = "range",
					order = 2,
					name = "Y position",
					min = -500,
					max = 500,
					step= 0.1,
				},
			},
		},
		group6Miscellaneous = {
			type = "group",
			order = 9,
			name = "Miscellaneous",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				CombatIndicator = {
					type = "toggle",
					order = 1,
					name = "Combat Indicator",
					desc = "Enable Combat Indicator",
					width = "double",
				},
				TopScreenNotification = {
					type = "toggle",
					order = 2,
					name = "Hide Game Notification",
					desc = "e.g. Number of player alive in arena, Ressource to win in bgs, ETC, top of the screen informations",
					width = "double",
				},
				ClassColorEnemyNameplate = {
					type = "toggle",
					order = 3,
					name = "Class Color In Enemy Nameplate",
					desc = "Show's the Ennemy class color in the Nameplate",
					width = "double",
				},
				ClassColorFriendlyNameplate = {
					type = "toggle",
					order = 4,
					name = "Class Color In Friendly Nameplate",
					desc = "Show's the Friendly class color in the Nameplate",
					width = "double",
				},
				HideBgText = {
					type = "toggle",
					order = 5,
					name = "Hide BG Text",
					desc = "Hide Useless Bg Description In Bg Tabs",
					width = "double",
				},
			},
		},
	},
}
function BuckUI:Reload()
	ReloadUI()
end

-- function BuckUI:GetSomeRange(info)
-- 	return self.db.profile.someRange
-- end

-- function BuckUI:SetSomeRange(info, value)
-- 	self.db.profile.someRange = value
-- end

-- for documentation on the info table
-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables#title-4-1
function BuckUI:GetValue(info)
	return self.db.profile[info[#info]]
end

function BuckUI:SetValue(info, value)
	self.db.profile[info[#info]] = value
end
