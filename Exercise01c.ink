/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 3
VAR weapon = ""
VAR bandit = true

-> keep_entrance

== keep_entrance ==
You feel the bracing wind and dusty flurries gnaw at you as you make your way up the main thoroughfare of Krissenthal, towards Count Vedillan's keep. As you ascend the staircase to the veritable fortress, you hear the supports creak against the winds, barely holding up the cobbled battlements of stone and spruce. Vestiges of this city's role and plight amidst the Amalgamere War. Once you finally reach the gates, a guard speaks up. 
"State your business."
* ["The Count called for me. I know not what for."] -> meek_entrance
* ["Best skip the formalities. You should know Vedillan's expecting me."] -> aggro_entrance
-> END

== meek_entrance ==
The guards take a look at one another. "Very well," the other says. "But you'll need an escort."
The gates rumble open as another guard is called to oversee you enter Count Vedillan's main hall. You are escorted into a dimly lit mead hall with empty, dusty settings lining the long wooden table. A massive curtain obscures a great window looking out over the city's palisade and into the surrounding forest. The guard moves to one of many doors on one side of the room and knocks, announcing your arrival. Shortly after, Count Vedillan, who seems smaller in stature than you might expect of a war hero, emerges. 
-> exposition
-> END

== aggro_entrance ==
"Alright, alright," they say. "No need to get testy, you can never be too careful. Count'll deal with you if you're lying."
The gates rumble open as the other guard give you directions to the main hall of the keep, where the Count can be found. You soon wander into a dimly lit mead hall with empty, dusty settings lining the long wooden table. A massive curtain obscures a great window looking out over the city's palisade and into the surrounding forest. Vedillan isn't here to greet you, and being left unattended, you see a simple, yet sturdy looking knife stuck into the table.
* Pocket it. No one's using it anyways. -> knife
* Leave it. You don't want to get in trouble for this sort of thing. -> exposition
-> END

== knife ==
~ weapon = "Vedillan's knife"
You wrest the knife from it's mahogany hold, and stash it away mere moments before a door opens, and Count Vedillan, who looks smaller in stature than you'd expect from a war hero, enters. 
-> exposition
-> END

== exposition ==
{knife:"I thought I'd heard something.}{not knife && aggro_entrance: You keep your hands to yourself and wait patiently. A few minutes later, a door opens, and Count Vedillan, who looks smaller in stature than you'd expect from a war hero, enters. "}You're earlier than expected. I appreciate the expediency, and I apologize for the secrecy. I'll cut to the chase. I need you to run an errand for me out into the Krissenfrost Wood, to the ruined city of Cenngwith. An old family heirloom has been left there, and I'm no longer in any shape to make the expedition."
*["I accept this charge. But I'm afraid this work doesn't come free."] -> request
*["I'll need some incentive to do your dirty work old man."] -> demand
-> END

== request ==
{knife: "I should think that knife will serve you well. Consider that, as well as my allowance of your sticky fingers, an advance on your payment." -> outside|"Of course, I wouldn't expect otherwise. I know you've ventured out there before, but this upfront reward should ease your way." Vedillan approaches three stands with different items on each.}
+ {not knife} ["The Aethermaul. A hammer made of aetherium, a substance known for chanelling movement and force."] -> aethermaul
+ {not knife} ["Chaosbinder. A bow siffused with unstable arcana, that may lash out at you, but it's pandemonium will wreak greater havok on your foes."] -> chaosbinder
+ {not knife} ["And the Helm of Jareth, which silvers your tongue, and perfects your pitch. The beasts beyond the palisade are cunning, but this might help match their wit."] -> helm
-> END

