#!/usr/bin/env python3
"""Minimal XWD -> PNG converter using only the stdlib (struct, zlib).

Exists because this container has no imagemagick/scrot/gnome-screenshot,
only x11-apps' `xwd`. Run with the *system* python3 (/usr/bin/python3) --
some environments have a second `python3` on PATH built without zlib.
"""
import struct
import sys
import zlib

FIELDS = [
    "header_size", "file_version", "pixmap_format", "pixmap_depth",
    "pixmap_width", "pixmap_height", "xoffset", "byte_order",
    "bitmap_unit", "bitmap_bit_order", "bitmap_pad", "bits_per_pixel",
    "bytes_per_line", "visual_class", "red_mask", "green_mask",
    "blue_mask", "bits_per_rgb", "colormap_entries", "ncolors",
    "window_width", "window_height", "window_x", "window_y",
    "window_bdrwidth",
]


def read_xwd(path):
    with open(path, "rb") as f:
        data = f.read()

    n = len(FIELDS)
    raw = struct.unpack(">%dI" % n, data[: 4 * n])
    hdr = dict(zip(FIELDS, raw))

    pixels_off = hdr["header_size"] + hdr["ncolors"] * 12

    w = hdr["pixmap_width"]
    h = hdr["pixmap_height"]
    bpl = hdr["bytes_per_line"]
    bpp = hdr["bits_per_pixel"]
    endian = ">" if hdr["byte_order"] == 1 else "<"  # 1 = MSBFirst
    rmask, gmask, bmask = hdr["red_mask"], hdr["green_mask"], hdr["blue_mask"]

    def shift_for(mask):
        if mask == 0:
            return 0, 0
        s = 0
        while not (mask >> s) & 1:
            s += 1
        width = 0
        while (mask >> (s + width)) & 1:
            width += 1
        return s, width

    rs, rw = shift_for(rmask)
    gs, gw = shift_for(gmask)
    bs, bw = shift_for(bmask)

    def scale(v, width):
        if width >= 8:
            return (v >> (width - 8)) & 0xFF
        return (v << (8 - width)) & 0xFF

    pixel_data = data[pixels_off:]
    out_rows = []
    byte_per_px = bpp // 8

    for y in range(h):
        row_start = y * bpl
        row = pixel_data[row_start: row_start + bpl]
        out = bytearray(w * 3)
        for x in range(w):
            po = x * byte_per_px
            chunk = row[po: po + byte_per_px]
            if byte_per_px == 4:
                val = struct.unpack(endian + "I", chunk)[0]
            elif byte_per_px == 3:
                b0, b1, b2 = chunk[0], chunk[1], chunk[2]
                val = (b0 << 16 | b1 << 8 | b2) if endian == ">" else (b2 << 16 | b1 << 8 | b0)
            elif byte_per_px == 2:
                val = struct.unpack(endian + "H", chunk)[0]
            else:
                val = chunk[0]
            r = scale((val & rmask) >> rs, rw)
            g = scale((val & gmask) >> gs, gw)
            b = scale((val & bmask) >> bs, bw)
            out[x * 3: x * 3 + 3] = bytes((r, g, b))
        out_rows.append(bytes(out))

    return w, h, out_rows


def write_png(path, w, h, rows):
    def chunk(tag, payload):
        c = tag + payload
        return struct.pack(">I", len(payload)) + c + struct.pack(">I", zlib.crc32(c))

    sig = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0)  # 8-bit, RGB truecolor
    raw = bytearray()
    for row in rows:
        raw.append(0)  # filter type: None
        raw.extend(row)
    idat = zlib.compress(bytes(raw), 6)

    with open(path, "wb") as f:
        f.write(sig)
        f.write(chunk(b"IHDR", ihdr))
        f.write(chunk(b"IDAT", idat))
        f.write(chunk(b"IEND", b""))


if __name__ == "__main__":
    src, dst = sys.argv[1], sys.argv[2]
    w, h, rows = read_xwd(src)
    write_png(dst, w, h, rows)
    print(f"wrote {dst} ({w}x{h})")
