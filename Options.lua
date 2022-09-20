BuckUI.defaults = {
	profile = {
		someToggle = true,
		-- chat
		ChatChannel = false,
		ChatEmote = false,
		ChatArrowKey = false,
		ChatScrollDown = false,
		ChatScrollDownAlpha = 1,
		ChatBar = 1,
		ChatClassColor = false,
		ChatBarMove = false,
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
		-- Buff & Debuffs
		ActivateBuffEdit = false,
		IncreaseBuffSize = 1,
		MoveBuffSizeX = 0,
		MoveBuffSizeY = 0,
		NumberOfBuffRow = 10,
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
		ErrorNotification = false,
	},
}

-- https://www.wowace.com/projects/ace3/pages/ace-config-3-0-options-tables
BuckUI.options = {
	type = "group",
	name = "BuckUI Options",
	descStyle = "inline",
	childGroups = "tree",
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
		groupDesc = {
			type = "description",
			name = "\n|cFFFFFF00" .. "[ Do not forget to press Reload UI for changes to take effect ] \n ",
			fontSize = "medium",
			order = 4,
		},
		group1Chat = {
			type = "group",
			order = 5,
			name = "Chat Settings",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				ChatChannel = {
					type = "toggle",
					order = 1,
					name = "Hide Channel Button",
					desc = "Hide left chat channel button",
					width = "double",
				},
				ChatEmote = {
					type = "toggle",
					order = 2,
					name = "Hide Emote Button",
					desc = "Hide left chat emote button",
					width = "double",
				},
				ChatArrowKey = {
					type = "toggle",
					order = 3,
					name = " Hide Arrow Up/Down Button",
					desc = "Hide left chat up/down arrow  buttons",
					width = "double",
				},
				ChatScrollDown = {
					type = "toggle",
					order = 4,
					name = " Hide Scroll Down Button",
					desc = "Hide left chat scroll down arrow button (if u toggle this the scroll down opacity is not gonna work)",
					width = "double",
				},
				ChatScrollDownAlpha = {
					type = "range",
					order = 5,
					name = "Scroll Down Button Opacity",
					min = 0,
					max = 1,
					step = 0.05,
					width = "double",
				},
				ChatBar = {
					type = "range",
					order = 6,
					name = "Chat Typing Bar scale",
					min = 0,
					max = 2,
					step = 0.05,
					width = "double",
				},
				ChatClassColor = {
					type = "toggle",
					order = 7,
					name = "Hide Class Color Chat",
					desc = "Activate class color in player name chat(keep unToggle to have class color)",
					width = "double",
				},
				ChatBarMove = {
					type = "toggle",
					order = 8,
					name = "Move chat bar above",
					desc = "Move chat bar above",
					width = "double",
				},
			},
		},
		group2Minimap = {
			type = "group",
			order = 6,
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
			order = 7,
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
					step = 0.05,
					width = "double",
				},
				FocusCastBar = {
					type = "range",
					order = 2,
					name = "Focus Cast Bar Size",
					min = 0,
					max = 2,
					step = 0.05,
					width = "double",
				},
			},
		},
		group4ActionBar = {
			type = "group",
			order = 8,
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
		groupBuffs = {
			type = "group",
			order = 9,
			name = "Buffs & Debuffs",
			inline = false,
			get = "GetValue",
			set = "SetValue",
			args = {
				noteGroupBuffs = {
					type = "description",
					name = "\n|cFFFFFF00" .. "Tips: if u are using any other addons that manage your buffs & debuffs i suggest not activating this feature \n ",
					fontSize = "small",
					order = 0,
				},
				ActivateBuffEdit = {
					type = "toggle",
					order = 1,
					name = "Activate Buffs & Debuffs Edits",
					desc = "((if u are using Leatrix plus to manage your buff & debuffs do not activate this feature))",
					width = "double",
				},
				IncreaseBuffSize = {
					type = "range",
					order = 2,
					name = "Buffs & Debuffs Size",
					min = 0,
					max = 2,
					step = 0.05,
					width = "double",
				},
				MoveBuffSizeX = {
					type = "range",
					order = 3,
					name = "Left To Right Position (x)",
					min = -500,
					max = 0,
					step = 1.0,
					width = "double",
				},
				MoveBuffSizeY = {
					type = "range",
					order = 4,
					name = "Up to Down Position (y)",
					min = -500,
					max = 0,
					step = 1.0,
					width = "double",
				},
				NumberOfBuffRow = {
					type = "range",
					order = 5,
					name = "Number of Buff Per Row",
					min = 2,
					max = 20,
					step = 1,
					width = "double",
				},
			},
		},
		group5CastBar = {
			type = "group",
			order = 9,
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
					width = "double",
				},
				CastBarSize = {
					type = "range",
					order = 1,
					name = "Cast Bar Size",
					min = 0,
					max = 2,
					step = 0.05,
					width = "double",
				},
				CastBarPositionx = {
					type = "range",
					order = 2,
					name = "X position",
					min = -500,
					max = 500,
					step = 0.1,
					width = "double",
				},
				CastBarPositiony = {
					type = "range",
					order = 2,
					name = "Y position",
					min = -500,
					max = 500,
					step = 0.1,
					width = "double",
				},
			},
		},
		group6Miscellaneous = {
			type = "group",
			order = 10,
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
				ClassColorEnemyNameplate = {
					type = "toggle",
					order = 2,
					name = "Class Color In Enemy Nameplate",
					desc = "Show's the Ennemy class color in the Nameplate",
					width = "double",
				},
				ClassColorFriendlyNameplate = {
					type = "toggle",
					order = 3,
					name = "Class Color In Friendly Nameplate",
					desc = "Show's the Friendly class color in the Nameplate",
					width = "double",
				},
				HideBgText = {
					type = "toggle",
					order = 4,
					name = "Hide BG Text",
					desc = "Hide Useless Bg Description In Bg Tabs",
					width = "double",
				},
				TopScreenNotification = {
					type = "toggle",
					order = 5,
					name = "Hide Game Notification",
					desc = "e.g. Number of player alive in arena, Ressource to win in bgs, ETC, top of the screen informations",
					width = "double",
				},
				ErrorNotification = {
					type = "toggle",
					order = 6,
					name = "Hide Game Error",
					desc = "e.g. Remove Black Error message (Out of Range. Not Enough Mana.)",
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
