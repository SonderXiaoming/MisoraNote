"""Validate release source versions and the metadata inside the shipped IPA."""

import argparse
import plistlib
import re
import zipfile
from pathlib import Path


def source_version(pubspec: Path, tag: str) -> tuple[str, str]:
    match = re.search(
        r"^version:\s*(\d+\.\d+\.\d+)\+(\d+)\s*$",
        pubspec.read_text(encoding="utf-8"),
        re.MULTILINE,
    )
    if match is None:
        raise ValueError("pubspec.yaml must declare version: MAJOR.MINOR.PATCH+BUILD")
    version, build_number = match.groups()
    if tag != f"v{version}":
        raise ValueError(f"Release tag {tag!r} does not match pubspec version {version}")
    if int(build_number) < 1:
        raise ValueError("Build number must be positive")
    return version, build_number


def verify_ipa(ipa: Path, version: str, build_number: str) -> None:
    with zipfile.ZipFile(ipa) as archive:
        info = plistlib.loads(archive.read("Payload/Runner.app/Info.plist"))
    expected = {
        "CFBundleShortVersionString": version,
        "CFBundleVersion": build_number,
        "CFBundleIdentifier": "com.sonderxiaoming.misoranote",
    }
    for key, value in expected.items():
        if info.get(key) != value:
            raise ValueError(f"IPA {key}: expected {value!r}, got {info.get(key)!r}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    source = commands.add_parser("source")
    source.add_argument("--tag", required=True)
    source.add_argument("--pubspec", type=Path, default=Path("pubspec.yaml"))
    ipa = commands.add_parser("ipa")
    ipa.add_argument("path", type=Path)
    ipa.add_argument("--version", required=True)
    ipa.add_argument("--build-number", required=True)
    args = parser.parse_args()
    if args.command == "source":
        version, build_number = source_version(args.pubspec, args.tag)
        print(f"version={version}\nbuild_number={build_number}")
    else:
        verify_ipa(args.path, args.version, args.build_number)
        print(f"Verified IPA version {args.version} ({args.build_number})")


if __name__ == "__main__":
    main()
