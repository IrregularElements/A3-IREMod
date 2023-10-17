Arma 3 - IRE Mod
================
IRE Mod is a collection of random Arma 3 gameplay tweaks.

For full feature description, refer to [docs](docs/IREMod.md).

Building from source
--------------------
1. Install Rust (e.g. with [rustup](https://rustup.rs/)).
2. Install HEMTT:
   ```sh
   cargo install --force --git=https://github.com/BrettMayson/HEMTT --tag=v1.9.1 hemtt
   ```
3. Build this project:
   ```sh
   hemtt release
   ```
