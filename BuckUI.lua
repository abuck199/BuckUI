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

	local FirstTabIndex = 1
	local LastTabIndex = 10

	if self.db.profile.ChatChannel then
		ChatFrameChannelButton:Hide()
	end

	if self.db.profile.ChatEmote then
		ChatFrameMenuButton:Hide()
	end

	if self.db.profile.ChatArrowKey then
		for i = FirstTabIndex, LastTabIndex do
			_G["ChatFrame"..i.."ButtonFrameDownButton"]:Hide()
			_G["ChatFrame"..i.."ButtonFrameUpButton"]:Hide()
		end
	end

	if self.db.profile.ChatScrollDown then
		for i = FirstTabIndex, LastTabIndex do 
			_G["ChatFrame"..i.."ButtonFrameBottomButton"]:Hide()
		end
	end
	
	local borderOpacity = self.db.profile.ChatScrollDownAlpha;
	if self.db.profile.ChatScrollDownAlpha then
		for i = FirstTabIndex, LastTabIndex do 
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

	if self.db.profile.ForLooney then
		for i = FirstTabIndex, LastTabIndex do
			_G["ChatFrame"..i.."ButtonFrameBottomButton"]:ClearAllPoints()
			_G["ChatFrame"..i.."ButtonFrameBottomButton"]:SetPoint("RIGHT", ChatFrame1, "RIGHT", 32, -58)
			_G["ChatFrame"..i.."ButtonFrameBottomButton"].SetPoint = function() end
		end
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
		targetFrame:SetPoint("LEFT", TargetFrame, "RIGHT", -40, 10)
		targetFrame:SetSize(28,28)
		targetFrame.icon = targetFrame:CreateTexture(nil, "BORDER")
		targetFrame.icon:SetAllPoints()
		targetFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
		targetFrame:Hide()
		
		local focusFrame = CreateFrame("Frame", nil , FocusFrame)
		focusFrame:SetPoint("LEFT", FocusFrame, "RIGHT", -40, 10)
		focusFrame:SetSize(28,28)
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

	if self.db.profile.ApplyFontOnActionBar then
		for _, objname in ipairs({
			"ActionButton1",
			"ActionButton2",
			"ActionButton3",
			"ActionButton4",
			"ActionButton5",
			"ActionButton6",
			"ActionButton7",
			"ActionButton8",
			"ActionButton9",
			"ActionButton10",
			"ActionButton11",
			"ActionButton12",

			"MultiBarLeftButton1",
			"MultiBarLeftButton2",
			"MultiBarLeftButton3",
			"MultiBarLeftButton4",
			"MultiBarLeftButton5",
			"MultiBarLeftButton6",
			"MultiBarLeftButton7",
			"MultiBarLeftButton8",
			"MultiBarLeftButton9",
			"MultiBarLeftButton10",
			"MultiBarLeftButton11",
			"MultiBarLeftButton12",
			
			"MultiBarRightButton1",
			"MultiBarRightButton2",
			"MultiBarRightButton3",
			"MultiBarRightButton4",
			"MultiBarRightButton5",
			"MultiBarRightButton6",
			"MultiBarRightButton7",
			"MultiBarRightButton8",
			"MultiBarRightButton9",
			"MultiBarRightButton10",
			"MultiBarRightButton11",
			"MultiBarRightButton12",
			
			"MultiBarBottomLeftButton1",
			"MultiBarBottomLeftButton2",
			"MultiBarBottomLeftButton3",
			"MultiBarBottomLeftButton4",
			"MultiBarBottomLeftButton5",
			"MultiBarBottomLeftButton6",
			"MultiBarBottomLeftButton7",
			"MultiBarBottomLeftButton8",
			"MultiBarBottomLeftButton9",
			"MultiBarBottomLeftButton10",
			"MultiBarBottomLeftButton11",
			"MultiBarBottomLeftButton12",
			
			"PetActionButton1",
			"PetActionButton2",
			"PetActionButton3",
			"PetActionButton4",
			"PetActionButton5",
			"PetActionButton6",
			"PetActionButton7",
			"PetActionButton8",
			"PetActionButton9",
			"PetActionButton10",
			
			"StanceButton1",
			"StanceButton2",
			"StanceButton3",
			"StanceButton4",
			"StanceButton5",
			"StanceButton6",
			"StanceButton7",
			
			"MultiBarBottomRightButton1",
			"MultiBarBottomRightButton2",
			"MultiBarBottomRightButton3",
			"MultiBarBottomRightButton4",
			"MultiBarBottomRightButton5",
			"MultiBarBottomRightButton6",
			"MultiBarBottomRightButton7",
			"MultiBarBottomRightButton8",
			"MultiBarBottomRightButton9",
			"MultiBarBottomRightButton10",
			"MultiBarBottomRightButton11",
			"MultiBarBottomRightButton12",
		}) do
			local obj = _G[objname]
			if obj then
				obj.HotKey:SetFont("Fonts\\FRIZQT__.ttf",12,"OUTLINE");
				obj.HotKey:SetShadowColor(0, 0, 0, 1)
				obj.Count:SetFont("Fonts\\FRIZQT__.ttf",12,"OUTLINE");
				obj.Count:SetShadowColor(0, 0, 0, 1)
			end
		end
	end

	if self.db.profile.ChangeUnitFrame then		
		PetFrameHealthBarText:SetAlpha(0)
		PetFrameHealthBarTextLeft:SetAlpha(0)
		PetFrameHealthBarTextRight:SetAlpha(0)
		PetFrameManaBarText:SetAlpha(0)
		PetFrameManaBarTextLeft:SetAlpha(0)
		PetFrameManaBarTextRight:SetAlpha(0)

		PlayerName:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		PlayerName:SetShadowColor(0, 0, 0, 1)

		PlayerFrameHealthBarTextRight:SetScale(1.2);
		PlayerFrameHealthBarTextRight:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		PlayerFrameHealthBarTextRight:SetShadowColor(0, 0, 0, 1)
		PlayerFrameHealthBarTextRight:ClearAllPoints()
		PlayerFrameHealthBarTextRight:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0)
		PlayerFrameHealthBarTextLeft:SetAlpha(0)
		PlayerFrameManaBarTextRight:SetScale(1.2);
		PlayerFrameManaBarTextRight:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		PlayerFrameManaBarTextRight:SetShadowColor(0, 0, 0, 1)
		PlayerFrameManaBarTextRight:ClearAllPoints()
		PlayerFrameManaBarTextRight:SetPoint("CENTER", PlayerFrameManaBar, "CENTER", 0, 0)
		PlayerFrameManaBarTextLeft:SetAlpha(0)

		TargetFrameTextureFrame.HealthBarTextRight:SetScale(1.2);
		TargetFrameTextureFrame.HealthBarTextRight:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		TargetFrameTextureFrame.HealthBarTextRight:SetShadowColor(0, 0, 0, 1)
		TargetFrameTextureFrame.HealthBarTextRight:ClearAllPoints()
		TargetFrameTextureFrame.HealthBarTextRight:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 0)
		TargetFrameTextureFrame.HealthBarTextLeft:SetFont("Fonts\\FRIZQT__.ttf",11,"OUTLINE");
		TargetFrameTextureFrame.HealthBarTextLeft:SetShadowColor(0, 0, 0, 1)
		TargetFrameTextureFrame.HealthBarTextLeft:ClearAllPoints()
		TargetFrameTextureFrame.HealthBarTextLeft:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", 0, 31)
		TargetFrameTextureFrame.HealthBarTextLeft:SetAlpha(0)
		TargetFrameTextureFrame.ManaBarTextRight:SetScale(1.2);
		TargetFrameTextureFrame.ManaBarTextRight:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		TargetFrameTextureFrame.ManaBarTextRight:SetShadowColor(0, 0, 0, 1)
		TargetFrameTextureFrame.ManaBarTextRight:ClearAllPoints()
		TargetFrameTextureFrame.ManaBarTextRight:SetPoint("CENTER", TargetFrameManaBar, "CENTER", 0, 0)
		TargetFrameTextureFrame.ManaBarTextLeft:SetAlpha(0)

		FocusFrameTextureFrame.HealthBarTextRight:SetScale(1.2);
		FocusFrameTextureFrame.HealthBarTextRight:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		FocusFrameTextureFrame.HealthBarTextRight:SetShadowColor(0, 0, 0, 1)
		FocusFrameTextureFrame.HealthBarTextRight:ClearAllPoints()
		FocusFrameTextureFrame.HealthBarTextRight:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 0)
		FocusFrameTextureFrame.HealthBarTextLeft:SetFont("Fonts\\FRIZQT__.ttf",11,"OUTLINE");
		FocusFrameTextureFrame.HealthBarTextLeft:SetShadowColor(0, 0, 0, 1)
		FocusFrameTextureFrame.HealthBarTextLeft:ClearAllPoints()
		FocusFrameTextureFrame.HealthBarTextLeft:SetPoint("LEFT", FocusFrameHealthBar, "LEFT", 0, 70)
		FocusFrameTextureFrame.HealthBarTextLeft:SetAlpha(0)
		FocusFrameTextureFrame.ManaBarTextRight:SetScale(1.2);
		FocusFrameTextureFrame.ManaBarTextRight:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		FocusFrameTextureFrame.ManaBarTextRight:SetShadowColor(0, 0, 0, 1)
		FocusFrameTextureFrame.ManaBarTextRight:ClearAllPoints()
		FocusFrameTextureFrame.ManaBarTextRight:SetPoint("CENTER", FocusFrameManaBar, "CENTER", 0, 0)
		FocusFrameTextureFrame.ManaBarTextLeft:SetAlpha(0)

		hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function()
			PlayerFrameHealthBar.RightText:SetText(AbbreviateNumbers(UnitHealth("player")))
			PlayerFrameManaBar.RightText:SetText(AbbreviateNumbers(UnitPower("player")))
			TargetFrameHealthBar.RightText:SetText(AbbreviateNumbers(UnitHealth("target")))
			TargetFrameManaBar.RightText:SetText(AbbreviateNumbers(UnitPower("target")))
			FocusFrameHealthBar.RightText:SetText(AbbreviateNumbers(UnitHealth("focus")))
			FocusFrameManaBar.RightText:SetText(AbbreviateNumbers(UnitPower("focus")))
		end)
		PetName:SetFont("Fonts\\FRIZQT__.ttf",10,"OUTLINE");
		PetName:SetShadowColor(0, 0, 0, 1)
	end

	if self.db.profile.SnowFallKeyPress then
		local animationsCount, animations = 5, {}
		local animationNum = 1
		local frame, texture, alpha1, scale1, scale2, rotation2
		for i = 1, animationsCount do
			frame = CreateFrame("Frame")
			texture = frame:CreateTexture() texture:SetTexture('Interface\\Cooldown\\star4') texture:SetAlpha(0) texture:SetAllPoints() texture:SetBlendMode("ADD")
			animationGroup = texture:CreateAnimationGroup()
			alpha1 = animationGroup:CreateAnimation("Alpha") alpha1:SetFromAlpha(0) alpha1:SetToAlpha(1) alpha1:SetDuration(0) alpha1:SetOrder(1)
			scale1 = animationGroup:CreateAnimation("Scale") scale1:SetScale(1.0, 1.0) scale1:SetDuration(0) scale1:SetOrder(1)
			scale2 = animationGroup:CreateAnimation("Scale") scale2:SetScale(1.5, 1.5) scale2:SetDuration(0.3) scale2:SetOrder(2)
			rotation2 = animationGroup:CreateAnimation("Rotation") rotation2:SetDegrees(90) rotation2:SetDuration(0.3) rotation2:SetOrder(2)
			animations[i] = {frame = frame, animationGroup = animationGroup}
		end

		local AnimateButton = function(self)
        if not self:IsVisible() then return true end
			local animation = animations[animationNum]
			local frame = animation.frame
			local animationGroup = animation.animationGroup
			frame:SetFrameStrata("HIGH")
			frame:SetFrameLevel(20)
			frame:SetAllPoints(self)
			animationGroup:Stop()
			animationGroup:Play()
			animationNum = (animationNum % animationsCount) + 1
        		return true
		end

		hooksecurefunc('MultiActionButtonDown', function(bname, id)
			AnimateButton(_G[bname..'Button'..id])
		end)

		hooksecurefunc('PetActionButtonDown', function(id)
        	local button
            	if PetActionBarFrame then
                    if id > NUM_PET_ACTION_SLOTS then return end
                        button = _G["PetActionButton"..id]
                    if not button then return end
                end
            return
         		AnimateButton(button)
		end)

		hooksecurefunc('ActionButtonDown', function(id)
        	local button
        	if OverrideActionBar and OverrideActionBar:IsShown() then
                if id > NUM_OVERRIDE_BUTTONS then return end
                	button = _G["OverrideActionBarButton"..id]
         		else
                	button = _G["ActionButton"..id]
         	end
        	if not button then return end
        		AnimateButton(button)
		end)
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

