@echo on

set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat

:: build
cargo install --locked ^
    --root "%PREFIX%" ^
    --path . ^
    --no-track ^
    || goto :error

:: dump licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output "%SRC_DIR%\THIRDPARTY.yml" ^
    || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
