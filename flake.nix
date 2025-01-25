{
  description = "";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
  };
  
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = with pkgs; mkShell rec {
          buildInputs = [
            pkg-config
            xclip
            openssl
            zlib
            libpng
            libGL
            SDL
            llvmPackages_19.libcxxClang
            llvmPackages_19.compiler-rt
            llvmPackages_19.libcxx
            llvmPackages_19.libcxxStdenv
            llvmPackages_19.libllvm
            llvmPackages_19.clang-tools
            lldb_19
            gnumake
            cppcheck
            imagemagick_light
            valgrind
          ];
          shellHook = ''
            export CC=clang
            export CXX=clang++
          '';

          LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}:/run/opengl-driver/lib";
        };
      }
    );
}
