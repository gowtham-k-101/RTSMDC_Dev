# RTSMDC_Dev

This project is a real-time stock market cache system in C.

## Project layout

- `src/` - implementation source files and module folders
- `include/` - public headers for each module
- `tests/` - CUnit test sources and test runners
- `data/` - runtime cache and backup files
- `logs/` - runtime application logs

## Build

Use the `Makefile` at the repository root:

```sh
make
```

This builds the executable `app`.

## Tests

From the repository root, build and run tests with:

```sh
make test
```

Or run the individual test scripts directly:

```sh
cd tests
./compile_tests.sh
./run_tests.sh
```

## Notes

Headers are included from `include/` with `-Iinclude`.
Source files remain under `src/`.
