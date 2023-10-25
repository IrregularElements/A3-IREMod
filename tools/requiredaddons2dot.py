#!/usr/bin/env python3
# Usage: requiredaddons2dot.py [ROOT...] | dot -Tpng > requiredAddons.png
# Convert requiredAddons[] statements to a Graphviz digraph.

import re
import os
import sys


if __name__ == "__main__":
    roots = sys.argv[1:] or ["."]
    required_addons = {}

    for root in roots:
        root_prefix = ""
        project_toml_path = os.path.join(root, ".hemtt", "project.toml")
        with open(project_toml_path) as file:
            for line in file:
                match = re.match(r'prefix = \"(\w*)\"', line)
                if match:
                    root_prefix = f"{match.group(1)}_"
        addons_path = os.path.join(root, "addons")
        addons = sorted(next(os.walk(addons_path))[1])

        for addon in addons:
            deps = []
            config_path = os.path.join(addons_path, addon, "config.cpp")
            with open(config_path) as file:
                for line in file:
                    match = re.match(r'\s*requiredAddons\[\]\s*=\s*{(.+?)};', line)
                    if match:
                        substr = match.group(1)
                        deps = [s.strip().lstrip('"').rstrip('"') for s in substr.split(",")]
            addon_full = f"{root_prefix}{addon}"
            if addon_full in required_addons:
                raise LookupError(f"Addon already in dict: {addon_full} (path: {os.path.join(addons_path, addon)})")
            required_addons[addon_full] = deps

    print("digraph requiredAddons {")
    for addon, deps in required_addons.items():
        for dep in deps:
            print(f"    {addon} -> {dep};")
    print("}")
