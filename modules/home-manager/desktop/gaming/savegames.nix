{ config, pkgs, lib, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink; in
  let compatData = ".local/share/Steam/steamapps/compatdata/"; in
  let steamUser = appId: "${compatData}${appId}/pfx/drive_c/users/steamuser/";
in
{
    options = {
      games.saves.enable = lib.mkEnableOption "enable custom save manager";
      games.saves.directory = lib.mkOption {
        type = with lib.types; str;
      };
    };

  config = {
      #steamLink 1623730 "AppData/Local/Pal/Saved" "palworld"
    home.file = lib.mkIf config.games.saves.enable {
      #games.saves.directory = lib.mkDefault "${config.home.homeDirectory}/.saves";
      # Proton Games
      
      ".local/share/Steam/steamapps/compatdata/1623730/pfx/drive_c/users/steamuser/AppData/Local/Pal/Saved".source = link "${config.home.homeDirectory}/.saves/palworld";
      ".local/share/Steam/steamapps/compatdata/858820/pfx/drive_c/users/steamuser/AppData/Local/TOM/Saved".source = link "${config.home.homeDirectory}/.saves/tribes-of-midgard";
      ".local/share/Steam/steamapps/compatdata/690830/pfx/drive_c/users/steamuser/My Documents/Polymorph Games/Foundation".source = link "${config.home.homeDirectory}/.saves/foundation";
      ".local/share/Steam/steamapps/compatdata/1218210/pfx/drive_c/users/steamuser/AppData/Roaming/TRAGsoft/Coromon".source = link "${config.home.homeDirectory}/.saves/coromon";
      ".local/share/Steam/steamapps/compatdata/1822550/pfx/drive_c/users/steamuser/AppData/Roaming/MicroCivilization".source = link "${config.home.homeDirectory}/.saves/microcivilization";
      ".local/share/Steam/steamapps/compatdata/1222670/pfx/drive_c/users/steamuser/Documents/Electronic Arts/The Sims 4".source = link "${config.home.homeDirectory}/.saves/the-sims4";
      ".local/share/Steam/steamapps/compatdata/1549250/pfx/drive_c/users/steamuser/AppData/Local/RzGame".source = link "${config.home.homeDirectory}/.saves/undecember";
      "${steamUser 560130}Saved Games/Local/" = link "pillars-of-eternity2";
      #linkSteamSave 560130 Saved Games/Pillars of Eternity II pillars-of-eternity2;
      #".local/share/Steam/steamapps/compatdata/560130/pfx/drive_c/users/steamuser/Saved Games/Pillars of Eternity II".source =  link "${config.home.homeDirectory}/.saves/pillars-of-eternity2";
      #${}
      # Native Games
      ".local/share/NeposGames/Nebuchadnezzar".source = link "${config.home.homeDirectory}/.saves/nebuchadnezzar";
      ".local/share/Paradox Interactive/Crusader Kings III/".source = link "${config.home.homeDirectory}/.saves/crusader-kings3";
      ".local/share/Pokemon Rejuvenation".source = link "${config.home.homeDirectory}/.saves/pokemon-rejuvenation";
      ".local/share/Colossal Order/Cities_Skylines".source = link "${config.home.homeDirectory}/.saves/cities-skylines";
      ".local/share/Colossal Order/Monster Sanctuary".source = link "${config.home.homeDirectory}/.saves/monster-sanctuary";


      # Saved Games/
      #"STEAM_PREFIX/Saved Games/Fire Ash".source =  link "${config.home.homeDirectory}/.saves/pokemon-fire-ash";
      #"STEAM_PREFIX/Saved Games/Pokemon Bushido".source =  link "${config.home.homeDirectory}/.saves/pokemon-bushido";
      #"STEAM_PREFIX/Saved Games/Pokemon Reborn".source =  link "${config.home.homeDirectory}/.saves/pokemon-reborn";
      #"STEAM_PREFIX/Saved Games/Pillars of Eternity".source =  link "${config.home.homeDirectory}/.saves/pillars-of-eternity";
      #"STEAM_PREFIX/Saved Games/Pillars of Eternity II".source =  link "${config.home.homeDirectory}/.saves/pillars-of-eternity2";
      #"STEAM_PREFIX/Saved Games/Risen2/SaveGames".source =  link "${config.home.homeDirectory}/.saves/risen2";
      #"STEAM_PREFIX/Saved Games/wolcen/savegames".source =  link "${config.home.homeDirectory}/.saves/wolcen";
      #"STEAM_PREFIX/Saved Games/deceit".source =  link "${config.home.homeDirectory}/.saves/deceit";
      #"STEAM_PREFIX/Saved Games/Command & Conquer 3 Tiberium Wars".source =  link "${config.home.homeDirectory}/.saves/cnc3-tiberium-wars";
      #"STEAM_PREFIX/Saved Games/Command & Conquer 3 Kane's Wrath".source =  link "${config.home.homeDirectory}/.saves/cnc3-kanes-wrath";

      #DOCUMENTS
      #"STEAM_PREFIX/Documents/ANNO 1404 Venice/Savegames".source =  link "${config.home.homeDirectory}/.saves/anno1404";
      #"STEAM_PREFIX/Documents/Avalanche Studios/GenerationZero/Saves".source =  link "${config.home.homeDirectory}/.saves/generation-zero";
      #"STEAM_PREFIX/Documents/Avalanche Studios/theHunter Call of the Wild/Saves".source =  link "${config.home.homeDirectory}/.saves/the-hunter-call-of-the-wild";
      #"STEAM_PREFIX/Documents/ANNO 2070".source =  link "${config.home.homeDirectory}/.saves/anno2070";
      #"STEAM_PREFIX/Documents/BioWare/Dragon Age".source =  link "${config.home.homeDirectory}/.saves/dragon-age";
      #"STEAM_PREFIX/Documents/BioWare/Dragon Age 2".source =  link "${config.home.homeDirectory}/.saves/dragon-age2";
      #"STEAM_PREFIX/Documents/BioWare/Dragon Age Inquisition".source =  link "${config.home.homeDirectory}/.saves/dragon-age-inquisition";
      #"STEAM_PREFIX/Documents/CnCRemastered".source =  link "${config.home.homeDirectory}/.saves/cnc-remastered";
      #"STEAM_PREFIX/Documents/Dungeons of Dredmor".source =  link "${config.home.homeDirectory}/.saves/dungeons-of-dreadmor";
      #"STEAM_PREFIX/Documents/Giana Sisters - Twisted Dreams".source =  link "${config.home.homeDirectory}/.saves/giana-sisters";
      #"STEAM_PREFIX/Documents/Klei/DoNotStarveTogether".source =  link "${config.home.homeDirectory}/.saves/dont-starve-together";
      #"STEAM_PREFIX/Documents/Larian Studios/Divinity Original Sin".source =  link "${config.home.homeDirectory}/.saves/divinity-original-sin";
      #"STEAM_PREFIX/Documents/Larian Studios/Dragon Commander".source =  link "${config.home.homeDirectory}/.saves/dragon-commander";
      #"STEAM_PREFIX/Documents/Documents/Mount and Blade II Bannerlord".source =  link "${config.home.homeDirectory}/.saves/mount-and-blade2-bannerlord";
      #"STEAM_PREFIX/Documents/EA Games/Mirror's Edge".source =  link "${config.home.homeDirectory}/.saves/mirrors-edge";
      #"STEAM_PREFIX/Documents/Klei/My Games/Age Of Decadence".source =  link "${config.home.homeDirectory}/.saves/age-of-decadence";
      #"STEAM_PREFIX/Documents/My Games/Age of Empires 3".source =  link "${config.home.homeDirectory}/.saves/age-of-empires3";
      #"STEAM_PREFIX/Documents/My Games/A Way Out".source =  link "${config.home.homeDirectory}/.saves/a-way-out";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Rebirth".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-rebirth";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Afterbirth+".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-afterbirth+";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Afterbirth".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-afterbirth";
      #"STEAM_PREFIX/Documents/My Games/Binding of Isaac Afterbirth+ Mods".source =  link "${config.home.homeDirectory}/.saves/the-binding-of-isaac-afterbirth-mods";
      #"STEAM_PREFIX/Documents/My Games/BioShock Infinite".source =  link "${config.home.homeDirectory}/.saves/bioshock-infinite";
      #"STEAM_PREFIX/Documents/My Games/Borderlands 2/WillowGame".source =  link "${config.home.homeDirectory}/.saves/borderlands2";
      #"STEAM_PREFIX/Documents/My Games/Borderlands 3/Saved".source =  link "${config.home.homeDirectory}/.saves/borderlands3";
      #"STEAM_PREFIX/Documents/My Games/Borderlands The Pre-Sequel/WillowGame".source =  link "${config.home.homeDirectory}/.saves/borderlands-the-pre-sequel";
      #"STEAM_PREFIX/Documents/My Games/Expeditions Viking".source =  link "${config.home.homeDirectory}/.saves/expeditions-viking";
      #"STEAM_PREFIX/Documents/My Games/FalloutNV".source =  link "${config.home.homeDirectory}/.saves/fallout-new-vegas";
      #"STEAM_PREFIX/Documents/My Games/Oblivion".source =  link "${config.home.homeDirectory}/.saves/the-elder-scrolls4-oblivion";
      #"STEAM_PREFIX/Documents/My Games/Grim Dawn".source =  link "${config.home.homeDirectory}/.saves/grim-dawn";
      #"STEAM_PREFIX/Documents/My Games/Rise Of Legends".source =  link "${config.home.homeDirectory}/.saves/rise-of-legends";
      #"STEAM_PREFIX/Documents/My Games/Rise of Nations".source =  link "${config.home.homeDirectory}/.saves/rise-of-nations";
      #"STEAM_PREFIX/Documents/My Games/runic games/torchlight".source =  link "${config.home.homeDirectory}/.saves/torchlight";
      #"STEAM_PREFIX/Documents/My Games/runic games/torchlight 2".source =  link "${config.home.homeDirectory}/.saves/torchlight2";
      #"STEAM_PREFIX/Documents/My Games/Skyrim".source =  link "${config.home.homeDirectory}/.saves/the-elder-scrolls5-skyrim";
      #"STEAM_PREFIX/Documents/My Games/Skyrim Special Edition".source =  link "${config.home.homeDirectory}/.saves/the-elder-scrolls5-skyrim-special-edition";
      #"STEAM_PREFIX/Documents/My Games/SpecOps-TheLine".source =  link "${config.home.homeDirectory}/.saves/spec-ops-the-line";
      #"STEAM_PREFIX/Documents/My Games/Terraria".source =  link "${config.home.homeDirectory}/.saves/terraria";
      #"STEAM_PREFIX/Documents/My Games/Titan Quest".source =  link "${config.home.homeDirectory}/.saves/titan-quest";
      #"STEAM_PREFIX/Documents/My Games/Titan Quest - Immortal Throne".source =  link "${config.home.homeDirectory}/.saves/titan-quest-immortal-throne";
      #"STEAM_PREFIX/Documents/My Games/Wasteland3/Save Games".source =  link "${config.home.homeDirectory}/.saves/wasteland3";
      
      #"STEAM_PREFIX/Documents/Van Helsing/SaveGame".source =  link "${config.home.homeDirectory}/.saves/van-helsing";
      #"STEAM_PREFIX/Documents/NStW".source =  link "${config.home.homeDirectory}/.saves/nobody-saves-the-world";
      #"STEAM_PREFIX/Documents/Prince of Persia/Save".source =  link "${config.home.homeDirectory}/.saves/prince-of-persia";
      #"STEAM_PREFIX/Documents/Shadow Warrior DX11".source =  link "${config.home.homeDirectory}/.saves/shadow-warrior";
      #"STEAM_PREFIX/Documents/stronghold".source =  link "${config.home.homeDirectory}/.saves/stronghold";
      #"STEAM_PREFIX/Documents/Stronghold 2".source =  link "${config.home.homeDirectory}/.saves/stronghold2";
      #"STEAM_PREFIX/Documents/stronghold crusader".source =  link "${config.home.homeDirectory}/.saves/stronghold-crusader";
      #"STEAM_PREFIX/Documents/Stronghold Crusader 2".source =  link "${config.home.homeDirectory}/.saves/stronghold-crusader2";
      #"STEAM_PREFIX/Documents/Stronghold Legends".source =  link "${config.home.homeDirectory}/.saves/stronghold-legends";
      #"STEAM_PREFIX/Documents/".source =  link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/Documents/Paradox Interactive/Crusader Kings II".source =  link "${config.home.homeDirectory}/.saves/crusader-kings2f";
    
      #"STEAM_PREFIX/Documents/The Witcher/saves".source = link "${config.home.homeDirectory}/.saves/the-witcher";
      #"STEAM_PREFIX/Documents/4a games/Metro Last Light".source = link "${config.home.homeDirectory}/.saves/metro-last-light";
      #"STEAM_PREFIX/Documents/4a games/metro 2033".source = link "${config.home.homeDirectory}/.saves/metro-2033";
      #"STEAM_PREFIX/Red Alert 3".source = link "${config.home.homeDirectory}/.saves/cnc-red-alert3";
      #"STEAM_PREFIX/Games/Deep Rock Galactic".source = link "${config.home.homeDirectory}/.saves/deep-rock-galactic";
      #"STEAM_PREFIX/Games/Age of Empires 2 DE".source = link "${config.home.homeDirectory}/.saves/age-of-empires2-de";
      #"STEAM_PREFIX/AppData/Roaming/Victor Vran".source = link "${config.home.homeDirectory}/.saves/victor-vran";
      
      
      #"STEAM_PREFIX/AppData/LocalLow/Beam Team Games/Stranded Deep".source = link "${config.home.homeDirectory}/.saves/Stranded Deep";
      #"STEAM_PREFIX/AppData/LocalLow/Daybreak Game Company".source = link "${config.home.homeDirectory}/.saves/root";
      #"STEAM_PREFIX/AppData/LocalLow/duoyi/Gunfire Reborn".source = link "${config.home.homeDirectory}/.saves/gunfire-reborn";
      #"STEAM_PREFIX/AppData/LocalLow/Eleventh Hour Games/Last Epoch".source = link "${config.home.homeDirectory}/.saves/last-epoch";
      #"STEAM_PREFIX/AppData/LocalLow/Games Farm s_r_o_/Vikings_ Wolves of Midgard/saves".source = link "${config.home.homeDirectory}/.saves/vikings-wolfs-of-midgard";
      #"STEAM_PREFIX/AppData/LocalLow/IronGate/Valheim".source = link "${config.home.homeDirectory}/.saves/valheim";
      #"STEAM_PREFIX/AppData/LocalLow/LocalLow/IronOak Games/FTK/save".source = link "${config.home.homeDirectory}/.saves/for-the-king";
      #"STEAM_PREFIX/AppData/LocalLow/League of Geeks/Armello".source = link "${config.home.homeDirectory}/.saves/armello";
      #"STEAM_PREFIX/AppData/LocalLow/Placeholder Gameworks/Death and Taxes/Saves".source = link "${config.home.homeDirectory}/.saves/death-and-taxes";
      #"STEAM_PREFIX/AppData/LocalLow/Redbeet Interactive/Raft/User".source = link "${config.home.homeDirectory}/.saves/raft";
      #"STEAM_PREFIX/AppData/LocalLow/Tactical Adventures/Solasta".source = link "${config.home.homeDirectory}/.saves/solasta";
      #"STEAM_PREFIX/AppData/LocalLow/".source = link "${config.home.homeDirectory}/.saves/";


      #"STEAM_PREFIX/AppData/Local/Divinity 2/Savegames".source = link "${config.home.homeDirectory}/.saves/divinity2";
      #"STEAM_PREFIX/AppData/Local/Zombie Army Trilogy".source = link "${config.home.homeDirectory}/.saves/zombie-army-trilogy";
      #"STEAM_PREFIX/AppData/Local/SherwoodExtreme/Saved".source = link "${config.home.homeDirectory}/.saves/sherwood-extreme";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/AppData/Local/".source = link "${config.home.homeDirectory}/.saves/";
      #"STEAM_PREFIX/Nation Red".source = link "${config.home.homeDirectory}/.saves/nation-red";

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
      #".local/share/Steam/steamapps/compatdata/2171131679/pfx/drive_c/users/steamuser/AppData/Roaming/MicroCivilization".source = "${config.home.homeDirectory}/.saves/microcivilization";

      };
    };
  }