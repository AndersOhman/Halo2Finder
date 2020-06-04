## Halo2 Friend Finder README
```
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
```

Made (in part) as a "fun" exercise to teach myself how to scrape and parse webpages in Julia for an academic project.\
Dedicated to Aaron Crootof.

### Updates
- **March 21st, 2018:** Original Release
- **May 19th, 2020:** It looks like everything about Julia changed since I wrote this! The [Requests](https://github.com/JuliaWeb/Requests.jl) package I used has been depreciated in favor of [HTTP](https://github.com/JuliaWeb/HTTP.jl). In addition, some basic Julia syntax (like `readline(STDIN)`) has changed as well, breaking... everything. It may take some time to retrofit this...
- **May 20th, 2020:** Okay, that wasn't too bad. The old version should still work under [Julia 0.7](https://julialang.org/downloads/oldreleases/#v070_aug_8_2018), but the latest version has been updated to the standards of [Julia 1.0](https://julialang.org/downloads/). I also fixed the Guest bug (needed two escape `\` for a string + regex combo).
- **June 3rd, 2020:** Calculates percentage of games played together, and reports date & time of first and last games. Used `OrderedCollections.jl` to do so.

### Core Concept
To see if, when, and how many times you played [Halo 2](https://en.wikipedia.org/wiki/Halo_2) on [Xbox Live](https://www.xbox.com/en-US/live) with someone else, by searching the legacy Game Viewer for both of your gamertags and exporting a list of games (with links to the viewer pages).

### Instructions
1. Input gamertag 1 *(i.e. yours).*
2. Input gamertag 2 *(i.e. your friends').*
3. The script will load the primary gamertag's Game Viewer page.
      1. It counts the number of pages to search through, and calculates search duration based on the delay.
      2. For each page, it opens every game listed sequentially.
      3. It then searches the game for the secondary gamertag.
      4. If found, it makes a note of the game ID number.
4. It returns a text file of the results, including a count of how many games resulted and links to the viewer pages!

### Dependencies
- [Julia 1.0 or higher](https://julialang.org/)
- Developed and ran using both [macOS X](https://www.apple.com/macos/) 10.13 and [Windows 10](https://www.microsoft.com/en-us/windows/get-windows-10)
- Internet access to connect to [Halo.Bungie.Net](https://halo.bungie.net/Stats/PlayerStatsHalo2.aspx).

Julia Packages:
- [Cascadia.jl](https://github.com/Algocircle/Cascadia.jl)
- [Gumbo.jl](https://github.com/JuliaWeb/Gumbo.jl)
- [OrderedCollections.jl](https://github.com/JuliaCollections/OrderedCollections.jl)

### Known Bugs
- The `sleepTime` variable exists because the [Halo.Bungie.Net](https://halo.bungie.net/Stats/PlayerStatsHalo2.aspx) website will occasionally time out requests that are too rapid in succession. While the `0.5` setting (a half-second delay) was sufficient to resolve this for me, you may need to increase this value if you are seeing this issue frequently.

### TODO
Next steps:
- [X] ~~Update to Julia 1.0 syntax changes~~
- [X] ~~Fix Guest searching~~
- [X] ~~Tiny ASCII boot logo~~
- [X] ~~Parse timestamp of each game~~
- [X] ~~Get date info for each game~~
- [ ] Add a "verbose" toggle for the `.` and `*` display
- [X] ~~Report additional game stats (i.e. % of games, first/last game,~~ win:loss)

Time estimate things:
- [ ] Grab the current time and give finish time estimate `(133)`
- [ ] Implement a loading bar `(121)`
- [ ] Report actual time elapsed `(199)`

### Contact
Anders Ohman\
mjolnirman@gmail.com
