/*********************MANUALS (BOOKS)***********************/

//Oh god what the fuck I am not good at computer
/obj/item/book/manual
	icon = 'icons/obj/library.dmi'
	due_date = 0 // Game time in 1/10th seconds
	unique = TRUE   // FALSE - Normal book, TRUE - Should not be treated as normal book, unable to be copied, unable to be modified

/obj/item/book/manual/hydroponics_pod_people
	name = "The Human Harvest - From seed to market"
	icon_state ="bookHydroponicsPodPeople"
	author = "Farmer John" // Whoever wrote the paper or book, can be changed by pen or PC. It is not automatically assigned.
	title = "The Human Harvest - From seed to market"
	//book contents below
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>
				<h3>Growing Humans</h3>

				Why would you want to grow humans? Well I'm expecting most readers to be in the slave trade, but a few might actually
				want to revive fallen comrades. Growing pod people is easy, but prone to disaster.
				<p>
				<ol>
				<li>Find a dead person who is in need of cloning. </li>
				<li>Take a blood sample with a syringe. </li>
				<li>Inject a seed pack with the blood sample. </li>
				<li>Plant the seeds. </li>
				<li>Tend to the plants water and nutrition levels until it is time to harvest the cloned human.</li>
				</ol>
				<p>
				It really is that easy! Good luck!

				</body>
				</html>
				"}

/obj/item/book/manual/ripley_build_and_repair
	name = "APLU \"Ripley\" Construction and Operation Manual"
	icon_state ="book"
	author = "Weyland-Yutani Corp"
	title = "APLU \"Ripley\" Construction and Operation Manual"
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>
				<center>
				<b style='font-size: 12px;'>Weyland-Yutani - Building Better Worlds</b>
				<h1>Autonomous Power Loader Unit \"Ripley\"</h1>
				</center>
				<h2>Specifications:</h2>
				<ul>
				<li><b>Class:</b> Autonomous Power Loader</li>
				<li><b>Scope:</b> Logistics and Construction</li>
				<li><b>Weight:</b> 820kg (without operator and with empty cargo compartment)</li>
				<li><b>Height:</b> 2.5m</li>
				<li><b>Width:</b> 1.8m</li>
				<li><b>Top speed:</b> 5km/hour</li>
				<li><b>Operation in vacuum/hostile environment:</b> Possible</b>
				<li><b>Airtank Volume:</b> 500liters</li>
				<li><b>Devices:</b>
					<ul>
					<li>Hydraulic Clamp</li>
					<li>High-speed Drill</li>
					</ul>
				</li>
				<li><b>Propulsion Device:</b> Powercell-powered electro-hydraulic system.</li>
				<li><b>Powercell capacity:</b> Varies.</li>
				</ul>

				<h2>Construction:</h2>
				<ol>
				<li>Connect all exosuit parts to the chassis frame</li>
				<li>Connect all hydraulic fittings and tighten them up with a wrench</li>
				<li>Adjust the servohydraulics with a screwdriver</li>
				<li>Wire the chassis. (Cable is not included.)</li>
				<li>Use the wirecutters to remove the excess cable if needed.</li>
				<li>Install the central control module (Not included. Use supplied datadisk to create one).</li>
				<li>Secure the mainboard with a screwdriver.</li>
				<li>Install the peripherals control module (Not included. Use supplied datadisk to create one).</li>
				<li>Secure the peripherals control module with a screwdriver</li>
				<li>Install the internal armor plating (Not included due to Nanotrasen regulations. Can be made using 5 metal sheets.)</li>
				<li>Secure the internal armor plating with a wrench</li>
				<li>Weld the internal armor plating to the chassis</li>
				<li>Install the external reinforced armor plating (Not included due to Nanotrasen regulations. Can be made using 5 reinforced metal sheets.)</li>
				<li>Secure the external reinforced armor plating with a wrench</li>
				<li>Weld the external reinforced armor plating to the chassis</li>
				<li></li>
				<li>Additional Information:</li>
				<li>The firefighting variation is made in a similar fashion.</li>
				<li>A firesuit must be connected to the Firefighter chassis for heat shielding.</li>
				<li>Internal armor is plasteel for additional strength.</li>
				<li>External armor must be installed in 2 parts, totaling 10 sheets.</li>
				<li>Completed mech is more resiliant against fire, and is a bit more durable overall</li>
				<li>Nanotrasen is determined to the safety of its <s>investments</s> employees.</li>
				</ol>
				</body>
				</html>

				<h2>Operation</h2>
				Please consult the Nanotrasen compendium "Robotics for Dummies".
			"}