== demand ==
Count Vedillan's nostrils flare, as his deep, sombre eyes darken further still. 
{knife: "Thrice you have disrespected me. You disrespect the servants of my house, that which belongs to me, and now, you all but spit in my eye. I'm afraid I cannot, will not stand for this." -> prison_ending }
"I did have some items to help guide your path. I will ignore this disrespect and still provide one as upfront compensation, but the ice you stand on wears thin."
Vedillan approaches three stands with different items on each. He ignores one on the end.
"I'm afraid you are unfit for this artifact."
+ ["The Aethermaul. A hammer made of aetherium, a substance known for chanelling movement and force."] -> aethermaul
+ ["Chaosbinder. A bow siffused with unstable arcana, that may lash out at you, but it's pandemonium will wreak greater havok on your foes."] -> chaosbinder
-> END

== aethermaul ==
~ weapon = "Aethermaul"
You pick up the Aethermaul. You're barely able to lift the dark metallic arm at first, but as you manuveur it, you feel an almost magnetic attraction guiding your hand. -> outside
-> END

== chaosbinder ==
~ weapon = "Chaosbinder"
You pick up Chaosbinder. You feel the static energy emanating from the multiple cracked arms, with ephermal, multicolor glows pulsating within it. Despite the wear and unevenness, there is elegance in it's flaws. -> outside
-> END

== helm ==
~ weapon = "Helm of Jareth"
You don the Helm of Jareth. The maplewood crown nestles nicely over your brow, and within the silver framing of the helmet, you hear a symphony around you. Every creak of wood, every shift of a foot, every whistle of wind, comes together to compose a beautiful song. -> outside
-> END

== outside ==
{not wood_entrance: 
You {knife: sheepishly } thank the Count, but before you leave, he leaves you one final guidance.
"My mother's journal, from when she still served as Baroness of Cenngwith. This will help you find your way there, and to identify the object I desire."
With that you leave the keep, to brave not just the oppressive winter winds, but the threats that lie in the Krissenfrost Wood. While making your way to the palisade surround the city, to descend the hill it stands atop, you hear grunts of pain down a nearby alleyway.
}
{wood_entrance: The cries still ring out from the alley.}
+ Investigate. Someone could be hurt. -> alley
+ Keep walking. You've got bigger things on your plate. -> wood_entrance
-> END

== wood_entrance ==
   You keep on forward, eventually reaching the treeline at the foot of the hill, armed, and ready for what happens next.
   {not bandit: -> DONE}
   + {bandit} Your conscious gets the better of you. Go back to the alley. -> outside 
-> END

== prison_ending ==
Several guards are revealed in and around the great mead hall, and your arms are seized. Despite your struggles, protests, and apologies, you are dragged away without another word, and thrown into the dungeon of Count Vedillan's keep, where you will remain for an indefinite sentence.
-> END

== alley ==
//conditional here; don't show text if in combat
{weapon} at the ready, you slowly creep towards the source of distress. The utterances cease, and you whip your head around to observe your surroundings. Out of the corner of your eye, under the thin dusting of snow, you catch a patch of discoloration. Where the cold hard dirt should be, there is instead a crimson coating of blood. 
You whip your head around in alarm, and are thrown off by the presence of another person approaching behind you. You're thrown off just enought you stumble backwards, narrowly missing a concealed blade coming in contact with your neck. You draw {helm: your old hatchet| {weapon}} and prepare for a fight. 

+ Take a swing. This brigand doesn't know who they're challenging. -> fight
+ Make a run for it. You don't want to hurt yourself on such an important job. -> run
+ Stake your claim. Surely they can see reason and leave you be. -> reason
-> END

