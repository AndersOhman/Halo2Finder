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

Made (in part) as a "fun" exercise to teach myself how to scrape and parse webpages in Julia.\
Dedicated to Aaron Crootof.

### Core Concept
To see if, when, and how many times you played Halo 2 on Xbox Live with someone else by searching the legacy Game Viewer for both of your gamertags and exporting a list of games (with links to the viewer pages).\

### Instructions
1. Input gamertag 1 (i.e. yours).
2. Input gamertag 2 (i.e. your friends').
3. The script will load the primary gamertag's Game Viewer page.
      1. It counts the number of pages to search through, and calculates search duration based on the delay.
      2. For each page, it opens every game listed sequentially.
      3. It then searches the game for the secondary gamertag.
      4. If found, it makes a note of the game ID number.
4. It returns a text file of the results, including a count of how many games resulted and links to the viewer pages!

### Dependencies
- Julia
- Developed and ran using both OS X 10.13 and Windows 10
- Internet access to connect to [Halo.Bungie.Net](https://halo.bungie.net/Stats/PlayerStatsHalo2.aspx).

Julia Packages:
- [Requests](https://github.com/JuliaWeb/Requests.jl)
- [Cascadia](https://github.com/Algocircle/Cascadia.jl)
- [Gumbo](https://github.com/JuliaWeb/Gumbo.jl)

### Known Bugs
- When searching for a guest account, the concatenation of `gamertag1` and `(G)` does not appear to be working correctly. However, manually setting the string to `Gamertag(G)` seems to work. I'm sure this is a basic string handling syntax deficiency on my part.
- The `sleepTime` variable exists because the Halo.Bungie.Net website will occasionally time out requests that are too rapid in succession. While the `0.5` setting (a half-second delay) was sufficient to resolve this for me, you may need to increase this value if you are seeing this issue frequently.

### TODO
Next steps:
- Fix Guest searching

### Contact
Anders Ohman\
Doctoral Student, Brown University\
Pathobiology PhD Program\
anders_ohman@brown.edu
