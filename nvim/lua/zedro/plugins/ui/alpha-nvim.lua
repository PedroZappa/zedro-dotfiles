return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local ascii = {
      [[
    <-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')
       \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_
    ,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)
    |   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |
    |  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |
    |  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |
    |  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |
    `--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--'
    -. . --- ...- .. --
    ]],
      [[
      _   _   U _____ u U  ___ u__     __             __  __
     | \ |"|  \| ___"|/  \/"_ \/\ \   /"/u  ___     U|' \/ '|u
    <|  \| |>  |  _|"    | | | | \ \ / //  |_"_|    \| |\/| |/
    U| |\  |u  | |___.-,_| |_| | /\ V /_,-. | |      | |  | |
     |_| \_|   |_____|\_)-\___/ U  \_/-(_/U/| |\u    |_|  |_|
     ||   \\,-.<<   >>     \\     //   .-,_|___|_,-.<<,-,,-.
     (_")  (_/(__) (__)   (__)   (__)   \_)-' '-(_/  (./  \.)
	]],
      [[
			
                   |"|       #   ___           ___         .      .         ___     
     (((          _|_|_      #  <_*_>        .'_#_`.     .  .:::.          /_\ `*   
    (o o)         (o o)      #  (o o)        |[o o]|       :(o o):  .     (o o)     
ooO--(_)--Ooo-ooO--(_)--Ooo--8---(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-
	]],
      [[
		
    )                             
 ( /(                             
 )\())   (        )   (      )    
((_)\   ))\  (   /((  )\    (     
 _((_) /((_) )\ (_))\((_)   )\  ' 
| \| |(_))  ((_)_)((_)(_) _((_))  
| .` |/ -_)/ _ \\ V / | || '  \() 
|_|\_|\___|\___/ \_/  |_||_|_|_|  
	]],
      [[
		  
 \\\  ///          .-.   wWw    wWwwW  Ww\\\    /// 
 ((O)(O)) wWw    c(O_O)c (O)    (O)(O)(O)((O)  (O)) 
  | \ ||  (O)_  ,'.---.`,( \    / ) (..)  | \  / |  
  ||\\|| .' __)/ /|_|_|\ \\ \  / /   ||   ||\\//||  
  || \ |(  _)  | \_____/ |/  \/  \  _||_  || \/ ||  
  ||  || `.__) '. `---' .`\ `--' / (_/\_) ||    ||  
 (_/  \_)        `-...-'   `-..-'        (_/    \_) 

	  ]],
      [[
			
     .-') _   ('-.                     (`-.           _   .-')    
    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_  
,--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \ ,-.-') ,--.   ,--.)
|   \ |  |\ |  .---'( OO'  .-.  '\   \   /(__/ |  |OO)|   `.'   | 
|    \|  | )|  |    /   |  | |  | \   \ /   /  |  |  \|         | 
|  .     |/(|  '--. \_) |  |\|  |  \   '   /,  |  |(_/|  |'.'|  | 
|  |\    |  |  .--'   \ |  | |  |   \     /__),|  |_.'|  |   |  | 
|  | \   |  |  `---.   `'  '-'  '    \   /   (_|  |   |  |   |  | 
`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--' 

			]],
      [[
░   ░░░  ░        ░░      ░░  ░░░░  ░        ░  ░░░░  ░
▒    ▒▒  ▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒   ▒▒   ▒
▓  ▓  ▓  ▓      ▓▓▓  ▓▓▓▓  ▓▓  ▓▓  ▓▓▓▓▓  ▓▓▓▓        ▓
█  ██    █  ███████  ████  ███    ██████  ████  █  █  █
█  ███   █        ██      █████  ████        █  ████  █
			]],
      [[
    _   __                _         
   / | / /__  ____ _   __(_)___ ___ 
  /  |/ / _ \/ __ \ | / / / __ `__ \
 / /|  /  __/ /_/ / |/ / / / / / / /
/_/ |_/\___/\____/|___/_/_/ /_/ /_/ 
			]],
      [[			
__/\\\\\_____/\\\______________________________________________________________________        
 _\/\\\\\\___\/\\\______________________________________________________________________       
  _\/\\\/\\\__\/\\\_____________________________________________/\\\_____________________      
   _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____/\\\____/\\\_\///_____/\\\\\__/\\\\\___     
    _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\__\//\\\__/\\\___/\\\__/\\\///\\\\\///\\\_    
     _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\__\//\\\/\\\___\/\\\_\/\\\_\//\\\__\/\\\_   
      _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\____\//\\\\\____\/\\\_\/\\\__\/\\\__\/\\\_  
       _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/______\//\\\_____\/\\\_\/\\\__\/\\\__\/\\\_ 
        _\///_____\/////____\//////////_____\/////_________\///______\///__\///___\///___\///__
			]],
      [[
			
  _  _                              _            
 | \| |    ___     ___    __ __    (_)    _ __   
 | .` |   / -_)   / _ \   \ V /    | |   | '  \  
 |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| 
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| 
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' 

			]],
      [[			
 .-. .-.,---.   .---..-.   .-.,-.         
 |  \| || .-'  / .-. )\ \ / / |(||\    /| 
 |   | || `-.  | | |(_)\ V /  (_)|(\  / | 
 | |\  || .-'  | | | |  ) /   | |(_)\/  | 
 | | |)||  `--.\ `-' / (_)    | || \  / | 
 /(  (_)/( __.' )---'         `-'| |\/| | 
(__)   (__)    (_)               '-'  '-' 
			]],
      [[
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   
         ░    ░  ░    ░ ░        ░   ░         ░   
                                ░                  
			]],
      [[			
 ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·. 
•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪
▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·
██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌
▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀

			]],
      [[
			
::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::  
:+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ 
:+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ 
+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ 
+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ 
#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# 
###    #### ########## ########      ###     ########### ###       ### 

			]],
      [[
>==>    >=>                                                    
>> >=>  >=>                                   >>               
>=> >=> >=>   >==>       >=>     >=>     >=>     >===>>=>>==>  
>=>  >=>>=> >>   >=>   >=>  >=>   >=>   >=>  >=>  >=>  >>  >=> 
>=>   > >=> >>===>>=> >=>    >=>   >=> >=>   >=>  >=>  >>  >=> 
>=>    >>=> >>         >=>  >=>     >=>=>    >=>  >=>  >>  >=> 
>=>     >=>  >====>      >=>         >=>     >=> >==>  >>  >=>                                                    
			]],
      [[
'##::: ##:'########::'#######::'##::::'##:'####:'##::::'##:
 ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###:
 ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####:
 ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##:
 ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##:
 ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##:
 ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##:
..::::..::........:::.......::::::...:::::....::..:::::..::
			]],
      [[
   _     _      _     _      _     _      _     _      _     _      _     _   
  (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)    (c).-.(c)  
   / ._. \      / ._. \      / ._. \      / ._. \      / ._. \      / ._. \   
 __\( Y )/__  __\( Y )/__  __\( Y )/__  __\( Y )/__  __\( Y )/__  __\( Y )/__ 
(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)(_.-/'-'\-._)
   || N ||      || E ||      || O ||      || V ||      || I ||      || M ||   
 _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._  _.' `-' '._ 
(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)(.-./`-'\.-.)
 `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-'  `-'     `-' 
			]],
      [[
01001110 01100101 01101111 01110110 01101001 01101101 
			]],
      [[
 _|      _|                                  _|                  
 _|_|    _|    _|_|      _|_|    _|      _|      _|_|_|  _|_|    
 _|  _|  _|  _|_|_|_|  _|    _|  _|      _|  _|  _|    _|    _|  
 _|    _|_|  _|        _|    _|    _|  _|    _|  _|    _|    _|  
 _|      _|    _|_|_|    _|_|        _|      _|  _|    _|    _|  
			]],
      [[
		
888b    |                              ,e,               
|Y88b   |  e88~~8e   e88~-_  Y88b    /  "  888-~88e-~88e 
| Y88b  | d888  88b d888   i  Y88b  /  888 888  888  888 
|  Y88b | 8888__888 8888   |   Y88b/   888 888  888  888 
|   Y88b| Y888    , Y888   '    Y8/    888 888  888  888 
|    Y888  "88___/   "88_-~      Y     888 888  888  888 
                                                         

		]],
      [[
     ##### #     ##                                                     
  ######  /#    #### /                             #                    
 /#   /  / ##    ###/                             ###                   
/    /  /  ##    # #                  ##           #                    
    /  /    ##   #                    ##                                
   ## ##    ##   #    /##       /###   ##    ### ###   ### /### /###    
   ## ##     ##  #   / ###     / ###  / ##    ### ###   ##/ ###/ /##  / 
   ## ##     ##  #  /   ###   /   ###/  ##     ### ##    ##  ###/ ###/  
   ## ##      ## # ##    ### ##    ##   ##      ## ##    ##   ##   ##   
   ## ##      ## # ########  ##    ##   ##      ## ##    ##   ##   ##   
   #  ##       ### #######   ##    ##   ##      ## ##    ##   ##   ##   
      /        ### ##        ##    ##   ##      ## ##    ##   ##   ##   
  /##/          ## ####    / ##    ##   ##      /  ##    ##   ##   ##   
 /  #####           ######/   ######     ######/   ### / ###  ###  ###  
/     ##             #####     ####       #####     ##/   ###  ###  ### 
#                                                                       
 ##                                                                     
	]],
      [[
888b    888                            d8b               
8888b   888                            Y8P               
88888b  888                                              
888Y88b 888  .d88b.   .d88b.  888  888 888 88888b.d88b.  
888 Y88b888 d8P  Y8b d88""88b 888  888 888 888 "888 "88b 
888  Y88888 88888888 888  888 Y88  88P 888 888  888  888 
888   Y8888 Y8b.     Y88..88P  Y8bd8P  888 888  888  888 
888    Y888  "Y8888   "Y88P"    Y88P   888 888  888  888 
			]],
      [[
			
_  _ ____ ____ _  _ _ _  _ 
|\ | |___ |  | |  | | |\/| 
| \| |___ |__|  \/  | |  | 
                           

			]],
      [[			
  O/#  \O/  \O/   O/  \O/ \O/ 
 <|     Y   _Y.___|.___Y   Y  
 / \   / \_| |    |    |  / \ 
_| |_./   \, |_   |_   |__| |_
			]],
      [[
78 101 111 118 105 109 
			]],
      [[
                                :                                       
  L.                     ,;    t#,                                       
  EW:        ,ft       f#i    ;##W.              t                       
  E##;       t#E     .E#t    :#L:WE              Ej            ..       :
  E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et
  E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t
  E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t
  E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t
  E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t
  E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t
  E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t
  E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t
  ..         G#E        tt      t     t          E#t ...      #G      .. 
              fE                                 ,;.          j          
               ,                                                         
			]],
      [[
 __  __  ____   ___   __ __ __ ___  ___
 ||\ || ||     // \\  || || || ||\\//||
 ||\\|| ||==  ((   )) \\ // || || \/ ||
 || \|| ||___  \\_//   \V/  || ||    ||
			]],
      [[
 _  _                 
| \| |_  _    ()  _ _ 
| \\ /o\/o\\V7|||/ \ \
|_|\_\( \_/ V L|L_n_n|
			]],
      [[
@@@@@@@@:@@@@@@:@@@@@@@@:@@@::::@@@:@@@:@@@@::::@@@@:
%%%--%%%-%%%----%%%--%%%-%%%----%%%-%%%-%%%%%--%%%%%-
&&&++&&&+&&&&&++&&&++&&&+&&&++++&&&+&&&+&&&&&&&&&&&&+
|||**|||*|||||**|||**|||**|||**|||**|||*|||*||||*|||*
!!!==!!!=!!!====!!!==!!!===!!!!!!===!!!=!!!==!!==!!!=
:::##:::#::::::#::::::::####::::####:::#:::######:::#
...@@...@......@@......@@@@@@..@@@@@...@...@@@@@@...@
			]],
      [[
			
                          <~)_    ;. ,-==.    
                 ||  .-.   ( v~\ ; |  (  (\   
        ....     || _|_ \   \_/' `.|   |\.\\  
^^^^^^^ `=.`''===.' (_)     /\     |  _]_]`\\ 

			]],
      [[
4E 65 6F 76 69 6D 
			]],
      [[
#   # #####  ###  ####  #   # #   # 
#   # #     #   # #   # #  ## ## ## 
##### ####  #   # ####  # # # # # # 
#   # #     #   # #   # ##  # #   # 
#   # #####  ###  ####  #   # #   # 
			]],
      [[
 ,ggg, ,ggggggg,                                                            
dP""Y8,8P"""""Y8b                                                           
Yb, `8dP'     `88                                                           
 `"  88'       88                                    gg                     
     88        88                                    ""                     
     88        88   ,ggg,     ,ggggg,     ggg    gg  gg    ,ggg,,ggg,,ggg,  
     88        88  i8" "8i   dP"  "Y8ggg d8"Yb   88bg88   ,8" "8P" "8P" "8, 
     88        88  I8, ,8I  i8'    ,8I  dP  I8   8I  88   I8   8I   8I   8I 
     88        Y8, `YbadP' ,d8,   ,d8',dP   I8, ,8I_,88,_,dP   8I   8I   Yb,
     88        `Y8888P"Y888P"Y8888P"  8"     "Y8P" 8P""Y88P'   8I   8I   `Y8
			]],
      [[
{___     {__                                               
{_ {__   {__                                {_             
{__ {__  {__   {__       {__    {__     {__   {___ {__ {__ 
{__  {__ {__ {_   {__  {__  {__  {__   {__ {__ {__  {_  {__
{__   {_ {__{_____ {__{__    {__  {__ {__  {__ {__  {_  {__
{__    {_ __{_         {__  {__    {_{__   {__ {__  {_  {__
{__      {__  {____      {__        {__    {__{___  {_  {__
		]],
      [[
116 145 157 166 151 155 
			]],
      [[
@@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@   
@@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@@@@@  
@@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!  
!@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!  
@!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@  
!@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!   ! !@!  
!!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:  
:!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:  
 ::   ::   :: ::::  ::::: ::    ::::     ::  :::     ::   
::    :   : :: ::    : :  :      :      :     :      :    
			]],
      [[
			
     _        _        _        _        _        _    
   _( )__   _( )__   _( )__   _( )__   _( )__   _( )__ 
 _|     _|_|     _|_|     _|_|     _|_|     _|_|     _|
(_ N _ (_(_ E _ (_(_ O _ (_(_ V _ (_(_ I _ (_(_ M _ (_ 
  |_( )__| |_( )__| |_( )__| |_( )__| |_( )__| |_( )__|

			]],
      [[
  ^    ^    ^    ^    ^    ^  
 /N\  /e\  /o\  /v\  /i\  /m\ 
<___><___><___><___><___><___>
			]],
      [[
================================================
=  =======  ====================================
=   ======  ====================================
=    =====  ====================================
=  ==  ===  ===   ====   ===  =  ==  ==  =  = ==
=  ===  ==  ==  =  ==     ==  =  ======        =
=  ====  =  ==     ==  =  ===   ===  ==  =  =  =
=  =====    ==  =====  =  ===   ===  ==  =  =  =
=  ======   ==  =  ==  =  ==== ====  ==  =  =  =
=  =======  ===   ====   ===== ====  ==  =  =  =
================================================
			]],
      [[
ooooo      ooo                                  o8o                    
`888b.     `8'                                  `"'                    
 8 `88b.    8   .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.   
 8   `88b.  8  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b  
 8     `88b.8  888ooo888 888   888   `88..8'    888   888   888   888  
 8       `888  888    .o 888   888    `888'     888   888   888   888  
o8o        `8  `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o 
			]],
      [[
    dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb 
   dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP 
  dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP  
 dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP   
dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP    
			]],
      [[
   \  |                     _)            
    \ |   _ \   _ \ \ \   /  |  __ `__ \  
  |\  |   __/  (   | \ \ /   |  |   |   | 
 _| \_| \___| \___/   \_/   _| _|  _|  _| 
			]],
      [[
 ____ ____ ____ ____ ____ ____ 
||N |||e |||o |||v |||i |||m ||
||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|
			]],
      [[
_____   __                 _____            
___  | / /_____________   ____(_)______ ___ 
__   |/ /_  _ \  __ \_ | / /_  /__  __ `__ \
_  /|  / /  __/ /_/ /_ |/ /_  / _  / / / / /
/_/ |_/  \___/\____/_____/ /_/  /_/ /_/ /_/ 
			]],
      [[
----    ---- ------------   --------   ---    ---  --------    ********   
*****   **** ************  **********  ***    ***  ********   ----------  
------  ---- ----         ----    ---- ---    ---    ----    ************ 
************ ************ ***      *** ***    ***    ****    ---  --  --- 
------------ ------------ ---      --- ---    ---    ----    ***  **  *** 
****  ****** ****         ****    ****  ********     ****    ---  --  --- 
----   ----- ------------  ----------    ------    --------  ***  **  *** 
****    **** ************   ********      ****     ********  ---      --- 
			]],
      [[
 :::= === :::===== :::====  :::  === ::: :::======= 
 :::===== :::      :::  === :::  === ::: ::: === ===
 ======== ======   ===  === ===  === === === === ===
 === ==== ===      ===  ===  ======  === ===     ===
 ===  === ========  ======     ==    === ===     ===
			]],
    }

    math.randomseed(os.time())
    dashboard.section.header.val = ascii[math.random(#ascii)]

    -- Set menu
    dashboard.section.buttons.val = {
      -- { type = "text", val = "Z-Dashboard", opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1 },
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("F", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("t", "⎚  Start Screen", ":intro <CR>"),
      dashboard.button("-", "󰼙  Get Oil", ":Oil --float<CR>"),
      dashboard.button("l", "  Get Lazy", ":Lazy<CR>"),
      dashboard.button("m", "  Get Mason", ":Mason<CR>"),
      dashboard.button("h", "󰞋  Get Help", ":vertical help<CR>"),
      dashboard.button("o", "  Get Options", ":vertical options<CR>"),
      dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
    }
    -- footer
    -- dashboard.section.footer.val = "Footer Z"
    dashboard.section.footer.val = "󰟪'ed by Z-Bruh"
    --
    -- Send config to alpha
    alpha.setup(dashboard.opts)
	vim.keymap.set("n", "<A-a>", ":Alpha<cr>", { desc = "Open Alpha Dashboard" })
  end,
}
