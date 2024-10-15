{ config, pkgs, lib, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.games.saves.directory}/${path}"; in
  let compatData = ".local/share/Steam/steamapps/compatdata/"; in
  let steamPath = appId: subpath: "${compatData}${toString appId}/pfx/drive_c/users/steamuser/${subpath}";
in
{
    options = {
      games.saves.enable = lib.mkEnableOption "enable custom save manager";
      games.saves.directory = lib.mkOption {
        type = with lib.types; str;
        default = "${config.home.homeDirectory}/.saves";
      };
    };

  config = {
      #steamLink 1623730 "AppData/Local/Pal/Saved" "palworld"
    home.file = lib.mkIf config.games.saves.enable {
      # Proton Games
      



      # Native Games
      ".local/share/NeposGames/Nebuchadnezzar".source = link "${config.home.homeDirectory}/.saves/nebuchadnezzar";
      ".local/share/Paradox Interactive/Crusader Kings III/".source = link "${config.home.homeDirectory}/.saves/crusader-kings3";
      ".local/share/Pokemon Rejuvenation".source = link "${config.home.homeDirectory}/.saves/pokemon-rejuvenation";
      ".local/share/Colossal Order/Cities_Skylines".source = link "${config.home.homeDirectory}/.saves/cities-skylines";
      ".local/share/Colossal Order/Monster Sanctuary".source = link "${config.home.homeDirectory}/.saves/monster-sanctuary";
     
      "${steamPath 560130 "Saved Games/Pillars of Eternity II"}".source = link "pillars-of-eternity2";
      "${steamPath 40390  "Saved Games/Risen2/SaveGames"}".source = link "risen2";
      "${steamPath 466240 "Saved Games/deceit"}".source = link "deceit";
      "${steamPath 24810  "Saved Games/Command & Conquer 3 Kane's Wrath"}".source = link "cnc3-kanes-wrath";
      "${steamPath 24790  "Command & Conquer 3 Tiberium Wars"}".source = link "cnc3-tiberium-wars";
      "${steamPath 858820 "AppData/Local/TOM/Saved"}".source = link "tribes-of-midgard";
      "${steamPath 1623730 "AppData/Local/Pal/Saved"}".source = link "palworld";
      "${steamPath 690830  "Documents/Polymorph Games/Foundation"}".source = link "foundation";
      "${steamPath 1218210 "AppData/Roaming/TRAGsoft/Coromon"}".source = link "coromon";
      "${steamPath 1222670 "Documents/Electronic Arts/The Sims 4"}".source = link "the-sims4";
      "${steamPath 1549250  "AppData/Local/RzGame"}".source = link "undecember";
      "${steamPath 1822550  "AppData/Roaming/MicroCivilization"}".source = link "microcivilization";
      "${steamPath 345180   "AppData/Roaming/Victor Vran"}".source = link "victor-vran";
      "${steamPath 1340180  "AppData/Local/SherwoodExtreme/Saved"}".source = link "sherwood-extreme";
      "${steamPath 1217060  "AppData/LocalLow/duoyi/Gunfire Reborn"}".source = link "gunfire-reborn";
      "${steamPath 899770   "AppData/LocalLow/Eleventh Hour Games/Last Epoch"}".source = link "last-epoch";
      "${steamPath 404590   "AppData/LocalLow/Games Farm s_r_o_/Vikings_ Wolves of Midgard/saves"}".source = link "vikings-wolfs-of-midgard";
      "${steamPath 892970   "AppData/LocalLow/IronGate/Valheim"}".source = link "valheim";
      "${steamPath 527230   "AppData/LocalLow/LocalLow/IronOak Games/FTK/save"}".source = link "for-the-king";   
      "${steamPath 1166290  "AppData/LocalLow/Placeholder Gameworks/Death and Taxes/Saves"}".source = link "death-and-taxes";
      "${steamPath 1096530  "AppData/LocalLow/Tactical Adventures/Solasta"}".source = link "solasta";  
      "${steamPath 287390   "Documents/4a games/Metro Last Light"}".source = link "metro-last-light";
      "${steamPath 43110    "Documents/4a games/metro 2033"}".source = link "metro-2033";
      "${steamPath 48240    "Documents/ANNO 2070"}".source = link "anno2070";
      "${steamPath 47810    "Documents/BioWare/Dragon Age"}".source = link "dragon-age";
      "${steamPath 1213210  "Documents/CnCRemastered"}".source = link "cnc-remastered";
      "${steamPath 98800    "Documents/Dungeons of Dredmor"}".source = link "dungeons-of-dreadmor";
      "${steamPath 223220   "Documents/Giana Sisters - Twisted Dreams"}".source = link "giana-sisters";
      "${steamPath 322330   "Documents/Klei/DoNotStarveTogether"}".source = link "dont-starve-together";
      "${steamPath 243950   "Documents/Larian Studios/Dragon Commander"}".source = link "dragon-commander";
      "${steamPath 22330    "Documents/My Games/Oblivion"}".source = link "the-elder-scrolls4-oblivion";
      "${steamPath 40950    "Documents/stronghold"}".source = link "stronghold";
      "${steamPath 40960    "Documents/Stronghold 2"}".source = link "stronghold2";
      "${steamPath 40970    "Documents/stronghold crusader"}".source = link "stronghold-crusader";
      "${steamPath 232890   "Documents/Stronghold Crusader 2"}".source = link "stronghold-crusader2";
      "${steamPath 40980    "Documents/Stronghold Legends"}".source = link "stronghold-legends";
      "${steamPath 203770   "Documents/Paradox Interactive/Crusader Kings II"}".source = link "crusader-kings2f";
      "${steamPath 41500    "Documents/My Games/runic games/torchlight"}".source = link "torchlight";
      "${steamPath 200710   "Documents/My Games/runic games/torchlight 2"}".source = link "torchlight2";
      "${steamPath 72850    "Documents/My Games/Skyrim"}".source = link "the-elder-scrolls5-skyrim";
      "${steamPath 489830   "Documents/My Games/Skyrim Special Edition"}".source = link "the-elder-scrolls5-skyrim-special-edition";
      "${steamPath 50300    "Documents/My Games/SpecOps-TheLine"}".source = link "spec-ops-the-line";
      "${steamPath 1222700  "Documents/My Games/A Way Out"}".source = link "a-way-out";
      "${steamPath 219990   "Documents/My Games/Grim Dawn"}".source = link "grim-dawn";
      "${steamPath 445190   "Documents/My Games/Expeditions Viking"}".source = link "expeditions-viking";
      "${steamPath 49520    "Documents/My Games/Borderlands 2/WillowGame"}".source = link "borderlands2";
      "${steamPath 261640   "Documents/My Games/Borderlands The Pre-Sequel/WillowGame"}".source = link "borderlands-the-pre-sequel";
      "${steamPath 105450   "Documents/My Games/Age of Empires 3"}".source = link "age-of-empires3";
      "${steamPath 8870     "Documents/My Games/BioShock Infinite"}".source = link "bioshock-infinite";
      "${steamPath 287450   "Documents/My Games/Rise of Nations"}".source = link "rise-of-nations";
      "${steamPath 813780   "Games/Age of Empires 2 DE"}".source = link "age-of-empires2-de";
      "${steamPath 39800    "Nation Red"}".source = link "nation-red";
      "${steamPath 17480    "Red Alert 3"}".source = link "cnc-red-alert3";


      
      #REGEX #"STEAM_PREFIX/(.*)".source.*saves/(.*)"
      #REPLACE #"${steamPath X "$1"}".source = link "$2"
      # Saved Games/
      #"STEAM_PREFIX/Saved Games/Fire Ash".source =  link "${config.home.homeDirectory}/.saves/pokemon-fire-ash";
      #"STEAM_PREFIX/Saved Games/Pokemon Bushido".source =  link "${config.home.homeDirectory}/.saves/pokemon-bushido";
      #"STEAM_PREFIX/Saved Games/Pokemon Reborn".source =  link "${config.home.homeDirectory}/.saves/pokemon-reborn";
      #"STEAM_PREFIX/Saved Games/Pillars of Eternity".source =  link "${config.home.homeDirectory}/.saves/pillars-of-eternity";
      #"STEAM_PREFIX/Saved Games/wolcen/savegames".source =  link "${config.home.homeDirectory}/.saves/wolcen";

      #DOCUMENTS
      #"STEAM_PREFIX/Documents/ANNO 1404 Venice/Savegames".source =  link "${config.home.homeDirectory}/.saves/anno1404";
      #"STEAM_PREFIX/Documents/Avalanche Studios/GenerationZero/Saves".source =  link "${config.home.homeDirectory}/.saves/generation-zero";
       #"STEAM_PREFIX/Documents/BioWare/Dragon Age 2".source =  link "${config.home.homeDirectory}/.saves/dragon-age2";
      #"STEAM_PREFIX/Documents/Avalanche Studios/theHunter Call of the Wild/Saves".source =  link "${config.home.homeDirectory}/.saves/the-hunter-call-of-the-wild";
      #"STEAM_PREFIX/Documents/BioWare/Dragon Age Inquisition".source =  link "${config.home.homeDirectory}/.saves/dragon-age-inquisition";
      #"STEAM_PREFIX/Documents/Larian Studios/Divinity Original Sin".source =  link "${config.home.homeDirectory}/.saves/divinity-original-sin";
      #"STEAM_PREFIX/Documents/Documents/Mount and Blade II Bannerlord".source =  link "${config.home.homeDirectory}/.saves/mount-and-blade2-bannerlord";
      #"STEAM_PREFIX/Documents/EA Games/Mirror's Edge".source =  link "${config.home.homeDirectory}/.saves/mirrors-edge";
      #"STEAM_PREFIX/Documents/Klei/My Games/Age Of Decadence".source =  link "${config.home.homeDirectory}/.saves/age-of-decadence";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Rebirth".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-rebirth";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Afterbirth+".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-afterbirth+";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Afterbirth".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-afterbirth";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Afterbirth+ Mods".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-afterbirth-mods";

      #"STEAM_PREFIX/Documents/My Games/Borderlands 3/Saved".source =  link "${config.home.homeDirectory}/.saves/borderlands3";
      #"STEAM_PREFIX/Documents/My Games/FalloutNV".source =  link "${config.home.homeDirectory}/.saves/fallout-new-vegas";
      #"STEAM_PREFIX/Documents/My Games/Rise Of Legends".source =  link "${config.home.homeDirectory}/.saves/rise-of-legends";

      #"STEAM_PREFIX/Documents/My Games/Terraria".source =  link "${config.home.homeDirectory}/.saves/terraria";
      #"STEAM_PREFIX/Documents/My Games/Titan Quest".source =  link "${config.home.homeDirectory}/.saves/titan-quest";
      #"STEAM_PREFIX/Documents/My Games/Titan Quest - Immortal Throne".source =  link "${config.home.homeDirectory}/.saves/titan-quest-immortal-throne";
      #"STEAM_PREFIX/Documents/My Games/Wasteland3/Save Games".source =  link "${config.home.homeDirectory}/.saves/wasteland3";
      
      #"STEAM_PREFIX/Documents/Van Helsing/SaveGame".source =  link "${config.home.homeDirectory}/.saves/van-helsing";
      #"STEAM_PREFIX/Documents/NStW".source =  link "${config.home.homeDirectory}/.saves/nobody-saves-the-world";
      #"STEAM_PREFIX/Documents/Prince of Persia/Save".source =  link "${config.home.homeDirectory}/.saves/prince-of-persia";
      #"STEAM_PREFIX/Documents/Shadow Warrior DX11".source =  link "${config.home.homeDirectory}/.saves/shadow-warrior";

      #"STEAM_PREFIX/Documents/".source =  link "${config.home.homeDirectory}/.saves/";
    
      #"STEAM_PREFIX/Documents/The Witcher/saves".source = link "${config.home.homeDirectory}/.saves/the-witcher";

      #"STEAM_PREFIX/Games/Deep Rock Galactic".source = link "${config.home.homeDirectory}/.saves/deep-rock-galactic";

      
      #"STEAM_PREFIX/AppData/LocalLow/Beam Team Games/Stranded Deep".source = link "${config.home.homeDirectory}/.saves/Stranded Deep";
      #"STEAM_PREFIX/AppData/LocalLow/Daybreak Game Company".source = link "${config.home.homeDirectory}/.saves/root";

      #"STEAM_PREFIX/AppData/LocalLow/League of Geeks/Armello".source = link "${config.home.homeDirectory}/.saves/armello";
      #"STEAM_PREFIX/AppData/LocalLow/Redbeet Interactive/Raft/User".source = link "${config.home.homeDirectory}/.saves/raft";
      #"STEAM_PREFIX/AppData/LocalLow/".source = link "${config.home.homeDirectory}/.saves/";


      #"STEAM_PREFIX/AppData/Local/Divinity 2/Savegames".source = link "${config.home.homeDirectory}/.saves/divinity2";
      #"STEAM_PREFIX/AppData/Local/Zombie Army Trilogy".source = link "${config.home.homeDirectory}/.saves/zombie-army-trilogy";


      #".local/share/Steam/steamapps/compatdata/4227765030/pfx/drive_c/users/steamuser/AppData/LocalLow/Oleg Kazakov/Gedonia".source = link "${config.home.homeDirectory}/.saves/gedonia";
      #".local/share/Steam/steamapps/compatdata/4031134044/pfx/drive_c/users/steamuser/Application Data/Reminiscencia".source = link "${config.home.homeDirectory}/.saves/pokemon-xenoverse";
      #".local/share/Steam/steamapps/compatdata/4000143998/pfx/drive_c/users/steamuser/Saved Games/Diablo II Resurrected".source = link "${config.home.homeDirectory}/.saves/diablo2-ressurected";
      #".local/share/Steam/steamapps/compatdata/3996246859/pfx/drive_c/users/steamuser/Local Settings/Application Data/Strategy".source = link "${config.home.homeDirectory}/.saves/norland";
      #".local/share/Steam/steamapps/compatdata/3984431280/pfx/drive_c/users/steamuser/AppData/Local/Medieval_Dynasty".source = link "${config.home.homeDirectory}/.saves/medieval-dynasty";
      #".local/share/Steam/steamapps/compatdata/3984061722/pfx/drive_c/users/steamuser/AppData/Local/SANDLAND/Saved".source = link "${config.home.homeDirectory}/.saves/sandland";
      #".local/share/Steam/steamapps/compatdata/3983217185/pfx/drive_c/users/steamuser/Saved Games/Pokemon Parallax".source = link "${config.home.homeDirectory}/.saves/pokemon-parallax";
      #".local/share/Steam/steamapps/compatdata/3817464133/pfx/drive_c/users/steamuser/Saved Games/Pokemon Uranium".source = link "${config.home.homeDirectory}/.saves/pokemon-uranium";
      #"/.local/share/Steam/steamapps/compatdata/2570660752/pfx/drive_c/users/steamuser/Saved Games/Pokemon Insurgence".source = link "${config.home.homeDirectory}/.saves/pokemon-insurgence";
      #".local/share/Steam/steamapps/compatdata/3307882437/pfx/drive_c/users/steamuser/Saved Games/Pokemon This Gym of Mine".source = link "${config.home.homeDirectory}/.saves/pokemon-this-gym-of-mine";
      #".local/share/Steam/steamapps/compatdata/2988605146/pfx/drive_c/users/steamuser/Saved Games/Pokemon The New Order".source = link "${config.home.homeDirectory}/.saves/pokemon-the-new-order";
      #".local/share/Steam/steamapps/compatdata/3963673293/pfx/drive_c/users/steamuser/Documents/Larian Studios/Divinity Original Sin 2 Definitive Edition".source = link "${config.home.homeDirectory}/.saves/divinity-original-sin2";
      #".local/share/Steam/steamapps/compatdata/3628613238/pfx/drive_c/users/steamuser/AppData/Local/AronsAdventure/Saved".source = link "${config.home.homeDirectory}/.saves/arons-adventure";
      #".local/share/Steam/steamapps/compatdata/3616312285/pfx/drive_c/users/steamuser/AppData/Local/Larian Studios/Baldur's Gate 3".source = link "${config.home.homeDirectory}/.saves/baldurs-gate3";
      #".local/share/Steam/steamapps/compatdata/3516046424/pfx/drive_c/users/steamuser/AppData/Local/PunCity/Saved".source = link "${config.home.homeDirectory}/.saves/kingdoms-reborn";
      #".local/share/Steam/steamapps/compatdata/3406660281/pfx/drive_c/users/steamuser/AppData/LocalLow/MinMax Games/Clanfolk".source = link "${config.home.homeDirectory}/.saves/kingdoms-reborn";
      #".local/share/Steam/steamapps/compatdata/2749118746/pfx/drive_c/users/steamuser/AppData/LocalLow/Vector3 Studio/Sunkenland".source = "${config.home.homeDirectory}/.saves/sunkenland";
      #".local/share/Steam/steamapps/compatdata/2637654718/pfx/drive_c/users/steamuser/AppData/LocalLow/Dead Mage/Children of Morta".source = "${config.home.homeDirectory}/.saves/children-of-morta";

      };
    };
  }