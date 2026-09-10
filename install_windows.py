import os
import sys
import json
import shutil
from pathlib import Path

if os.name != "nt":
    print("This script is for a windows machine only.")
    sys.exit(-1)

PATHS_FILE = "paths.jsonc"

BASE_DIR = Path(__file__).parent.resolve()

def _expand(p):
    """Fully expand and resolve the Path given environment variables."""
    return Path(os.path.expandvars(str(p))).expanduser().resolve()

def get_paths(p):
    with open(p, encoding="utf-8") as f:
        d = json.load(f)
    return {(BASE_DIR / k): _expand(v) for k, v in d.items()}

def copy_paths(paths):
    for src, dst in paths.items():
        if not src.exists():
            print(f"Skipping, source missing: {src}")
            continue
        if dst.exists():
            if dst.is_dir():
                shutil.rmtree(dst)
            else:
                dst.unlink()
        dst.parent.mkdir(parents=True, exist_ok=True)
        if src.is_dir():
            shutil.copytree(src, dst)
        else:
            shutil.copy2(src, dst)
        print(f"Copied {src} -> {dst}")

paths = get_paths(PATHS_FILE)
copy_paths(paths)
