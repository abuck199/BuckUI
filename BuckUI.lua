BuckUI = LibStub("AceAddon-3.0"):NewAddon("BuckUI", "AceEvent-3.0", "AceConsole-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

function BuckUI:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("BuckDB", self.defaults, true)

	-- https://www.wowace.com/projects/ace3/pages/api/ace-config-3-0
	AC:RegisterOptionsTable("BuckUI_Options", self.options)
	self.optionsFrame = ACD:AddToBlizOptions("BuckUI_Options", "BuckUI")

	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	AC:RegisterOptionsTable("BuckUI_Profiles", profiles)
	ACD:AddToBlizOptions("BuckUI_Profiles", "Profiles", "BuckUI")

	-- https://www.wowace.com/projects/ace3/pages/api/ace-console-3-0
	self:RegisterChatCommand("buck", "SlashCommand")
	self:RegisterChatCommand("buckui", "SlashCommand")
	
end

function BuckUI:OnEnable()
	self:DbProfile()
end

function BuckUI:DbProfile()
	if self.db.profile.ChatChannel then
		ChatFrameChannelButton:Hide()
	end

	if self.db.profile.ChatEmote then
		ChatFrameMenuButton:Hide()
	end

	if self.db.profile.ChatArrowKey then
		for i = 1, 10 do
			_G["ChatFrame"..i.."ButtonFrameDownButton"]:Hide()
			_G["ChatFrame"..i.."ButtonFrameUpButton"]:Hide()
		end
	end

	if self.db.profile.ChatScrollDown then
		for i = 1, 10 do 
			_G["ChatFrame"..i.."ButtonFrameBottomButton"]:Hide()
		end
	end
	
	local borderOpacity = self.db.profile.ChatScrollDownAlpha;
	if self.db.profile.ChatScrollDownAlpha then
		for i = 1, 10 do 
			_G["ChatFrame"..i.."ButtonFrameBottomButton"]:SetAlpha(borderOpacity)
		end
	end

	local ChatBarScale = self.db.profile.ChatBar;
	if self.db.profile.ChatBar then
		ChatFrame1EditBox:SetScale(ChatBarScale)
	end

	if self.db.profile.ChatBarMove then
		ChatFrame1EditBox:ClearAllPoints()
		ChatFrame1EditBox:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", -5, 25)
		ChatFrame1EditBox:SetPoint("RIGHT", ChatFrame1, 5, 10)
	end


	if self.db.profile.ChatClassColor then
		SetCVar("chatClassColorOverride", 1);
	else
		SetCVar("chatClassColorOverride", 0);
	end


	if self.db.profile.MinimapBorderTop then
		MinimapBorderTop:SetAlpha(0)
	end

	if self.db.profile.MinimapZoneText then
		MinimapZoneText:ClearAllPoints()
		MinimapZoneText:SetAlpha(0)
		MinimapZoneText.SetAlpha = function() end
	end

	if self.db.profile.MinimapNorthTag then
		MinimapNorthTag:SetAlpha(0)
	end

	if self.db.profile.MinimapPlusSign then
		MinimapZoomIn:SetAlpha(0)
	end

	if self.db.profile.MinimapMinusSign then
		MinimapZoomOut:SetAlpha(0)
	end

	if self.db.profile.MinimapWorldMap then
		MiniMapWorldMapButton:SetAlpha(0)
	end

	if self.db.profile.CombatIndicator then
		local targetFrame = CreateFrame("Frame", nil , TargetFrame)
		targetFrame:SetPoint("LEFT", TargetFrame, "RIGHT", -25, 10)
		targetFrame:SetSize(26,26)
		targetFrame.icon = targetFrame:CreateTexture(nil, "BORDER")
		targetFrame.icon:SetAllPoints()
		targetFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
		targetFrame:Hide()
		
		local focusFrame = CreateFrame("Frame", nil , FocusFrame)
		focusFrame:SetPoint("LEFT", FocusFrame, "RIGHT", -25, 10)
		focusFrame:SetSize(26,26)
		focusFrame.icon = focusFrame:CreateTexture(nil, "BORDER")
		focusFrame.icon:SetAllPoints()
		focusFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
		focusFrame:Hide()
		
		local UnitAffectingCombat = UnitAffectingCombat
		
		local function CombatIndicator_Update()
			targetFrame:SetShown(UnitAffectingCombat("target"))
			focusFrame:SetShown(UnitAffectingCombat("focus"))
		end
		
		C_Timer.NewTicker(0.1, CombatIndicator_Update)
	end

	local targetCastBarOpacity = self.db.profile.TargetCastBar;
	if self.db.profile.TargetCastBar then
		TargetFrameSpellBar:SetScale(targetCastBarOpacity)
	end

	local focusCastBarOpacity = self.db.profile.FocusCastBar;
	if self.db.profile.FocusCastBar then
		FocusFrameSpellBar:SetScale(focusCastBarOpacity)
	end

	if self.db.profile.HideKeybind then
		for i = 1, 12 do 
			_G["ActionButton"..i.."HotKey"]:SetAlpha(0)
			_G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0)
			_G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0)
			_G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0)
			_G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0)
		end
	end

	if self.db.profile.HidePetBarKeybind then
		for i = 1, 10 do
			_G["PetActionButton"..i.."HotKey"]:SetAlpha(0)
		end
	end

	if self.db.profile.HideMacroName then
		for i = 1, 12 do
			_G["ActionButton"..i.."Name"]:SetAlpha(0)
			_G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0)
			_G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0)
			_G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0)
			_G["MultiBarRightButton"..i.."Name"]:SetAlpha(0)
		end
	end

	if self.db.profile.HideStanceKeybind then
		for i = 1, 10 do
			_G["StanceButton"..i.."HotKey"]:SetAlpha(0)
		end
	end

	if self.db.profile.TopScreenNotification then
		UIWidgetTopCenterContainerFrame:Hide()
	end

	if self.db.profile.CastBarActivation then
		local PlayerCastBarSize = self.db.profile.CastBarSize;
		if self.db.profile.CastBarSize then
			CastingBarFrame:SetScale(PlayerCastBarSize)
		end

		local PlayerCastBarPositionX = self.db.profile.CastBarPositionx;
		local PlayerCastBarPositionY = self.db.profile.CastBarPositiony;
		if self.db.profile.CastBarPositionx then
			CastingBarFrame:ClearAllPoints()
			CastingBarFrame:SetPoint("CENTER",UIParent,"CENTER", PlayerCastBarPositionX, PlayerCastBarPositionY)
			CastingBarFrame.SetPoint = function() end
		end
	end

	if self.db.profile.ClassColorEnemyNameplate then
		SetCVar("ShowClassColorInNameplate", 1);
	else
		SetCVar("ShowClassColorInNameplate", 0);
	end

	if self.db.profile.ClassColorFriendlyNameplate then
		SetCVar("ShowClassColorInFriendlyNameplate", 1);
	else
		SetCVar("ShowClassColorInFriendlyNameplate", 0);
	end

	if self.db.profile.HideBgText then
		BattlefieldFrameInfoScrollFrameChildFrameDescription:SetAlpha(0)
		BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoDescription:Hide()
		BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoTitle:Hide()

		BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoRewardsLabel:ClearAllPoints()
		BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoRewardsLabel:SetPoint("LEFT",PVPParentFrame,"LEFT",40,65)
		BattlefieldFrameInfoScrollFrameChildFrameRewardsInfoRewardsLabel.SetPoint = function() end
	end

	if self.db.profile.ErrorNotification then
		UIErrorsFrame:SetAlpha(0)
	end

	if self.db.profile.ActivateBuffEdit then
		local BuffSize = self.db.profile.IncreaseBuffSize;
		local BuffPositionX = self.db.profile.MoveBuffSizeX;
		local BuffPositionY = self.db.profile.MoveBuffSizeY;
		local BuffPerRow = self.db.profile.NumberOfBuffRow;

		if self.db.profile.IncreaseBuffSize then
			BuffFrame:SetScale(BuffSize)
		end
		if self.db.profile.MoveBuffSizeX then
			BuffFrame:ClearAllPoints()
			BuffFrame:SetPoint("TOPRIGHT",UIParent,"TOPRIGHT", BuffPositionX, BuffPositionY)
			BuffFrame.SetPoint = function() end
		end
		if self.db.profile.NumberOfBuffRow then
			BUFFS_PER_ROW = BuffPerRow
		end
	end
end

function BuckUI:OnDisable()
	-- Nothing
end

function BuckUI:SlashCommand(input, editbox)
	if input == "enable" then
		self:Enable()
		self:Print("Enabled.")
	elseif input == "disable" then
		self:Disable()
		self:Print("Disabled.")
	elseif input == "message" then
		print("this is our saved message:", self.db.profile.someInput)
	else
		self:Print("Made by Bucksp-Benediction")
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	end
end

