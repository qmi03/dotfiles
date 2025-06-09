{ ... }: {
  homebrew.brews = [
    # Package managers & CLI tools
    "mas"
    "exercism"
    "coursier"
    "gh"

    # Languages & development
    "swiftformat"
    "unisonlang"
    "llvm"
    "swiftly"
    "xcbeautify"

    # Database
    # "postgresql@17"
    "phpmyadmin"

    # File management
    "lf"
    "fileicon"
    "pngpaste"

    # System utilities
    "nightlight"
    "borders"

    # Multimedia
    # "kew" # tui music
    # "mpv"
    # "imagemagick"
    "ffmpeg"

    # Others
    "pkhex-cli"
  ];
}
