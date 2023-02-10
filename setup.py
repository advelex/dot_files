import os
import sys

def setup_osx():
    config_path = os.path.expanduser("~/.config/nvim/")
    os.makedirs(config_path, exist_ok=True)
    current_dir = os.path.dirname(os.path.abspath(__file__))
    os.system(f"ln {os.path.join(current_dir, 'init.vim')} {os.path.join(config_path, 'init.vim')}")
    os.system('sh -c \'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\'')


def main():
    if sys.platform == "darwin":
        setup_osx()


if __name__ == '__main__':
    main()