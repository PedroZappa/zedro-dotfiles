set auto-load safe-path /

# __________________gdb options_________________

# # set to 1 to have ARM target debugging as default, use the "arm" command to switch inside gdb
# set $ARM = 0
# # set to 0 if you have problems with the colorized prompt - reported by Plouj with Ubuntu gdb 7.2
# set $COLOREDPROMPT = 1
# # color the first line of the disassembly - default is green, if you want to change it search for
# # SETCOLOR1STLINE and modify it :-)
# set $SETCOLOR1STLINE = 1
# # set to 0 to remove disassembly display (useful for scripted commands mass dumping)
# set $SHOWDISASM = 1
# # set to 0 to remove display of objectivec messages (default is 1)
# set $SHOWOBJECTIVEC = 1
# # set to 0 to remove display of cpu registers (default is 1)
# set $SHOWCPUREGISTERS = 1
# # set to 1 to enable display of stack (default is 0)
# set $SHOWSTACK = 1
# # set to 1 to enable display of data window (default is 0)
# set $SHOWDATAWIN = 0
# # set to 0 to disable colored display of changed registers
# set $SHOWREGCHANGES = 1
# # set to 1 so skip command to execute the instruction at the new location
# # by default it EIP/RIP will be modified and update the new context but not execute the instruction
# set $SKIPEXECUTE = 0
# # if $SKIPEXECUTE is 1 configure the type of execution
# # 1 = use stepo (do not get into calls), 0 = use stepi (step into calls)
# set $SKIPSTEP = 1
# # show the ARM opcodes - change to 0 if you don't want such thing (in x/i command)
# set $ARMOPCODES = 0
# # x86 disassembly flavor: 0 for Intel, 1 for AT&T
# set $X86FLAVOR = 0
# # use colorized output or not
# set $USECOLOR = 1
# # to use with remote KDP
# set $KDP64BITS = 1
# set $64BITS = 1

# macOS version works better with this setting off
# set startup-with-shell off

set confirm off
set verbose off
set history filename ~/.gdb_history
set history save

# set output-radix 0x10
# set input-radix 0x10

# These make gdb never pause in its output
set height 0
set width 0

set $SHOW_CONTEXT = 1
set $SHOW_NEST_INSN = 0

set $CONTEXTSIZE_STACK = 6
set $CONTEXTSIZE_DATA  = 8
set $CONTEXTSIZE_CODE  = 8

# Set 
# set style enabled
# set style sources on

# __________________end gdb options_________________
#

# __________________color functions_________________
#
# color codes
set $BLACK = 0
set $RED = 1
set $GREEN = 2
set $YELLOW = 3
set $BLUE = 4
set $MAGENTA = 5
set $CYAN = 6
set $WHITE = 7

# CHANGME: If you want to modify the "theme" change the colors here
#          or just create a ~/.gdbinit.local and set these variables there
set $COLOR_REGNAME = $GREEN
set $COLOR_REGVAL = $BLACK
set $COLOR_REGVAL_MODIFIED  = $RED
set $COLOR_SEPARATOR = $BLUE
set $COLOR_CPUFLAGS = $RED

# this is ugly but there's no else if available :-(
define color
 if $USECOLOR == 1
 	# BLACK
 	if $arg0 == 0
 		echo \033[30m
 	else
 		# RED
	 	if $arg0 == 1
	 		echo \[\e[0;31m\]
	 	else
	 		# GREEN
	 		if $arg0 == 2
	 			echo \033[32m
	 		else
	 			# YELLOW
	 			if $arg0 == 3
	 				echo \033[33m
	 			else
	 				# BLUE
	 				if $arg0 == 4
	 					echo \033[34m
	 				else
	 					# MAGENTA
	 					if $arg0 == 5
	 						echo \033[35m
	 					else
	 						# CYAN
	 						if $arg0 == 6
	 							echo \033[36m
	 						else
	 							# WHITE
	 							if $arg0 == 7
	 								echo \033[37m
	 							end
	 						end
	 					end
	 				end
	 			end
	 		end
	 	end
	 end
 end
end

define color_reset
    if $USECOLOR == 1
	   echo \033[0m
    end
end

define color_bold
    if $USECOLOR == 1
	   #echo \033[1m
       echo \[\e[1m\]
    end
end

define color_underline
    if $USECOLOR == 1
	   echo \033[4m
    end
end

# this way anyone can have their custom prompt - argp's idea :-)
# can also be used to redefine anything else in particular the colors aka theming
# just remap the color variables defined above
# source ~/.gdbinit.local

# can't use the color functions because we are using the set command
if $COLOREDPROMPT == 1
	set extended-prompt \[\e[0;31m\]gdb$ \[\e[0m\]
end

# Initialize these variables else comparisons will fail for coloring
# we must initialize all of them at once, 32 and 64 bits, and ARM.
set $oldrax = 0
set $oldrbx = 0
set $oldrcx = 0
set $oldrdx = 0
set $oldrsi = 0
set $oldrdi = 0
set $oldrbp = 0
set $oldrsp = 0
set $oldr8  = 0
set $oldr9  = 0
set $oldr10 = 0
set $oldr11 = 0
set $oldr12 = 0
set $oldr13 = 0
set $oldr14 = 0
set $oldr15 = 0
set $oldeax = 0
set $oldebx = 0
set $oldecx = 0
set $oldedx = 0
set $oldesi = 0
set $oldedi = 0
set $oldebp = 0
set $oldesp = 0
set $oldr0  = 0
set $oldr1  = 0
set $oldr2  = 0
set $oldr3  = 0
set $oldr4  = 0
set $oldr5  = 0
set $oldr6  = 0
set $oldr7  = 0
set $oldsp  = 0
set $oldlr  = 0

# used by ptraceme/rptraceme
set $ptrace_bpnum = 0
