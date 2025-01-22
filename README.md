# LUNAC

A personal modded client based on THOL vanilla client v20319.

Just exploring..that's all.


## Building

### Requirements

- Standalone `nix` package manager or NixOS with `flake` feature enabled.

1. Recursively clone the project with: `git clone --recurse-submodules https://github.com/cloudyluna/LUNAC`
2. `cd` into the repository.
3. Run `nix develop` or enable `direnv` with `direnv allow`. Wait for the nix development environment to load.
4. Run `make` to build both `client` and the `server`.

Optionally, run `make run-client` to run the client directly.
