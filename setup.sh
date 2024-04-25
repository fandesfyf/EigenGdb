#!/bin/bash

echo "Creating GDB init file..."

mkdir -p "$HOME/.gdbinit.d"
cp ./printers.py "$HOME/.gdbinit.d/printers.py"
cp ./__init__.py "$HOME/.gdbinit.d/__init__.py"
echo -en "\
python \n\
import sys \n\
sys.path.insert(0, '$HOME/.gdbinit.d') \n\
from printers import register_eigen_printers \n\
register_eigen_printers (None) \n\
end\n" > "$HOME/.gdbinit"

echo "GDB init file created in $HOME/.gdbinit"
