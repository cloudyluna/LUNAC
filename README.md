# LUNAC

A personally modded client based on THOL vanilla client v20319.

Just exploring..that's all.


## Building

### Requirements

- Standalone `nix` package manager or NixOS with `flake` feature enabled.

1. Recursively clone the project with: `git clone --recurse-submodules https://github.com/cloudyluna/LUNAC`
2. `cd` into the repository.
3. Run `nix develop` or enable `direnv` with `direnv allow`. Wait for the nix development environment to load.
4. Once it's done, `cd` into `miniOneLifeCompile` and run to build:
   - *client*: `./compile.sh`.
   - *server*: `./server.sh`.
5. Once the compilation is done, `cd` into `../output` directory. You can
launch the game client with `./OneLife` or the server with `./OneLifeServer`.

## TODOS
- Allow `-O3` optimization flag as CLI arg with `miniOneLifeCompile`.
- Make a single shell script to automate initial building process.
