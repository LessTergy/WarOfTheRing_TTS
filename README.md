# Tabletop Simulator Mod for War of the Ring: Second Edition

This project is a community-contributed open source mod for
[Tabletop Simulator][1], emulating some features and game play of
[War of the Ring][2].
It is periodically updated to the [Steam Workshop][3].

[1]: https://store.steampowered.com/app/286160/Tabletop_Simulator/
[2]: https://boardgamegeek.com/boardgame/115746/war-of-the-ring-second-edition
[3]: https://steamcommunity.com/sharedfiles/filedetails/?id=3174790136


## Contributing

As a community run project, artwork, scripting, table design and more is a 100%
volunteer project, and we could use your support! You will need the following
tools to make _most_ (but not all) contributions to the mod:

1. A Git or GitHub client to make copies of this repository.
2. [NodeJS](https://nodejs.org/)
3. [Tabletop Simulator][1]

You'll notice we do _not_ store the "save file" (JSON) in this repository, as
historically that made concurrent edits and collaboration much more difficult:
instead we have a series of scripts that "compile" it on demand from individual
scripts and objects.

> _WARNING_: Currently only Windows-based development is fully supported.

Once you've cloned the repository, you can build the mod:

```sh
# Install all NodeJS required dependencies.
npm install

# Creates a symbolic link to your TTS save folder, and compiles the mod.
npm start
```

For subsequent updates, you can just use compile on-demand:

```sh
# Files in "mod/**" are combined and output in "dist/" (linked to your saves).
npm run compile

# Optional, instruct TTS to reload automatically.
npm run compile -- --reload
```

If you make any edits to the save file directly, you will need to reflect
(extract) the changes into the `mod/**` folder:

```sh
# This is a rarer workflow, but still supported.
npm run extract
```
