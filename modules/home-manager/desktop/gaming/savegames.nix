{ config, pkgs, lib, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
    options = {
      games.saves.enable = lib.mkEnableOption "enable custom save manager";
    };

  config = {
    home.file = lib.mkIf config.games.saves.enable {
      # Proton Games
      ".local/share/Steam/steamapps/compatdata/1623730/pfx/drive_c/users/steamuser/AppData/Local/Pal/Saved".source = link "${config.home.homeDirectory}/.saves/palworld";
      ".local/share/Steam/steamapps/compatdata/858820/pfx/drive_c/users/steamuser/AppData/Local/TOM/Saved".source = link "${config.home.homeDirectory}/.saves/tribes-of-midgard";
      ".local/share/Steam/steamapps/compatdata/690830/pfx/drive_c/users/steamuser/My Documents/Polymorph Games/Foundation".source = link "${config.home.homeDirectory}/.saves/foundation";
      ".local/share/Steam/steamapps/compatdata/1218210/pfx/drive_c/users/steamuser/AppData/Roaming/TRAGsoft/Coromon".source = link "${config.home.homeDirectory}/.saves/coromon";
      ".local/share/Steam/steamapps/compatdata/1822550/pfx/drive_c/users/steamuser/AppData/Roaming/MicroCivilization".source = link "${config.home.homeDirectory}/.saves/microcivilization";
      ".local/share/Steam/steamapps/compatdata/1222670/pfx/drive_c/users/steamuser/Documents/Electronic Arts/The Sims 4".source = link "${config.home.homeDirectory}/.saves/the-sims4";
      ".local/share/Steam/steamapps/compatdata/1549250/pfx/drive_c/users/steamuser/AppData/Local/RzGame".source = link "${config.home.homeDirectory}/.saves/undecember";

      # Native Games
      ".local/share/NeposGames/Nebuchadnezzar".source = link "${config.home.homeDirectory}/.saves/nebuchadnezzar";
      ".local/share/Paradox Interactive/Crusader Kings III/".source = link "${config.home.homeDirectory}/.saves/crusader-kings3";
      ".local/share/Pokemon Rejuvenation".source = link "${config.home.homeDirectory}/.saves/pokemon-rejuvenation";
      ".local/share/Colossal Order/Cities_Skylines".source = link "${config.home.homeDirectory}/.saves/cities-skylines";
      ".local/share/Colossal Order/Monster Sanctuary".source = link "${config.home.homeDirectory}/.saves/monster-sanctuary";

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