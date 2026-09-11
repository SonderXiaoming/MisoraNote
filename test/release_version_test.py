import importlib.util
import plistlib
import tempfile
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "verify_release", ROOT / ".github/scripts/verify_release.py"
)
verify = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(verify)


class ReleaseVersionTest(unittest.TestCase):
    def test_source_must_match_release_tag(self):
        with tempfile.TemporaryDirectory() as directory:
            pubspec = Path(directory) / "pubspec.yaml"
            pubspec.write_text("version: 1.3.1+13\n", encoding="utf-8")
            self.assertEqual(verify.source_version(pubspec, "v1.3.1"), ("1.3.1", "13"))
            with self.assertRaises(ValueError):
                verify.source_version(pubspec, "v1.3.0")

    def test_ipa_filename_does_not_hide_stale_bundle_version(self):
        with tempfile.TemporaryDirectory() as directory:
            ipa = Path(directory) / "misora_note_v1.3.1_ios_unsigned.ipa"
            for version, build, valid in [("1.2.4", "11", False), ("1.3.1", "12", False), ("1.3.1", "13", True)]:
                with zipfile.ZipFile(ipa, "w") as archive:
                    archive.writestr("Payload/Runner.app/Info.plist", plistlib.dumps({
                        "CFBundleShortVersionString": version,
                        "CFBundleVersion": build,
                        "CFBundleIdentifier": "com.sonderxiaoming.misoranote",
                    }, fmt=plistlib.FMT_BINARY))
                if valid:
                    verify.verify_ipa(ipa, "1.3.1", "13")
                else:
                    with self.assertRaises(ValueError):
                        verify.verify_ipa(ipa, "1.3.1", "13")


if __name__ == "__main__":
    unittest.main()
