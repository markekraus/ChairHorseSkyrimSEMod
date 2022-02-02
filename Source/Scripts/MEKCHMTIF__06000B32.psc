;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname MEKCHMTIF__06000B32 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001, MEKCHMRingOfChairHorseChangingCost.value as int)
Game.GetPlayer().AddItem(MEKCHMRingOfChairHorseChanging, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MEKCHMRingOfChairHorseChangingCost  Auto  

MiscObject Property Gold001  Auto  

Armor Property MEKCHMRingOfChairHorseChanging  Auto  
