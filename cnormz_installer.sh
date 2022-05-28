#!/usr/bin/env bash
# MIT License
#
# Copyright (c) 2022 CustomEntity
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
if [ $(id -u) -ne 0 ]; then
  echo "=> You must run this with root privileges.  Try \"sudo ./cnormz_installer.sh\""
  exit 1
else
  echo "=> Installing crystal"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  curl -fsSL https://crystal-lang.org/install.sh | bash
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew update
  brew install crystal
else
  echo "=> Sorry, this installer is not supported on your OS."
  exit 1
fi

git clone "https://github.com/CustomEntity/crNormz.git"
crystal build crNormz/src/crnormz.cr

sudo mv crnormz /usr/local/bin/crnormz
sudo chmod +x /usr/local/bin/crnormz
sudo rm -rf crNormz

echo "=> crNormz has been installed successfully!"

