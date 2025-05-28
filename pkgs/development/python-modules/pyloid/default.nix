{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  aiohttp-cors,
  pickledb,
  platformdirs,
  pyside6,
  pythonRelaxDepsHook,
}:

buildPythonPackage rec {
  pname = "pyloid";
  version = "0.24.0-beta";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyloid";
    repo = "pyloid";
    rev = "v${version}";
    hash = "sha256-6JDuWQeoW5KILUsBRbOqYozY2C1mkSnxvYDsezt9nP0=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    aiohttp-cors
    pickledb
    platformdirs
    pyside6
  ];

  pythonRelaxDeps = [
    "pyside6"
  ];

  pythonImportsCheck = [
    "pyloid"
  ];

  meta = {
    description = "Pyloid: Thread-Safe Desktop Apps—Unified with Any Frontend and Python Technology";
    homepage = "https://github.com/pyloid/pyloid.git";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ katzenbiber ];
  };
}