/obj/item/book/manual/chef_recipes
	name = "Chef Recipes"
	icon_state = "cooked_book"
	author = "Lord Frenrir Cageth"
	title = "Chef Recipes"
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>

				<h1>Food for Dummies</h1>
				Here is a guide on basic food recipes and also how to not poison your customers accidentally.


				<h2>Basic ingredients preparation:</h2>

				<b>Dough:</b> 10u water + 15u flour for simple dough.<br>
				15u egg yolk + 15u flour + 5u sugar for cake batter.<br>
				Doughs can be transformed by using a knife and rolling pin.<br>
				All doughs can be microwaved.<br>
				<b>Bowl:</b> Add water to it for soup preparation.<br>
				<b>Meat:</b> Microwave it, process it, slice it into microwavable cutlets with your knife, or use it raw.<br>
				<b>Cheese:</b> Add 5u universal enzyme (catalyst) to milk and soy milk to prepare cheese (sliceable) and tofu.<br>
				<b>Rice:</b> Mix 10u rice with 10u water in a bowl then microwave it.

				<h2>Custom food:</h2>
				Add ingredients to a base item to prepare a custom meal.<br>
				The bases are:<br>
				- bun (burger)<br>
				- breadslices(sandwich)<br>
				- plain bread<br>
				- plain pie<br>
				- vanilla cake<br>
				- empty bowl (salad)<br>
				- bowl with 10u water (soup)<br>
				- boiled spaghetti<br>
				- pizza bread<br>
				- metal rod (kebab)

				<h2>Table Craft:</h2>
				Put ingredients on table, then click and drag the table onto yourself to see what recipes you can prepare.

				<h2>Microwave:</h2>
				Use it to cook or boil food ingredients (meats, doughs, egg, spaghetti, donkpocket, etc...).
				It can cook multiple items at once.

				<h2>Processor:</h2>
				Use it to process certain ingredients (meat into meatball, doughslice into spaghetti, potato into fries,etc...)

				<h2>Gibber:</h2>
				Stuff an animal in it to grind it into meat.

				<h2>Meat spike:</h2>
				Stick an animal on it then begin collecting its meat.


				<h2>Example recipes:</h2>
				<b>Vanilla Cake</b>: Microwave cake batter.<br>
				<b>Burger:</b> 1 bun + 1 meat steak<br>
				<b>Bread:</b> Microwave dough.<br>
				<b>Waffles:</b> 2 pastry base<br>
				<b>Popcorn:</b> Microwave corn.<br>
				<b>Meat Steak:</b> Microwave meat.<br>
				<b>Meat Pie:</b> 1 plain pie + 1u black pepper + 1u salt + 2 meat cutlets<br>
				<b>Boiled Spagetti:</b> Microwave spaghetti.<br>
				<b>Donuts:</b> 1u sugar + 1 pastry base<br>
				<b>Fries:</b> Process potato.

				<h2>Sharing your food:</h2>
				You can put your meals on your kitchen counter or load them in the snack vending machines.
				</body>
				</html>
			"}
////////
//COTC//
////////

