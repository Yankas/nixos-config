{

  xdg.configFile."lf/lfrc".source = ../dotfiles/lfrc;
  xdg.configFile."lf/icons".text = ''
    # vim:ft=conf
    di					📁
    fi					📃
    tw					🤝
    ow					📂
    ln					⛓
    or					❌
    ex					🎯

    # images
    *.png				🖼
    *.webp				🖼
    *.ico				🖼
    *.gif				🖼
    *.svg				🖼
    *.tif				🖼
    *.tiff				🖼
    *.jpg				📸
    *.jpeg				📸
    *.xcf				🖌
    *.psd				🖌
    *.pdn				🖌

    # video
    *.mkv				🎥
    *.mp4				🎥
    *.webm				🎥
    *.mpeg				🎥
    *.avi				🎥
    *.mov				🎥
    *.mpg				🎥
    *.wmv				🎥
    *.m4b				🎥
    *.flv				🎥

    # music
    *.mp3				🎵
    *.opus				🎵
    *.ogg				🎵
    *.m4a				🎵
    *.flac				🎵
    *.wav				🎵

    # roms
    *.z64				🎮
    *.v64				🎮
    *.n64				🎮
    *.gba				🎮
    *.nds				🎮
    *.nes				🎮
    *.gdi				🎮
    *.nsp				🎮
    *.xci				🎮
    *.iso				📀
    *.img				📀

    # packages
    *.zip				📦
    *.rar				📦
    *.7z				📦
    *.tar.gz			📦

    # configuration files
    *.sh				⚙
    *.zsh				⚙
    *profile			⚙
    *xprofile			⚙
    *.zshrc				⚙
    *aliasrc			⚙
    *.xinitrc			⚙
    *configrc			⚙
    *.ini				⚙
    *config				⚙
    *dunstrc			⚙
    *.cfg				⚙
    *.desktop			⚙
    *.conf				⚙
    *.rc				⚙
    *passwd				⚙
    *.default			⚙
    *paths				⚙
    *bashrc				⚙
    *zshrc				⚙

    # exectuables
    *.jar				☕
    *.java				☕
    *.exe				🪟

    # documents
    *.docx				📕
    *.doc				📕
    *.txt				📕
    *.log				📙
    *LICENSE			📕
    *.pdf				📕
    *.epub				📕
    *.djvu				📕
    *.xls				📊
    *.xlsx				📊
    *.csv				📊

    # source code
    *.ml				🐫
    *.php				🐘
    *.pl				⛔
    *.c					🇨
    *.h					🇭
    *.json				📖
    *.xml				📖
    *.plist				📖
    *.yml				📖
    *.yaml				📖
    *.toml				📖
    *.o					🇴
    *.cmx				🇴
    *.cmi				🇴
    *.html				🌎
    *.md				🌎
    *.url				🌎
    *.fs				🇫
    *.fsx				🇫
    *.fsi				🇫
    *.js				🇯

    # git
    .gitignore			🇬
    .git				🇬

    # miscellaneous 
    *.vbox				🖥️
    *.vbox-prev			🖥️
    *.vdi				🖥️
    *.torrent			🔽
    *.1					ℹ
    *.nfo				ℹ
    *.info				ℹ
    *.gpg				🔒
    *.pub				🔒
    *.pem				🔒
  '';

  xdg.configFile."lf/colors".text = ''
      # vim:ft=conf
      # Default GNU dir colors

      ln  01;36 # link
      or  31;01 # orphan
      tw  01;34 # sticky other writable
      ow  01;34 # other writeable
      st  01;34 # sticky
      di  01;34 # dir
      pi  33    # fifo
      so  01;35 # sock
      bd  33;01 # blk
      cd  33;01 # chr
      su  01;32 # setuid
      sg  01;32 # setgid
      ex  01;32 # exec
      fi  00    # file
    '';
}