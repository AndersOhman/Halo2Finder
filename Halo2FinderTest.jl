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
# Updated on:               2020-05-19
#
==============================================================================#

# Libraries (The Library)
using Cascadia
using Gumbo
# Ask user for their GT and friend GT ()
println("**********************************************************")
# NOTE: Pop in some tiny ASCII here
println("Welcome to the Halo2 Friend Finder!")
println("This will look through Bungie.net for old Halo2 game records.")
print("> Please enter Gamertag 1: ") #D33pTh0ugh7
gamertag1 = readline()
print("> Please enter Gamertag 2 (or \"(G)\" for Guest): ") #Defection
gamertag2 = readline()

file = "HaloFinderOutput_$gamertag1+$gamertag2.txt"
output_file = open(file, "w")
write(output_file,"Game history of $gamertag1 and $gamertag2:\n\n")
if gamertag2 == "(G)"
    gamertag2 = string(gamertag1, "\\(G\\)")
    println("I'll look if $gamertag1 and a guest played Halo 2 online together.")
else
    println("I'll look if $gamertag1 and $gamertag2 played Halo 2 online together.")
end
println("**********************************************************")
url = "https://halo.bungie.net/Stats/PlayerStatsHalo2.aspx?player=$gamertag1"
# Read string "xxxx items in yyy pages"
h = parsehtml(read(download(url), String))
s = Selector("strong")
qs = eachmatch(s,h.root)
items = parse(Int64, nodeText(qs[1]))
pages = parse(Int64, nodeText(qs[2]))
#println("$gamertag1 played $items games on $pages pages.")
#println("**********************************************************")
println("Going through $pages pages to check $items games.")
# Open each page to grab game IDs
page = 1
gameIDset = Set()
while page <= pages
    global page
    #println("Searching page $page...")
    url = "https://halo.bungie.net/Stats/PlayerStatsHalo2.aspx?player=$gamertag1&ctl00_mainContent_bnetpgl_recentgamesChangePage=$page"
    # Get each game ID from page, push to a Set
    h = read(download(url), String)
    for result_line in split(h, "\n")
        gameid = match(r"gameid=(\d+)&", result_line)
        if gameid != nothing
            push!(gameIDset, gameid[1])
            #NOTE: Grab timestamp?
        end
    end
    print(".") #NOTE: Try a loading bar implementation instead? https://github.com/timholy/ProgressMeter.jl
    page += 1
end
print("\n")
#println("Collected $(length(gameIDset)) game IDs.")
#println("**********************************************************")
sleepTime = 0.5
println("Searching $(length(gameIDset)) game pages with a $sleepTime-second delay.")
totalSecs = sleepTime * length(gameIDset)
totalMins = trunc(Int, totalSecs/60)
totalHrs = round((totalMins/60);digits=2)
println("This will take at least $totalSecs sec / $totalMins min / $totalHrs hrs.")
#NOTE: Timenow and time to finish
# Search each game for friend's name
matchSet = Set()
lastgame = 0
for game in sort(collect(gameIDset))
    url = "https://halo.bungie.net/Stats/GameStatsHalo2.aspx?gameid=$game"
    sleep(sleepTime)
    h = read(download(url), String)
    for result_line in split(h, "\n")
        global matchSet
        global lastgame
        gtmatch = match(Regex(gamertag2), result_line)
        if gtmatch != nothing
            if game != lastgame
                push!(matchSet, game)
                write(output_file, "Match #$(length(matchSet)): $game\n$url\n\n")
                #println("\nMatch #$(length(matchSet)): $game\n$url")
                lastgame = game
                print("*")


                #NOTE: Could theoretically get date info too......
                #datematch = match(r("\d+\/{1}\d+\/\d+"),result_line)
                #timematch = match(r("\d+:{1}\d+ [A-Z]{2}"),result_line)
            end
        end
    end
    print(".")
end
close(output_file)
print("\n")
println("**********************************************************")
println("Finished scanning games.")
#NOTE: Pop in actual time elapsed calculation
# Report result summary
if length(matchSet) > 0
    println("$(length(matchSet)) matches found! Please check output file for a copy.\n")
    #NOTE: Print out stats like % games, first game, etc.
    data_file = open(file,"r")
    for line in eachline(data_file)
        println("$line")
    end
    close(data_file)
else
    println("Sorry, no matches were found.")
end
println("Goodbye!")
println("**********************************************************")
