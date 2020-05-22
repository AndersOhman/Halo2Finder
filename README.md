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
- [Cascadia](https://github.com/Algocircle/Cascadia.jl)
- [Gumbo](https://github.com/JuliaWeb/Gumbo.jl)

### Known Bugs
- The `sleepTime` variable exists because the [Halo.Bungie.Net](https://halo.bungie.net/Stats/PlayerStatsHalo2.aspx) website will occasionally time out requests that are too rapid in succession. While the `0.5` setting (a half-second delay) was sufficient to resolve this for me, you may need to increase this value if you are seeing this issue frequently.

### TODO
Next steps:
- [X] Update to Julia 1.0 syntax changes
- [X] Fix Guest searching
- [ ] Tiny ASCII boot logo `(43)`
- [ ] Parse timestamp of each game `(82)`
- [ ] Get date info for each game `(109)`
- [ ] Add a "verbose" toggle for the `.` and `*` display
- [ ] Report additional game stats (i.e. % of games, first game, win/loss) `(129)`\

Time estimate things:
- [ ] Grab the current time and give finish time estimate `(97)`
- [ ] Implement a loading bar `(85)`
- [ ] Report actual time elapsed `(125)`

### Contact
Anders Ohman\
mjolnirman@gmail.com
