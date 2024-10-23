{ lib
, stdenv
, fetchFromGitHub
, python3
}:

stdenv.mkDerivation {
	pname = "fusee-launcher";
	version = "0.0.1";
	#format = "pyproject";

  src = fetchFromGitHub {
    owner = "benzhu56";
    repo = "fusee-launcher";
    rev = "main";
    hash = "sha256-XG6mlJbXlfFTgFmc9jv1Eth6iZUaC/AN4Th77aKw9GE=";
  };

  installPhase = ''
    install fusee-launcher.py -Dm 755 $out/bin/fusee-launcher/fusee-launcher.py 
    cp ./*.bin $out/bin/fusee-launcher
    cp ./Reboot.txt $out/bin/fusee-launcher
    cp ./*.py $out/bin/fusee-launcher
    install fusee-launcher.py . -Dm 755 Reboot.txt
    ln -s $out/bin/fusee-launcher $out/bin/fusee-launcher
  '';

  buildPhase = '''';


	propagatedBuildInputs = with python3.pkgs; [
    (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
      pyusb
    ]))
	];
}