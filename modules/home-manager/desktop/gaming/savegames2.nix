{ lib, ... }:
{
  options = with lib; {
    games.saves.()

  };

  config = lib.mkIf config.games.saves.enable (with config.games; {

  });

}