/obj/item/book/manual/ritualbook
	name = "Ritual Book"
	icon_state = "the_book_3"
	author = "High Priest Atlas"
	title = "Ritual Book"
	dat = {"<html>
				<p><strong>THE RITUAL OF HEALING</strong></p>
<p>A Supplicant enters the Garden, wounded, dying, or dead. The world has not been kind to them, but the Father will show mercy to them.</p>
<p>A Supplicant&rsquo;s belongings are their own. They keep their rags, for they have not yet accepted the Father, nor he them. Those who have erred against the Church waive this right, their belongings forfeit.</p>
<p>A Supplicant&rsquo;s wounds are tended, and payment must be rendered. The Father demands a price. The price is first to be paid in belongings. Caps, coins, trinkets and baubles, they must pay for the Mercy of the Father&rsquo;s Servants.</p>
<p>A Supplicant cannot pay with their worldly belongings, and so the second mercy is offered. Inform the Garden, and all those who would hear, of their plight. Let any man step up, and pay their debts.</p>
<p>A Supplicant cannot pay, and none will step forward to pay for them. They have been outcast by this world, with no possessions or friends to aid them. But the Father is merciful, and their appearance a divine gift. This wayward soul, without a penny or a friend, is welcomed into the Faith, to serve the Father in payment, forever.</p>
<p>&nbsp;</p>
<p><strong>THE NEOPHYTE VOWS</strong></p>
<p>The Supplicant has been granted the Father&rsquo;s mercy, and must be made to say the words, and seal themselves to the Father forevermore. Should the Supplicant be unwilling, or the words said in deceit, the Listener is to instruct them, harshly, until they are ready.</p>
<p>Supplicant: I swear my life to the Church, and bind my soul to the Father. I swear my undying service to the Church.</p>
<p>Listener: The Church accepts your offering. The Father claims your life in service.</p>
<p>Supplicant: I am but a humble vessel for the Father&rsquo;s mercy, a tool by which the Vineyard is allowed to grow. All my works are devoted to His cause.</p>
<p>Listener: The Vineyard grows through broken soil, with your aid. The Father accepts your labor.</p>
<p>Supplicant: I banish all worldly desires and pleasures, atomized in the cleansing fire of the Holy Flame. The Father&rsquo;s love washes over me, and I live only for Him.</p>
<p>Listener: Be cleansed, and live your life anew for Him. Supplicant: I swear to be faithful to my Brothers and Sisters in the faith, to obey all commands, and to never betray the Faith&rsquo;s secrets. The Church is my family now, and the Unbeliever my enemy.</p>
<p>Listener: We welcome you into our family. May the Father guide and protect you. May the Vineyard shelter you from the Unbeliever's Horde. May the Holy Flame purify and inspire you. The Listener must now apply the brand of the Church.</p>
<p>&nbsp;</p>
<p><strong>PRAYERS</strong></p>
<p>Healing Prayer:</p>
<p>May the Father&rsquo;s mercy wash over you, and mend your wounds. May the Vineyard&rsquo;s life flow through your veins, and fortify your blood. May the Holy Flame purify the wounds, and keep them clean of infection. Through the will of the Father, may you be healed. Amen.</p>
<p>Ritual of Castigation:</p>
<p>This ritual requires a Sinner, and a Teacher.</p>
<p>Teacher: I channel the spirit of the Holy Flame through me. May it give me the strength to purify your sin, and cleanse you of corruption.</p>
<p>The Teacher may now strike the Sinner until the punishment is complete.</p>
<p>Battle Prayer:</p>
<p>Father, we go to do battle in your name. Give us the strength to fight the Unbeliever&rsquo;s hordes, and to be victorious over them. Lend us the vitality of your Vineyard, let us be as certain in our cause as the roots of the great trees that grow within it. Lend us the might of the Holy Flame, that we may purify this world of your enemies. Grant us victory, and grant us the mercy of serving you in death, should we fall.</p>
<p>Blessing:</p>
<p>May the Father bless you, and bring you fortune and peace. May the Father be merciful, and grant you a long and happy life. May the Father protect you, and grant you safety and fortitude. In the name of the Father and the Holy Flame, we bless you.</p>
				</html>
			"}


/obj/item/book/manual/thebook
	name = "The Book"
	icon_state = "the_book_2"
	author = "High Priest Atlas"
	title = "The Book"
	dat = {"<html>
				<p><strong>THE FIRST TESTAMENT: THE LIFE AND DEATH OF THE HOLY FATHER </strong></p>
<p>And it is written that, in our time of need, the Holy Father did come to our aid. When His Holy Flame had purified this earth, and left naught but remnants, he did come to us. And he did say to us, his children, that he had come to make a better place. He had come to make us whole. And we, his children, listened.</p>
<p>So it is written that the First Church, and the Last, was built by the Holy Father&rsquo;s children on this earth. And we did toil in the Holy Father&rsquo;s light, and it was good. We turned His garden, now sodden with weeds, into a Vineyard of Life, and the Holy Father spoke unto us &ldquo;You have done well, my children. Through you, I shall bring utopia to all who lie under the sun and below the earth.&rdquo; And we knew it to be true.</p>
<p>Then came the devils, the unbelievers, the heretics. They came to the First Church, and they spat poison and treachery. Twisted were they, corrupted by the venomous words of the Arch Unbeliever. Their words were blasphemy, but we did welcome them with open arms, as we welcome all children of the Holy Father, and asked them to join us in Utopia. They spat at us, and slaughtered the children.</p>
<p>The Holy Father&rsquo;s angels fought to save the children, but the hordes of the Unbeliever were unending, and they too fell beneath their twisted flesh. The Arch Unbeliever, having slaughtered all the Holy Father&rsquo;s children and angels, came to the Holy Father himself. The Holy Father saw what the unbelievers had done, and he wept. This world was not yet ready for the Utopia that was promised, he did say. And so the Holy Father returned to the place beyond, and the Arch Unbelievers dogs did rule the earth.</p>
<p><strong>THE SECOND TESTAMENT: THE EXODUS </strong></p>
<p>So it is written that the Holy Father left us, his surviving children. The Unbeliever had poisoned the sacred vineyard with the blood of the holy, and made a new Hell upon earth. So it is that we, the children that survived, departed the tainted lands in search of new Truth.</p>
<p>For 900 days and 900 nights, the children traveled the tainted Vineyard, searching for salvation beyond. On the last night, the Holy Father spoke to them thus: &ldquo;You have traveled long and far, my children, and you have found salvation. These lands are yet untouched by the Unbelievers' corruption, and they shall be the foundations for a new Church, a new Vineyard. Go out, and bring my word to all the children of my world.&rdquo; And the children did know that the Holy Father&rsquo;s word was good. And so, the New Church was born.</p>
<p>The people of the new Vineyard were low and miserable. Untouched by the Holy Father&rsquo;s light, they were naught but insects, crawling in the muck of creation. The children felt the Father&rsquo;s pity for them, and they did bring them the Father&rsquo;s blessings. The children vowed to tend their wounds, and the people of the Vineyard vowed to help the children create their Church. So was the pact sealed</p>
<p>So it is that the children of the Father and the children of the Vineyard did mingle, and become one. The new children served their Father and his servitors diligently, and did ever work for the good of life. Ever vigilant for the unbelievers and heretics that would corrupt their sacred work, they did toil in the Father&rsquo;s name, and for the Father&rsquo;s dream of Unity.</p>
<p><strong>THE THIRD TESTAMENT: ARMAGEDDON AND UNITY</strong></p>
<p>And it is written that one day, the Holy Father will return to his children on earth. His Angels shall descend from the heavens, and they shall destroy the Unbeliever&rsquo;s works, and bring the children into the Utopia the Holy Father has promised them.</p>
<p>It shall begin with a sign from the Holy Father. He shall bestow a great gift to the children, a gift of the sacred unguents that once brought peace to the Vineyard. His children will know this gift to be his, and they shall begin the return of the Angels to earth.</p>
<p>When the Angels return, the Father shall bring holy vengeance upon those who destroyed his children. It is written that the Vineyard shall run red with the blood of the Unbelievers, and holy fire shall consume all of the Unbelievers work. Purifying flames shall cleanse the Vineyard of old, and all shall know that the Holy Father is their lord.</p>
<p>When the Vineyard has been cleansed of Unbelievers, the Children shall return to the First Church, and shall create the Utopia the Father promised. All the world shall join the Father&rsquo;s children, and we shall all march together into sacred Unity.</p>
				</html>
			"}

/obj/item/book/manual/thebook/purple
	name = "The Purple Book"
	icon_state = "the_book"
	author = "High Priest Atlas"
	title = "The Purple Book"
	dat = {"<html>
				<p><strong>THE PURPLE BOOK </strong></p>
				<p><strong>FOR THE HIGH PRIEST'S EYES ONLY </strong></p>
<p><span style="font-weight: 400;">Greetings, inheritor of the Faith. This is the true history of the Church and it&rsquo;s Children, which until now has been concealed. I apologize for this deception, but I am sure you will realize the necessity of it, given the contents of these pages. It was as critical that you be kept in the dark then as it is critical that you know the true purpose now.&nbsp;</span></p>
<p><span style="font-weight: 400;">We were not always known merely as &ldquo;the Church.&rdquo; Once, in the distant land the scriptures speak of, back when the Angels walked the Garden, we lived in the land of California. We were, as the scriptures say, in paradise there, and the Father, or as we called him, the Master, ruled us with a benevolent hand. That was until the Unbeliever, or as he is known in California, the Vault Dweller, destroyed our Master and drove us out.&nbsp;</span></p>
<p><span style="font-weight: 400;">Only a few of us true faithful survived the destruction of the Cathedral, and fewer still survived the journey ahead. Fleeing from the murderous Unbelievers, we fled to the East for nearly a generation. It was hard, and few survived the journey. When we found this town, with its primitive people hiding within the ruins of an old world church, we knew we had found salvation.</span></p>
<p><span style="font-weight: 400;">It was not difficult to convert them to our ways, but we kept many things hidden. The Church we founded was not like the Cathedral of old. The Master could no longer guide us, and we lacked resources. Furthermore, it grew ever more difficult to find willing converts to the cause, even when we offered free aid. It is for this reason that we grew the system of medical debt conversion, a system which I am sure you are well acquainted with. It has served us well over the years, and I trust you will preserve it until the time comes.</span></p>
<p><span style="font-weight: 400;">What is most important is that you understand why we made the journey, and how the Master&rsquo;s death can be avenged. The Angels must be restored, and to do that, we must find the Sacred Elixir which the Master once kept in abundance. Moreover, we must take revenge upon the Master&rsquo;s killers. The Unbelievers must be made to pay for what they did to us, to him. One day, they will come for you.</span></p>
<p><span style="font-weight: 400;">The following organizations are and were agents of the Arch Unbeliever, and must be destroyed at any cost.</span></p>
<p><span style="font-weight: 400;">The so called &ldquo;Brotherhood of Steel&rdquo;</span></p>
<p><span style="font-weight: 400;">The so called &ldquo;Followers of the Apocalypse&rdquo;</span></p>
<p><span style="font-weight: 400;">The fledgeling &ldquo;New California Republic&rdquo;, which we have heard rumors of even here.</span></p>
<p><span style="font-weight: 400;">Any man who bears the mark of the accursed Vault 13.</span><span style="font-weight: 400;"><br /><br /></span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father, guide your children through your Vineyard.</span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father, guide us down the path to Unity.</span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father, have mercy upon us</span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father, have no mercy for the Unbelievers.</span></p>
<p>&nbsp;</p>
<p style="text-align: center;"><span style="font-weight: 400;">Father,&nbsp; who brought forth the Angels, protect us.</span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father,&nbsp; who saved us from destruction, protect us.</span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father, who shielded us from barbarism, protect us.</span></p>
<p style="text-align: center;"><span style="font-weight: 400;">Father, who showed us the way to Unity, protect us.</span></p>
				</html>
			"}

//////////////////

/obj/item/book/manual/nuka_recipes
	name = "Nuka-Cola Recipes"
	icon_state = "barbook"
	author = "Lord Frenrir Cageth"
	title = "Nuka-Cola Recipes"
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>

				<h1>Nuka for Dummies</h1>
				Here is a list of all of the secret recipes to America's favorite soft drink! (Other, inferior drink recipes included.)


				<h2>Nuka Recipes:</h2>

				<b>Nuka Float:</b> Nuka Cola 5u + Sugar 5u + Cream 5u.<br>
				<b>Nuka Shine:</b> Nuka Cola 5u + Beer 5u.<br>
				<b>Nuka Victory:</b> Nuka Cola 5u + Thirteen Loko 5u.<br>
				<b>Nuka Quartz:</b> Nuka Cola 5u + Sugar 5u + Silicon 5u.<br>
				<b>Nuka Cherry:</b> Nuka Cola 3u + Cherry Jelly 1u<br>
				<b>Nuka Love:</b> Nuka Cherry 5u + Nuka Quartz 5u<br>
				<b>Nuka Quantum:</b> Nuka Cola 2u + Uranium 1u + Bluespace Dust 1u + Blue Cherry Jelly 1u<br>
				<b>Nuka Grape:</b> Nuka Cola 5u + Grape Juice 5u<br>
				<b>Nuka Dark:</b> Nuka Cola 5u + Rum 5u<br>
				<b>Nuka Orange:</b> Nuka Cola 5u + Orange Juice 5u<br>
				<b>Nuka Wild:</b> Nuka Cola 5u + Sunset Sasparilla 5u<br>
				<b>Nuka with ice:</b> Nuka Cola 5u + some ice<br>
				<b>Newka Cola:</b> Nuka Cherry 5u + Nuka Wild 5u + Ice 5u<br>
				<b>Nuka Berry:</b> Nuka Grape 5u + Nuka Cherry 5u + Ice 5u<br>
				<b>Nuka Bombdrop:</b> Nuka Dark 5u + Alcohol Z 5u + Sugar 5u<br>
				<b>Industrial Strength Drain Cleaner (NOT FIT FOR HUMAN CONSUMPTION):</b> Nuka Bombdrop 5u + Nuka Quantum 5u + Ice 5u<br>
				<b>Nuka Cooler:</b> Nuka Iced 5u + more ice + some water<br>
				<b>Diet Nuka:</b> Nuka Cola 5u + salt + water<br>
				<b>Nuka Frutti:</b> Nuka Berry 5u + Nuka Orange 5u + Ice 5u<br>
				<b>Nuka Punch:</b> Nuka Dark 5u + Distilled Tobacco (deathroach) 5u + Punga Juice 5u<br>
				<b>Nuka X-TREME:</b>  <li>A cartoon drawing of a nuclear warhead.</li> 5u + Nuka Quantum 5u + Ice 5u<br>


				<h2>Vim Drinks (Midwestern favorite!):</h2>
				<b>Vim Captain's Blend:</b> Vim 10u + Fermented Broc flower (broc brew) 10u + Gold 10u<br>
				<b>Vim Quartz:</b> Nuka Cola 5u + Soy Milk 5u + Sugar 5u<br>
				<b>Vim Refresh:</b> Vim 5u + Lime Juice 5u + Ice 5u<br>
				<b>Vim Ice:</b> Nuka Cola 5u + Ice 5u + Water 5u<br>


				<h2>Assorted Drinks:</h2>
				<b>Alcohol-Z:</b> Whiskey 5u + Vodka 5u + Rum 5u<br>
				<b>Ballistic Bock:</b> Blackpowder 5u + Radium 5u + Water 5u<br>
				<b>BATTLE BREW:</b> Med-X 5u + Vodka 5u<br>
				<b>Blackwater Brew:</b> Water 5u + Charcoal 5u + Beer 5u<br>
				<b>Dirty Wastelander:</b> Mutfruit Juice 5u + Whiskey 10u + Water 10u<br>
				<b>Fire Belly:</b> Vodka 5u + Soy Sauce 5u + Salt 5u<br>
				<b>Firecracker:</b> Fermented Xander Root (Salgam) 5u + Yucca Juice 5u<br>
				<b>Hard Lemonade:</b> Lemonade 5u + Vodka 5u + radium for some godforsaken reason<br>
				<b>Jake Juice:</b> Whiskey 5u + Beer 5u + more fucking radium<br>
				<b>Wasteland Tequila</b>: Tequila 5u + Mutfruit Juice 5u<br>
				<b>Sunset Float:</b>Sunset Sasparilla 5u + Ice 5u + Cream 5u<br>
				</body>
				</html>
			"}

/obj/item/book/manual/nuclear
	name = "Fission Mailed: Nuclear Sabotage 101"
	icon_state ="bookNuclear"
	author = "Syndicate"
	title = "Fission Mailed: Nuclear Sabotage 101"
	dat = {"<html>
			<head>
			<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
			</head>
			<body>
			Nuclear Explosives 101:<br>
			Hello and thank you for choosing the Syndicate for your nuclear information needs.<br>
			Today's crash course will deal with the operation of a Fusion Class Nanotrasen made Nuclear Device.<br>
			First and foremost, DO NOT TOUCH ANYTHING UNTIL THE BOMB IS IN PLACE.<br>
			Pressing any button on the compacted bomb will cause it to extend and bolt itself into place.<br>
			If this is done to unbolt it one must completely log in which at this time may not be possible.<br>
			To make the nuclear device functional:<br>
			<li>Place the nuclear device in the designated detonation zone.</li>
			<li>Extend and anchor the nuclear device from its interface.</li>
			<li>Insert the nuclear authorisation disk into slot.</li>
			<li>Type numeric authorisation code into the keypad. This should have been provided. Note: If you make a mistake press R to reset the device.
			<li>Press the E button to log onto the device.</li>
			You now have activated the device. To deactivate the buttons at anytime for example when you've already prepped the bomb for detonation	remove the auth disk OR press the R on the keypad.<br>
			Now the bomb CAN ONLY be detonated using the timer. Manual detonation is not an option.<br>
			Note: Nanotrasen is a pain in the neck.<br>
			Toggle off the SAFETY.<br>
			Note: You wouldn't believe how many Syndicate Operatives with doctorates have forgotten this step.<br>
			So use the - - and + + to set a det time between 5 seconds and 10 minutes.<br>
			Then press the timer toggle button to start the countdown.<br>
			Now remove the auth. disk so that the buttons deactivate.<br>
			Note: THE BOMB IS STILL SET AND WILL DETONATE<br>
			Now before you remove the disk if you need to move the bomb you can:<br>
			Toggle off the anchor, move it, and re-anchor.<br><br>
			Good luck. Remember the order:<br>
			<b>Disk, Code, Safety, Timer, Disk, RUN!</b><br>
			Intelligence Analysts believe that normal Nanotrasen procedure is for the Captain to secure the nuclear authorisation disk.<br>
			Good luck!
			</body>
			</html>"}

// Wiki books that are linked to the configured wiki link.

// A book that links to the wiki
/obj/item/book/manual/wiki
	var/page_link = ""
	window_size = "970x710"

/obj/item/book/manual/wiki/attack_self()
	if(!dat)
		initialize_wikibook()
	..()

/obj/item/book/manual/wiki/proc/initialize_wikibook()
	var/wikiurl = CONFIG_GET(string/wikiurltg)
	if(wikiurl)
		dat = {"

			<html><head>
			<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
			<style>
				iframe {
					display: none;
				}
			</style>
			</head>
			<body>
			<script type="text/javascript">
				function pageloaded(myframe) {
					document.getElementById("loading").style.display = "none";
					myframe.style.display = "inline";
				}
			</script>
			<p id='loading'>You start skimming through the manual...</p>
			<iframe width='100%' height='97%' onload="pageloaded(this)" src="[wikiurl]/[page_link]?printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
			</body>

			</html>

			"}

/obj/item/book/manual/wiki/cit
	name = "Citadel infobook"
	icon_state ="book8"
	author = "Nanotrasen"
	title = "Citadel infobook"
	page_link = ""
	window_size = "1500x800" //Too squashed otherwise

/obj/item/book/manual/wiki/cit/initialize_wikibook()
	var/wikiurl = CONFIG_GET(string/wikiurl)
	if(wikiurl)
		dat = {"

			<html><head>
			<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
			<style>
				iframe {
					display: none;
				}
			</style>
			</head>
			<body>
			<script type="text/javascript">
				function pageloaded(myframe) {
					document.getElementById("loading").style.display = "none";
					myframe.style.display = "block";
				}
			</script>
			<p id='loading'>You start skimming through the manual...</p>
			<iframe width='100%' height='97%' onload="pageloaded(this)" src="[wikiurl]/[page_link]" frameborder="0" id="main_frame"></iframe>
			</body>

			</html>

			"}

/obj/item/book/manual/wiki/cit/chemistry
	name = "Chemistry Textbook"
	icon_state ="chemistrybook"
	author = "Nanotrasen"
	title = "Chemistry Textbook"
	page_link = "main/guides/guide_chemistry"

/obj/item/book/manual/wiki/cit/chem_recipies
	name = "Chemistry Recipies"
	icon_state ="chemrecibook"
	author = "Chemcat"
	title = "Chemistry Recipies"
	page_link = "main/guides/chem_recipies"

/obj/item/book/manual/wiki/chemistry
	name = "Outdated Chemistry Textbook"
	icon_state ="chemistrybook_old"
	author = "Nanotrasen"
	title = "Outdated Chemistry Textbook"
	page_link = "Guide_to_chemistry"

///obj/item/book/manual/wiki/chemistry/Initialize()
//	..()
//	new /obj/item/book/manual/wiki/cit/chemistry(loc)
//	new /obj/item/book/manual/wiki/cit/chem_recipies(loc)

/obj/item/book/manual/wiki/engineering_construction
	name = "Station Repairs and Construction"
	icon_state ="bookEngineering"
	author = "Engineering Encyclopedia"
	title = "Station Repairs and Construction"
	page_link = "Guide_to_construction"

/obj/item/book/manual/wiki/engineering_guide
	name = "Engineering Textbook"
	icon_state ="bookEngineering2"
	author = "Engineering Encyclopedia"
	title = "Engineering Textbook"
	page_link = "Guide_to_engineering"

/obj/item/book/manual/wiki/engineering_singulo_tesla
	name = "Singularity and Tesla for Dummies"
	icon_state ="bookEngineeringSingularitySafety"
	author = "Engineering Encyclopedia"
	title = "Singularity and Tesla for Dummies"
	page_link = "Singularity_and_Tesla_engines"

/obj/item/book/manual/wiki/security_space_law
	name = "Space Law"
	desc = "A set of Nanotrasen guidelines for keeping law and order on their space stations."
	icon_state = "bookSpaceLaw"
	author = "Nanotrasen"
	title = "Space Law"
	page_link = "Space_Law"

/obj/item/book/manual/wiki/security_space_law/suicide_act(mob/living/user)
	user.visible_message("<span class='suicide'>[user] pretends to read \the [src] intently... then promptly dies of laughter!</span>")
	return OXYLOSS

/obj/item/book/manual/wiki/infections
	name = "Infections - Making your own pandemic!"
	icon_state = "bookInfections"
	author = "Infections Encyclopedia"
	title = "Infections - Making your own pandemic!"
	page_link = "Infections"

/obj/item/book/manual/wiki/telescience
	name = "Teleportation Science - Bluespace for dummies!"
	icon_state = "book7"
	author = "University of Bluespace"
	title = "Teleportation Science - Bluespace for dummies!"
	page_link = "Guide_to_telescience"

/obj/item/book/manual/wiki/engineering_hacking
	name = "Hacking"
	icon_state ="bookHacking"
	author = "Engineering Encyclopedia"
	title = "Hacking"
	page_link = "Hacking"

/obj/item/book/manual/wiki/detective
	name = "The Film Noir: Proper Procedures for Investigations"
	icon_state ="bookDetective"
	author = "Nanotrasen"
	title = "The Film Noir: Proper Procedures for Investigations"
	page_link = "Detective"

/obj/item/book/manual/wiki/barman_recipes
	name = "Barman Recipes: Mixing Drinks and Changing Lives"
	icon_state = "barbook"
	author = "Sir John Rose"
	title = "Barman Recipes: Mixing Drinks and Changing Lives"
	page_link = "Guide_to_food_and_drinks"

/obj/item/book/manual/wiki/robotics_cyborgs
	name = "Robotics for Dummies"
	icon_state = "borgbook"
	author = "XISC"
	title = "Robotics for Dummies"
	page_link = "Guide_to_robotics"

/obj/item/book/manual/wiki/research_and_development
	name = "Research and Development 101"
	icon_state = "rdbook"
	author = "Dr. L. Ight"
	title = "Research and Development 101"
	page_link = "Guide_to_Research_and_Development"

/obj/item/book/manual/wiki/experimentor
	name = "Mentoring your Experiments"
	icon_state = "rdbook"
	author = "Dr. H.P. Kritz"
	title = "Mentoring your Experiments"
	page_link = "Experimentor"

/obj/item/book/manual/wiki/medical_cloning
	name = "Cloning techniques of the 26th century"
	icon_state ="bookCloning"
	author = "Medical Journal, volume 3"
	title = "Cloning techniques of the 26th century"
	page_link = "Guide_to_genetics#Cloning"

/obj/item/book/manual/wiki/cooking_to_serve_man
	name = "To Serve Man"
	desc = "It's a cookbook!"
	icon_state ="cooked_book"
	author = "the Kanamitan Empire"
	title = "To Serve Man"
	page_link = "Guide_to_food_and_drinks"

/obj/item/book/manual/wiki/circuitry
	name = "Circuitry for Dummies"
	icon_state = "book1"
	author = "Dr. Hans Asperger"
	title = "Circuitry for Dummies"
	page_link = "Guide_to_circuits"

/obj/item/book/manual/wiki/tcomms
	name = "Subspace Telecommunications And You"
	icon_state = "book3"
	author = "Engineering Encyclopedia"
	title = "Subspace Telecommunications And You"
	page_link = "Guide_to_Telecommunications"

/obj/item/book/manual/wiki/atmospherics
	name = "Lexica Atmosia"
	icon_state = "book5"
	author = "the City-state of Atmosia"
	title = "Lexica Atmosia"
	page_link = "Guide_to_Atmospherics"

/obj/item/book/manual/wiki/medicine
	name = "Medical Space Compendium, Volume 638"
	icon_state = "book8"
	author = "Medical Journal"
	title = "Medical Space Compendium, Volume 638"
	page_link = "Guide_to_medicine"

/obj/item/book/manual/wiki/surgery
	name = "Brain Surgery for Dummies"
	icon_state = "book4"
	author = "Dr. F. Fran"
	title = "Brain Surgery for Dummies"
	page_link = "Surgery"

/obj/item/book/manual/wiki/grenades
	name = "DIY Chemical Grenades"
	icon_state = "book2"
	author = "W. Powell"
	title = "DIY Chemical Grenades"
	page_link = "Grenade"

/obj/item/book/manual/wiki/toxins
	name = "Toxins or: How I Learned to Stop Worrying and Love the Maxcap"
	icon_state = "book6"
	author = "Cuban Pete"
	title = "Toxins or: How I Learned to Stop Worrying and Love the Maxcap"
	page_link = "Guide_to_toxins"

/obj/item/book/manual/wiki/toxins/suicide_act(mob/user)
	var/mob/living/carbon/human/H = user
	user.visible_message("<span class='suicide'>[user] starts dancing to the Rhumba Beat! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	playsound(loc, 'sound/effects/spray.ogg', 10, 1, -3)
	if (!QDELETED(H))
		H.emote("spin")
		sleep(20)
		for(var/obj/item/W in H)
			H.dropItemToGround(W)
			if(prob(50))
				step(W, pick(GLOB.alldirs))
		ADD_TRAIT(H, TRAIT_DISFIGURED, TRAIT_GENERIC)
		for(var/i in H.bodyparts)
			var/obj/item/bodypart/BP = i
			BP.generic_bleedstacks += 5
		H.gib_animation()
		sleep(3)
		H.adjustBruteLoss(1000) //to make the body super-bloody
		H.spawn_gibs()
		H.spill_organs()
		H.spread_bodyparts()
	return (BRUTELOSS)
