local options

-- For random header
math.randomseed(os.time())
-- Create button for initial keybind.
--- @param sc string
--- @param txt string
--- @param hl string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, hl, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 5,
    width = 33,
    align_shortcut = "right",
    hl_shortcut = hl,
  }

  if keybind then
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "normal", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

-- All custom headers
Headers = {
  {
    [[      ⣿⣿⣿⡟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⣿⣿⣿⣿                ]],
    [[      ⣿⣿⣿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢿⣿⣿                ]],
    [[      ⣿⣿⡇⠄⠄⠄⠄⠄⠄⢀⣀⣀⣤⣶⣦⣤⣤⣤⣤⣄⣄⠄⠸⣿⣿                ]],
    [[      ⣿⣿⠁⠄⠄⢀⣠⣾⣿⣿⣥⣤⣶⣶⡖⢻⣿⣿⡥⣤⣤⣉⣦⢹⣿   NEOVIM       ]],
    [[      ⣿⣿⡆⠄⠄⣿⣿⣿⣿⣿⣿⢽⠉⠙⣻⣿⣿⣿⣶⢟⠛⢻⡇⢸⣿   IS           ]],
    [[      ⣿⣿⣿⠄⠄⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣷⣾⣿⡈⣿   A            ]],
    [[      ⣿⣿⣿⣷⣸⣿⣿⠸⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣄⠙⣿⣿⣿⠇⣿   blessing     ]],
    [[      ⠉⠉⠉⠉⠁⣿⣿⣆⠹⣿⣿⣿⣿⣿⣄⣹⣏⣿⡋⣸⣿⣿⠟⣰⣿                ]],
    [[      ⠄⠄⠄⠄⠄⣿⣿⣿⣷⣌⠛⢿⣿⣏⣉⠛⠛⠛⠛⢻⣿⡇⣾⣿⣿                ]],
    [[      ⠄⠄⠄⠄⢸⣿⣿⣯⣿⣿⣷⣄⠙⢿⣿⣿⣿⣷⣦⡀⠙⡴⢟⣿⣿                ]],
    [[      ⠄⠄⠄⢠⣿⣿⣟⣯⣿⣿⣿⣿⣿⣶⣤⣉⣉⠉⠉⠰⣷⣼⣿⣿⣿                ]],
    [[                                               ]],
  },
  {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
  },

  {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  },
  {
    [[116 145 157 166 151 155]],
  },
  {
    [[78 101 111 118 105 109]],
  },
  {
    [[01001110 01100101 01101111 01110110 01101001 01101101]],
  },
  {
    [[ 4E 65 6F 76 69 6D ]],
  },
  {
    [[)]],
    [[ ( /(]],
    [[ )\())   (        )   (      )]],
    [[((_)\   ))\  (   /((  )\    (]],
    [[ _((_) /((_) )\ (_))\((_)   )\  ']],
    [[| \| |(_))  ((_)_)((_)(_) _((_))]],
    [[| .` |/ -_)/ _ \\ V / | || '  \()]],
    [[|_|\_|\___|\___/ \_/  |_||_|_|_|]],
    [[	]],
  },
  {
    [[ @@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@]],
    [[ @@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@@@@@]],
    [[ @@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!]],
    [[ !@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!]],
    [[ @!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@]],
    [[ !@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!   ! !@!]],
    [[ !!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:]],
    [[ :!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:]],
    [[  ::   ::   :: ::::  ::::: ::    ::::     ::  :::     ::]],
    [[ ::    :   : :: ::    : :  :      :      :     :      :]],
  },
  {
    [[    <-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')]],
    [[       \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_]],
    [[    ,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)]],
    [[    |   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |]],
    [[    |  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |]],
    [[    |  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |]],
    [[    |  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |]],
    [[    `--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--']],
    [[    -. . --- ...- .. --]],
  },
  {
    [[_   _   U _____ u U  ___ u__     __             __  __]],
    [[     | \ |"|  \| ___"|/  \/"_ \/\ \   /"/u  ___     U|' \/ '|u]],
    [[    <|  \| |>  |  _|"    | | | | \ \ / //  |_"_|    \| |\/| |/]],
    [[    U| |\  |u  | |___.-,_| |_| | /\ V /_,-. | |      | |  | |]],
    [[     |_| \_|   |_____|\_)-\___/ U  \_/-(_/U/| |\u    |_|  |_|]],
    [[     ||   \\,-.<<   >>     \\     //   .-,_|___|_,-.<<,-,,-.]],
    [[     (_")  (_/(__) (__)   (__)   (__)   \_)-' '-(_/  (./  \.)]],
  },
  {
    [[     .-') _   ('-.                     (`-.           _   .-')]],
    [[    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_]],
    [[,--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \ ,-.-') ,--.   ,--.)]],
    [[|   \ |  |\ |  .---'( OO'  .-.  '\   \   /(__/ |  |OO)|   `.'   |]],
    [[|    \|  | )|  |    /   |  | |  | \   \ /   /  |  |  \|         |]],
    [[|  .     |/(|  '--. \_) |  |\|  |  \   '   /,  |  |(_/|  |'.'|  |]],
    [[|  |\    |  |  .--'   \ |  | |  |   \     /__),|  |_.'|  |   |  |]],
    [[|  | \   |  |  `---.   `'  '-'  '    \   /   (_|  |   |  |   |  |]],
    [[`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--']],
  },
  {
    [[ ░   ░░░  ░        ░░      ░░  ░░░░  ░        ░  ░░░░  ░]],
    [[ ▒    ▒▒  ▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒   ▒▒   ▒]],
    [[ ▓  ▓  ▓  ▓      ▓▓▓  ▓▓▓▓  ▓▓  ▓▓  ▓▓▓▓▓  ▓▓▓▓        ▓]],
    [[ █  ██    █  ███████  ████  ███    ██████  ████  █  █  █]],
    [[ █  ███   █        ██      █████  ████        █  ████  █]],
  },
  {
    [[    _   __                _]],
    [[   / | / /__  ____ _   __(_)___ ___]],
    [[  /  |/ / _ \/ __ \ | / / / __ `__ \]],
    [[ / /|  /  __/ /_/ / |/ / / / / / / /]],
    [[/_/ |_/\___/\____/|___/_/_/ /_/ /_/]],
  },
  {
    [[  _  _                              _]],
    [[ | \| |    ___     ___    __ __    (_)    _ __]],
    [[ | .` |   / -_)   / _ \   \ V /    | |   | '  \]],
    [[ |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_|]],
    [[_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|]],
    [["`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-']],
  },
  {
    [[     .-. .-.,---.   .---..-.   .-.,-.]],
    [[ |  \| || .-'  / .-. )\ \ / / |(||\    /|]],
    [[ |   | || `-.  | | |(_)\ V /  (_)|(\  / |]],
    [[ | |\  || .-'  | | | |  ) /   | |(_)\/  |]],
    [[ | | |)||  `--.\ `-' / (_)    | || \  / |]],
    [[ /(  (_)/( __.' )---'         `-'| |\/| |]],
    [[(__)   (__)    (_)               '-'  '-']],
  },
  {
    [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
    [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
    [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
    [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██]],
    [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
    [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
    [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
    [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░]],
    [[          ░    ░  ░    ░ ░        ░   ░         ░]],
    [[                                 ░]],
  },
  {
    [[     ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.]],
    [[•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪]],
    [[▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·]],
    [[██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌]],
    [[▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀]],
  },
  {
    [[  _  _]],
    [[ | \| |_  _    ()  _ _]],
    [[ | \\ /o\/o\\V7|||/ \ \]],
    [[ |_|\_\( \_/ V L|L_n_n|]],
  },
  {
    [[                              <~)_    ;. ,-==.]],
    [[                 ||  .-.   ( v~\ ; |  (  (\]],
    [[        ....     || _|_ \   \_/' `.|   |\.\\]],
    [[^^^^^^^ `=.`''===.' (_)     /\     |  _]_]`\\]],
  },
  {
    [[_____   __                 _____]],
    [[___  | / /_____________   ____(_)______ ___]],
    [[__   |/ /_  _ \  __ \_ | / /_  /__  __ `__ \]],
    [[_  /|  / /  __/ /_/ /_ |/ /_  / _  / / / / /]],
    [[/_/ |_/  \___/\____/_____/ /_/  /_/ /_/ /_/]],
  },
  {
    [[ ____ ____ ____ ____ ____ ____]],
    [[||N |||e |||o |||v |||i |||m ||]],
    [[||__|||__|||__|||__|||__|||__||]],
    [[|/__\|/__\|/__\|/__\|/__\|/__\|]],
  },
  {
    [[   \  |                     _)]],
    [[    \ |   _ \   _ \ \ \   /  |  __ `__ \]],
    [[  |\  |   __/  (   | \ \ /   |  |   |   |]],
    [[ _| \_| \___| \___/   \_/   _| _|  _|  _|]],
  },
  {
    [[ :::= === :::===== :::====  :::  === ::: :::=======]],
    [[ :::===== :::      :::  === :::  === ::: ::: === ===]],
    [[ ======== ======   ===  === ===  === === === === ===]],
    [[ === ==== ===      ===  ===  ======  === ===     ===]],
    [[ ===  === ========  ======     ==    === ===     ===]],
  },
  {
    [[#   # #####  ###  ####  #   # #   #]],
    [[#   # #     #   # #   # #  ## ## ##]],
    [[##### ####  #   # ####  # # # # # #]],
    [[#   # #     #   # #   # ##  # #   #]],
    [[#   # #####  ###  ####  #   # #   #]],
  },
  {
    [[{___     {__]],
    [[{_ {__   {__                                {_]],
    [[{__ {__  {__   {__       {__    {__     {__   {___ {__ {__]],
    [[{__  {__ {__ {_   {__  {__  {__  {__   {__ {__ {__  {_  {__]],
    [[{__   {_ {__{_____ {__{__    {__  {__ {__  {__ {__  {_  {__]],
    [[{__    {_ __{_         {__  {__    {_{__   {__ {__  {_  {__]],
    [[{__      {__  {____      {__        {__    {__{___  {_  {__]],
  },
  {
    [[ __  __  ____   ___   __ __ __ ___  ___]],
    [[ ||\ || ||     // \\  || || || ||\\//||]],
    [[ ||\\|| ||==  ((   )) \\ // || || \/ ||]],
    [[ || \|| ||___  \\_//   \V/  || ||    ||]],
  },
  {
    [[_  _ ____ ____ _  _ _ _  _]],
    [[|\ | |___ |  | |  | | |\/|]],
    [[| \| |___ |__|  \/  | |  |]],
  },
  {
    [[::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::]],
    [[:+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+]],
    [[:+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+]],
    [[+#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+]],
    [[+#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+]],
    [[#+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#]],
    [[###    #### ########## ########      ###     ########### ###       ###]],
  },
  {
    [[ _|      _|                                  _|]],
    [[ _|_|    _|    _|_|      _|_|    _|      _|      _|_|_|  _|_|]],
    [[ _|  _|  _|  _|_|_|_|  _|    _|  _|      _|  _|  _|    _|    _|]],
    [[ _|    _|_|  _|        _|    _|    _|  _|    _|  _|    _|    _|]],
    [[ _|      _|    _|_|_|    _|_|        _|      _|  _|    _|    _|]],
  },
  {
    [[8b    |                              ,e,]],
    [[|y88b   |  e88~~8e   e88~-_  y88b    /  "  888-~88e-~88e]],
    [[| y88b  | d888  88b d888   i  y88b  /  888 888  888  888]],
    [[|  y88b | 8888__888 8888   |   y88b/   888 888  888  888]],
    [[|   y88b| y888    , y888   '    y8/    888 888  888  888]],
    [[|    y888  "88___/   "88_-~      y     888 888  888  888]],
  },
  {
    [[@@@@@@@@:@@@@@@:@@@@@@@@:@@@::::@@@:@@@:@@@@::::@@@@:]],
    [[%%%--%%%-%%%----%%%--%%%-%%%----%%%-%%%-%%%%%--%%%%%-]],
    [[&&&++&&&+&&&&&++&&&++&&&+&&&++++&&&+&&&+&&&&&&&&&&&&+]],
    [[|||**|||*|||||**|||**|||**|||**|||**|||*|||*||||*|||*]],
    [[!!!==!!!=!!!====!!!==!!!===!!!!!!===!!!=!!!==!!==!!!=]],
    [[:::##:::#::::::#::::::::####::::####:::#:::######:::#]],
    [[...@@...@......@@......@@@@@@..@@@@@...@...@@@@@@...@]],
  },
  {
    [[    dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb]],
    [[   dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP]],
    [[  dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP]],
    [[ dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP]],
    [[dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP]],
  },
  {
    [[888b    888                            d8b]],
    [[8888b   888                            Y8P]],
    [[88888b  888]],
    [[888Y88b 888  .d88b.   .d88b.  888  888 888 88888b.d88b.]],
    [[888 Y88b888 d8P  Y8b d88""88b 888  888 888 888 "888 "88b]],
    [[888  Y88888 88888888 888  888 Y88  88P 888 888  888  888]],
    [[888   Y8888 Y8b.     Y88..88P  Y8bd8P  888 888  888  888]],
    [[888    Y888  "Y8888   "Y88P"    Y88P   888 888  888  888]],
  },
  {
    [['##::: ##:'########::'#######::'##::::'##:'####:'##::::'##:]],
    [[ ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###:]],
    [[ ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####:]],
    [[ ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##:]],
    [[ ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##:]],
    [[ ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##:]],
    [[ ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##:]],
    [[..::::..::........:::.......::::::...:::::....::..:::::..::]],
  },
}

---@diagnostic disable: missing-parameter
local buttons = {
  type = "group",
  val = {
    button("n", "  New file", "Macro", ":ene <BAR> startinsert <CR>"),
    button("f", "  Find file", "Macro", ":Telescope find_files <CR>"),
    button("F", "  Find text", "Macro", ":Telescope live_grep <CR>"),
    button("a", "🎛 Get AI", "Macro", ":AvanteChat<CR>"),
    button("-", "󰼙  Get Oil", "Macro", ":Oil --float<CR>"),
    button("r", "󱣱  Get Ranger", "Macro", ":Ranger<CR>"),
    button("l", "  Get Lazy", "Macro", ":Lazy<CR>"),
    button("m", "  Get Mason", "Macro", ":Mason<CR>"),
    button("h", "󰞋  Get Help", "Macro", ":vertical help<CR>"),
    button("o", "  Get Options", "Macro", ":vertical options<CR>"),
    button("q", "󰩈  Quit", "Macro", ":qa<CR>"),
  },
  opts = {
    spacing = 1,
  },
}
---@diagnostic enable: missing-parameter

local header = {
  type = "text",
  val = Headers[math.random(#Headers)],
  -- val = Headers[3],
  opts = {
    position = "center",
    hl = "Character",
  },
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = {
      enabled = true,
      ---@type snacks.animate.Duration|number
      duration = 20, -- ms per step
      easing = "linear",
      fps = 60, -- frames per second. Global setting for all animations
    },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- git
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    -- Other
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
