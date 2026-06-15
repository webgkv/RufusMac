# Third-party tools & licensing

RufusMac orchestrates external tools. The built-ins ship with macOS; the extras
are fetched into `./vendor` by `scripts/fetch_thirdparty.sh` and bundled into
`RufusMac.app/Contents/Resources/thirdparty` by `scripts/build_app.sh`.

| Tool | Used for | Required by | License |
|------|----------|-------------|---------|
| `diskutil`, `hdiutil`, `dd`, `shasum` | enumerate/format/write/verify | everything | Apple (system) |
| `wimlib-imagex` | split `install.wim` > 4 GB → `.swm` | Windows mode | GPLv3 / LGPLv3 |
| `mke2fs` (e2fsprogs) | ext4 persistence partition | Linux persistence | GPLv2 |
| Ventoy boot files | multiboot drive layout/menu | Multiboot mode | GPLv3 |
| `uefi-ntfs.img` (Rufus) | optional NTFS Windows boot | NTFS fallback | GPLv3 |

**Linux and Reclaim modes need none of these** — they use only built-in macOS tools.

## Bundling notes
- Homebrew binaries link against Homebrew dylibs. For a fully self-contained,
  portable build, post-process bundled binaries with
  [`dylibbundler`](https://github.com/auriamg/macdylibbundler) or use static builds.
- Ventoy has **no official macOS installer**; RufusMac replicates its partition
  layout from the bundled Linux release, which is why Multiboot is marked
  *experimental*. Pin a known Ventoy version via `VENTOY_VERSION`.

## Compliance
RufusMac is **GPLv3**, compatible with bundling the GPL tools above. When you
distribute a build that includes them, also make their corresponding source
available (link to the upstream projects in your release notes).
