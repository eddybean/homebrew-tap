# eddybean/homebrew-tap

Homebrew tap for [Exolobe](https://github.com/eddybean/exolobe).

```sh
brew install --cask eddybean/tap/exolobe
brew upgrade --cask exolobe
```

Exolobe is ad-hoc signed (not notarised), so it is not eligible for the official
homebrew/cask. The cask removes the quarantine attribute after installation.

`Casks/exolobe.rb` is updated automatically by the
[Release workflow](https://github.com/eddybean/exolobe/blob/main/.github/workflows/release.yml).
