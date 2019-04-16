#==============================================================================
............................/%&@@@@@@@@@@@@@@@@&%\,............................
....................../&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%,......................
.................#@@@@@@@@@@@@&%#(***********)@@@@@@@@@@@@@@@*.................
.............,&@@@@@@@&*.........................&@@@@@@@@@@@@@&...............
...........&@@@@@&.............._/$%##%###*\..........%@@@@@@@@@@@/............
.........&@@@@&.............,/%&#/.......\#%##\...........(@@@@@@@@@@\.........
........@@@@&............./%#&/............|&%##\.............(@@@@@@@@@#......
...&@@@@@@@(............................../%##%&|...............*@@@@@@@@@,....
....(@@@@@#............................../###&/..................@@@@@@@@@@&...
................................__/#&##%#%*/......................@@@@@@@@@@%..
............................../%*#%#%/............................&@@@@@@@@@...
.........................../(###%*%(............./#.............*@@@@@@@@@@*...
........................./%####%$$###%%#####%&&%#&.........&@@@@@@@@@@@........
.......................................................#@@@@@@@@@@@@@..........
...............$$$*@@@@@&/......................(&@@@@@@@@@@@@@@@@%............
..................,&@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@.................
........................*#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/......................
..................................,@@@@@@@@@@@/................................

%&&%                        /\           %#%%/                 /%%%%%%%%%(
 %%%        *%%(          %#%%(           /%%%            *%/           ,%%%
 %%% .......,%%%         ///(%%#,         #%%%           %%.     #&%      %%%.
 /%%%       %%##      %#%%     %#(/       %%##                            ##%
 %##(       #(((    ((((        *(#%*+    %/((((/%((#%(      %***++++*(#%(*

===============================================================================
#
# Program:                  The Halo2 Online Friend Finder
# Purpose:                  To see if/when you played Halo2 on XBL with someone
# Description:                  Dedicated to Aaron Crootof
# Created by: 				Anders Ohman (mjolnirman@gmail.com)
# Created on: 				2018-03-21
#
==============================================================================#

# Libraries (The Library)
using Requests
using Cascadia
using Gumbo
# Ask user for their GT and friend GT ()
println("**********************************************************")
# NOTE: Pop in some tiny ASCII here
println("Welcome to the Halo2 Friend Finder!")
println("This will look through Bungie.net for old Halo2 game records.")
print("> Please enter Gamertag 1: ") #D33pTh0ugh7
gamertag1 = "Defection"
print("> Please enter Gamertag 2: ") #Defection
gamertag2 = "Defection(G)"
println("I'll look if $gamertag1 and $gamertag2 played Halo 2 online together.")
println("**********************************************************")
#output_file = open("HaloFinderOutput_$gamertag1+$gamertag2.txt", "w")

matchSet = Set()
lastgame = 0

    url = "https://halo.bungie.net/Stats/GameStatsHalo2.aspx?gameid=751897513&player=Defection"
    r = get(url)
    h = convert(String, r.data)
    for result_line in split(h, "\n")
        gtmatch = match(r"Defection(G)", result_line)
        if gtmatch != nothing #NOTE: Could theoretically get date info too......
            if game != lastgame
                push!(matchSet, game)
#                write(output_file, "Match #$(length(matchSet)): $game\n$url\n\n")
                println("\nMatch #$(length(matchSet)): $game\n$url")
                lastgame = game
                print("*")
            end
        end
    end
    print(".")

close(output_file)
print("\n")
println("**********************************************************")
println("Finished scanning games.")
println("**********************************************************")