== fight ==
{aethermaul:
~ bandit = false
The Aethermaul makes quick work of the blackguard. It feels as though you're swinging a stick around like a child playing pretend, but you jerk back to reality when it comes in impact, sending a painful jolt up your arm. Once you recover, the bandit lies on the ground, teeth scattered over the white snow, only outlined by the fresh blood, and neck past the point of no return.
You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. Next time, you won't be so quick to act, but for now, all you can do is move on.
Health: {health}
-> wood_entrance
}
{knife:
~ bandit = false
~ health --
You brought a knife to a swordfight, but you scrape by. The altercation is brief, or at least it felt that way through all the adrenaline. By the time you're back in your own senses, the bandit is on the ground, a deep, wide laceration across the abdomen.You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. Next time, you won't be so quick to act, but for now, all you can do is move on.
Health: {health}
-> wood_entrance
}
{run && chaosbinder:
~ bandit = false
Having gained some distance and safety, you slowly draw and knock back an arrow. With a defeaning crack, and flash of light, it is released, and embeds deep within your attacker's chest with enough force to send them several feet backwards, unable to get up from a pool of their own blood.
You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. Next time, you won't be so quick to act, but for now, all you can do is move on.
Health: {health}
-> wood_entrance
}
You try to attack, but your {helm: old, worn hatchet| bow and arrows} can't hold their own against your attacker's much nicer looking sword.
~ health --
Health: {health}
{health == 0: -> death}
-> alley
-> END

== run ==
{chaosbinder:
You turn around and start to run. The bandit takes advantage of your back being turned, and is just that much quicker. But right as their sword would have cut you down, a burst of color shoots of the cracks of Chaosbinder. 
When your vision returns you see that blackguard on his knees, still shaking off the asssault, and you are a few feet further away. Your hands and wrist burn, but there's an oppurtunity.
-> alley
}
You turn around and start to run. The bandit takes advantage of your back being turned, and is just that much quicker.You feel pain shooting throughout your body as your back is sliced open, and everything seems to move in slow motion as your adrenaline surges you forward before it can cut too deeply.
This burst of energy is too difficult to control, and you trip over yourself but manage to stay on your feet. Still, your attacker is able to use this to catch up, and you're right back where you were, with one more cut than before.
~ health --
Health: {health}
{health == 0: -> death}
-> alley
-> END

== reason ==
{helm:
The figure raises their sword and begins to rush you. You stand your ground, and call out to them.
"Enough. Who are you who thinks you have any business attacking me. I'm on official business of Count Vedillan, and he is not the kind of man with which you want any quarry. Move along or I cannot guarantee your safety."
Your voice resonates within the silver helm enclosing your head, and projects itself in a booming, steely manner. The bandit stops dead in his tracks, lowers his sword, and removes his face covering.
"I was told this was quick easy money. Take the job, get in with the Count, take the reward. But if this is the person being sent to do his business, I'm afraid I'm out of my depth on this one."
}
+ {helm} ["I'd recommend making yourself scarce, and finding yourself another occupation. Not everyone will be as understanding as me."] -> spare
+ {helm} ["I'm afraid you are. Consider this your retirement."] -> kill

"I'm on a contract from Count Vedillan himself. Hurt me and you'll be making an enemy in a very high place."
"I know all about your little chore. Hand over what he gave you and I'll take care of it." He flicks his sword, leaving a gash in your thigh. "Next time I'll go a bit deeper."
~ health --
Health: {health}

{health == 0: -> death}
-> END

== spare ==
"It ain't that easy, but I appreciate the thought. I'm meant to be moving along anyways. You ever find yourself in Gorlaed and doing business with the Ydallmyr, ask for Nik."
Nik wanders off, and you take a moment to catch your breath. That could have been worse. Much worse. And now you have a new name to carry with you on your path forward.
~ bandit = false
Health: {health}
->wood_entrance
-> END

== kill ==
You raise your old, chipped hatchet above your head, and it leaves your fingertips with all the force in your body. Your attacker tries to defend himself but the axe head embeds deep into his clavicle, redirecting his blocking blade into him as well. He falls back, unmoving.
You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. You could have asked more questions. You could have controlled your rage. You could have come up with a cooler one-liner. But for now, all you can do is move on.
~bandit = false
Health = {health}
->wood_entrance
-> END

== death ==
You've sustained your last blow. Your chest struggles to rise and fall like normal. You're tired, but there's more to do. You'll feel better once you catch your breath. But gods are you tired, and your legs don't want to carry you further. So your breath runs off, with everything you had left to say. All that's left is to close your eyes, and talk to the King of Dreams, and his sister, Death Herself.
-> END