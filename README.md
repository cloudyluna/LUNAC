# LUNAC

A personal modded client (and server) based on THOL vanilla client v20319.

Just exploring..that's all.

## Features & Changes
- On-screen chat log panel to retain last spoken 17 messages from nearby players.

### Technical
- Compilable with C++ 23 and `clang++` 19.4+.
- Simple development flow with `flake.nix` and Makefile.
- `cppcheck` and clang ASAN is availabled to be used.

## Building

### Requirements

- Standalone `nix` package manager or NixOS with `flake` feature enabled.

1. Recursively clone the project with: `git clone --recurse-submodules https://github.com/cloudyluna/LUNAC`
2. `cd` into the repository.
3. Run `nix develop` or enable `direnv` with `direnv allow`. Wait for the nix development environment to load.
4. Run `make` to build both `client` and the `server`.

Optionally, run `make run-client` to run the client directly.


`OPTIMIZATION` flags for `Makefile` includes:

- `debug` - optimized build for compilation speed. the default with full warnings.
- `debug_no_warn` - same as `debug` but with warnings surpressed.
- `debug_asan` - (experimental) optimized for clang address sanitizer.
- `fast` - optimized for runtime speed `-O3`.

Example: `make client OPTIMIZATION=fast`
