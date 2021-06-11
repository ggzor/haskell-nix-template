let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { inherit config; };
  hls = import sources.all-hls { version = "0.9.0"; ghc = "8.8.4"; };

  compilerVersion = "ghc884";
  compilerSet = pkgs.haskell.packages."${compilerVersion}";

  gitIgnore = pkgs.nix-gitignore.gitignoreSourcePure;
  config = {
    packageOverrides = super: let self = super.pkgs; in rec {
      haskell = super.haskell // {
        packageOverrides = self: super: {
          haskell-nix-template = super.callCabal2nix "haskell-nix-template" (gitIgnore [./.gitignore] ./.) {};
        };
      };
    };
  };
in {
  inherit pkgs;
  shell = compilerSet.shellFor {
    packages = p: [p.haskell-nix-template];
    buildInputs = with pkgs; [
      compilerSet.cabal-install
      ormolu
      hls
    ];
  };
}
