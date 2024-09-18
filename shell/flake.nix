{
  description = "Node.js and Cypress development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [nodejs cypress];
      # chmod -R 777 ~/.config/Cypress
      shellHook = ''
        export CYPRESS_INSTALL_BINARY=0
        export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
      '';
    };
  };
}
