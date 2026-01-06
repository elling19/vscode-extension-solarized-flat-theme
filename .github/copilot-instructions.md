# Copilot Instructions

- Purpose: publish two Solarized-derived VS Code themes (light/dark) with flat aesthetics; repo is purely declarative, no build pipeline.
- Key files: extension manifest in [package.json](package.json); color definitions in [themes/Solarized Flat Light-color-theme.json](themes/Solarized%20Flat%20Light-color-theme.json) and [themes/Solarized Flat Dark-color-theme.json](themes/Solarized%20Flat%20Dark-color-theme.json); palette reference in [README.md](README.md).
- Themes are contributed via `contributes.themes` entries (label, `uiTheme`, `path`) in [package.json](package.json). Keep these in sync when adding variants.
- Palette constraints: base colors follow the Solarized set documented in [README.md](README.md); favor reusing those hexes to keep the look consistent. Avoid inventing new hues unless intentionally deviating.
- Editing themes: tokens map to VS Code `colors` and `tokenColors` sections (see theme JSON files). Preserve JSON structure and comments (if any) while updating. Keep string keys exact; VS Code ignores unknown keys.
- Style goal: “flat” rendering—prefer solid fills and low/no gradients; avoid glossy/shadowed appearances. Keep contrast similar to canonical Solarized.
- No tests or scripts exist. Validation workflow is manual: load the folder as an extension in VS Code or `F5` (Extension Development Host) to visually inspect changes.
- Packaging/publishing: no tooling provided. If needed, standard VS Code flow applies (`vsce package` / `vsce publish`) using [package.json](package.json) metadata.
- Versioning: version is set in [package.json](package.json); [CHANGELOG.md](CHANGELOG.md) is empty—update both together when releasing.
- Repo has minimal docs; please add screenshots or before/after notes in [README.md](README.md) when adjusting major colors.

If anything here is unclear or incomplete, let me know what to refine.