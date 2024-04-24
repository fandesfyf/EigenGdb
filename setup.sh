#!/bin/bash

echo "Creating GDB init file..."
mkdir -p ~/.gdbinit.d
cp ./printers.py ~/.gdbinit.d/printers.py
cp ./__init__.py ~/.gdbinit.d/__init__.py
echo -en "\
python \n\
import sys \n\
sys.path.insert(0, '/home/${USER}/.gdbinit.d') \n\
from printers import register_eigen_printers \n\
register_eigen_printers (None) \n\
end\n" > ~/.gdbinit

echo "GDB init file created in ~/.gdbinit"
