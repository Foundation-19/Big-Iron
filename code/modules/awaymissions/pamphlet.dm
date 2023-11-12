/obj/item/paper/pamphlet
	name = "pamphlet"
	icon_state = "pamphlet"

/obj/item/paper/pamphlet/gateway
	info = "<b>Welcome to the Nanotrasen Gateway project...</b><br>\
			Congratulations! If you're reading this, you and your superiors have decided that you're \
			ready to commit to a life spent colonising the rolling hills of far away worlds. You \
			must be ready for a lifetime of adventure, a little bit of hard work, and an award \
			winning dental plan- but that's not all the Nanotrasen Gateway project has to offer.<br>\
			<br>Because we care about you, we feel it is only fair to make sure you know the risks \
			before you commit to joining the Nanotrasen Gateway project. All away destinations have \
			been fully scanned by a Nanotrasen expeditionary team, and are certified to be 100% safe. \
			We've even left a case of space beer along with the basic materials you'll need to expand \
			Nanotrasen's operational area and start your new life.<br><br>\
			<b>Gateway Operation Basics</b><br>\
			All Nanotrasen approved Gateways operate on the same basic principals. They operate off \
			area equipment power as you would expect, and without this supply, it cannot safely function, \
			causinng it to reject all attempts at operation.<br><br>\
			Once it is correctly setup, and once it has enough power to operate, the Gateway will begin \
			searching for an output location. The amount of time this takes is variable, but the Gateway \
			interface will give you an estimate accurate to the minute. Power loss will not interrupt the \
			searching process. Influenza will not interrupt the searching process. Temporal anomalies \
			may cause the estimate to be inaccurate, but will not interrupt the searching process.<br><br> \
			<b>Life On The Other Side</b><br>\
			Once you have traversed the Gateway, you may experience some disorientation. Do not panic. \
			This is a normal side effect of travelling vast distances in a short period of time. You should \
			survey the immediate area, and attempt to locate your complimentary case of space beer. Our \
			expeditionary teams have ensured the complete safety of all away locations, but in a small \
			number of cases, the Gateway they have established may not be immediately obvious. \
			Do not panic if you cannot locate the return Gateway. Begin colonisation of the destination. \
			<br><br><b>A New World</b><br>\
			As a participant in the Nanotrasen Gateway Project, you will be on the frontiers of space. \
			Though complete safety is assured, participants are advised to prepare for inhospitable \
			environs."

//we don't want the silly text overlay!
/obj/item/paper/pamphlet/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_blocker)

/obj/item/paper/pamphlet/church1
	name = "Let Faith Be Your Shield"
	icon_state = "pamphlet1"
	info = "<p><strong>LET FAITH BE YOUR SHIELD</strong></p> <p>Are you disillusioned with life? Starving, destitute? Do you desire community, brotherhood, and a structured life? No matter your background, past, or social status, the Church will accept you into the fold, free of charge. If you are suffering from indebtedness, the Church will even pay off any debts lower than 500 caps when you join the clergy, and will forgive any medical debt you may owe to the Faith itself. Let the Father guide you into the path of Unity! Speak to a Servitor today.</p>"
/obj/item/paper/pamphlet/church2
	name = "Hymn of the Faith"
	icon_state = "pamphlet2"
	info = "<p>Father, guide your children through your Vineyard.<br />Father, guide us down the path to Unity.<br />Father, have mercy upon us<br />Father, have no mercy for the Unbelievers.</p><p>Father, who brought forth the Angels, protect us.<br />Father, who saved us from destruction, protect us.<br />Father, who shielded us from barbarism, protect us.<br />Father, who showed us the way to Unity, protect us.</p>"
