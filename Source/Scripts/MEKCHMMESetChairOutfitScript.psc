Scriptname MEKCHMMESetChairOutfitScript extends activemagiceffect  

FormList Property MEKCHMHorseChairOutfitList  Auto
GlobalVariable Property MEKCHMCurChairOutfitListItem  Auto
GlobalVariable Property MEKCHMChairHorseStyleSwapIntervalSeconds  Auto
ReferenceAlias Property Alias_Horse Auto
EffectShader Property DA02ArmorShadow Auto
bool Property IsConstant Auto

bool KeepUpdating = false

Event OnUpdate()
    If (KeepUpdating)
        ChangeChairOutifit(Alias_Horse.GetActorRef())
        RegisterForSingleUpdate(MEKCHMChairHorseStyleSwapIntervalSeconds.GetValue())
    EndIf
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If (IsConstant)
        KeepUpdating = true
        RegisterForSingleUpdate(MEKCHMChairHorseStyleSwapIntervalSeconds.GetValue())
    Else
        ChangeChairOutifit(Alias_Horse.GetActorRef())
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    KeepUpdating = false
EndEvent

Function ChangeChairOutifit(Actor akTarget)
    int currentIndex = MEKCHMCurChairOutfitListItem.GetValueInt()
    If (currentIndex >= MEKCHMHorseChairOutfitList.GetSize())
        MEKCHMCurChairOutfitListItem.SetValueInt(0)
        currentIndex = 0
    EndIf
    Debug.Trace(Self + ": Applying outfit index '" + currentIndex + "'")
    DA02ArmorShadow.Play(akTarget, 0.25)
    Utility.Wait(0.20)
    akTarget.SetOutfit(MEKCHMHorseChairOutfitList.GetAt(currentIndex) as Outfit)
    MEKCHMCurChairOutfitListItem.SetValueInt(currentIndex + 1)
EndFunction
