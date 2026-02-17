# ROM Placement

Place your **Monster Rancher Advance 2 (USA)** ROM in this directory.

## Expected File

- **Filename:** `mra2.gba` (rename your ROM to this)
- **Region:** USA / NTSC
- **Serial:** AGB-A2OE-USA
- **CRC32:** 1D695B1B
- **Size:** ~8 MB (8,388,608 bytes)

## Important

ROM files are **not committed to git**. You must provide your own legally obtained copy.

The `.gitignore` excludes `*.gba`, `*.bin`, and `*.zip` files from this directory.

## Verifying Your ROM

You can verify your ROM's checksum:

```bash
# Linux/macOS
crc32 rom/mra2.gba
# or
python -c "import binascii, pathlib; print(hex(binascii.crc32(pathlib.Path('rom/mra2.gba').read_bytes()) & 0xFFFFFFFF))"
```

Expected CRC32: `0x1d695b1b`

## Japanese Version

The Japanese version (モンスターファームアドバンス2, AGB-A2OJ-JPN) may also be useful
for comparison analysis. If you have it, place it as `mra2_jp.gba`.
