#!/usr/bin/env python3
import sys
import re

def format_stat(val_str):
    if not val_str or val_str == "-":
        return "-"
    if "N/A" in val_str:
        return "N/A"
    m = re.search(r"([0-9.]+)%\s+of\s+([0-9]+)", val_str)
    if m:
        pct = float(m.group(1))
        total = int(m.group(2))
        executed = int(round(pct * total / 100.0))
        return f"{pct:.2f}% ({executed}/{total})"
    return val_str

def main():
    content = sys.stdin.read()
    blocks = content.split("File ")

    print("\n" + "=" * 105)
    print("                                RTSMDC_Dev Terminal GCOV Coverage Report                                 ")
    print("=" * 105)
    print(f"{'Source File':<20} | {'Line Coverage':<18} | {'Branch Coverage':<18} | {'Branch Taken':<18} | {'Call Coverage':<18}")
    print("-" * 105)

    total_lines_cov = ""
    for b in blocks:
        if not b.strip():
            continue
        lines = b.strip().split("\n")
        fname_match = re.search(r"['\"](?:\.\./)*src/(?:[^/]+/)*([^'\"]+)['\"]", lines[0])
        if not fname_match:
            m = re.search(r"Lines executed:(.*)", b)
            if m:
                total_lines_cov = format_stat(m.group(1).strip())
            continue
        fname = fname_match.group(1)

        line_cov = re.search(r"Lines executed:(.*)", b)
        br_cov = re.search(r"Branches executed:(.*)", b)
        br_taken = re.search(r"Taken at least once:(.*)", b)
        call_cov = re.search(r"Calls executed:(.*)", b)

        lc_str = format_stat(line_cov.group(1).strip()) if line_cov else "-"
        bc_str = format_stat(br_cov.group(1).strip()) if br_cov else "-"
        bt_str = format_stat(br_taken.group(1).strip()) if br_taken else "-"
        cc_str = format_stat(call_cov.group(1).strip()) if call_cov else ("N/A" if "No calls" in b else "-")

        print(f"{fname:<20} | {lc_str:<18} | {bc_str:<18} | {bt_str:<18} | {cc_str:<18}")

    print("=" * 105)
    if total_lines_cov:
        print(f" TOTAL SYSTEM LINE COVERAGE: {total_lines_cov}")
        print("=" * 105)
    print("")

if __name__ == "__main__":
    main()
