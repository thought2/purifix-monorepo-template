{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    purifix = {
      url = "github:purifix/purifix";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ inputs.purifix.overlay ];
        };
        my-package = pkgs.purifix {
          src = ./pkgs;
          subdir = "sample-server";
        };
      in
      {
        packages = {
          default = my-package;
        };
        defaultPackage = my-package;
        devShells.default = my-package.development; 
      });
}
