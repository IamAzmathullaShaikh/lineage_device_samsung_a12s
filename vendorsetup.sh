echo "Copying Toolchain"

# Clone GCC from Android 11
if [ -d "prebuilts/toolchain" ]; then
    echo "prebuilts/toolchain not found! Downloading..."
    git clone https://github.com/theshoqanebi/aarch64-linux-android-4.9.git kernel/samsung/a12s/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9  --depth=1
fi

# Clone Clang from Android 11
if [ -d "prebuilts/toolchain-clang" ]; then
    echo "prebuilts/toolchain-clang not found! Downloading..."
    git clone https://github.com/theshoqanebi/clang-r353983c.git kernel/samsung/a12s/toolchain/clang/host/linux-x86/clang-r353983c  --depth=1
fi

# Create ld symlink to avoid linking error(s)
ln -s $(pwd)/prebuilts/toolchain-clang/clang-r353983c/bin/lld \
    $(pwd)/prebuilts/toolchain-clang/clang-r353983c/bin/ld &> /dev/null
