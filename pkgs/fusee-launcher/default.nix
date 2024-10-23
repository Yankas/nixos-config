{ lib
, python3
, fetchFromGitHub
}:

buildPythonPackage rec {
	pname = "fusee-launcher";
	version = "0.0.1";
	src = ./.;

	format = "pyproject";

	propagatedBuildInputs = [
		setuptools
    pyusb
		(buildPythonPackage rec {
			pname = "fusee-launcher";
			version = "1.1";
			src = fetchFromGitHub {
				owner = "Yankas";
				repo = "fusee-launcher";
				rev = "final";
				#sha256 = "112816d44bf4c0da8e8f442aed370020e16594e8888c8ddb10a699779dc666eb";
			};
		})
	];
}