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

tput clear

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ $(id -u) -ne 0 ]; then
    echo "=> You must run this with root privileges."
    sudo ./$0
    exit 1
  else
    echo "=> Installing crystal"
  fi
  sudo snap install crystal --classic
  sudo apt install libssl-dev      # for using OpenSSL
  sudo apt install libxml2-dev     # for using XML
  sudo apt install libyaml-dev     # for using YAML
  sudo apt install libgmp-dev      # for using Big numbers
  sudo apt install libz-dev        # for using crystal play
  sudo apt install gcc pkg-config git tzdata \
                           libpcre3-dev libevent-dev libyaml-dev \
                           libgmp-dev libssl-dev libxml2-dev
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew update
  brew install crystal
else
  echo "=> Sorry, this installer is not supported on your OS."
  exit 1
fi

git clone "https://github.com/CustomEntity/crNormz.git" crNormz_
echo "=> Compiling crNormz.."
crystal build crNormz_/src/crnormz.cr --release

sudo mv crnormz /usr/local/bin/crnormz
sudo chmod +x /usr/local/bin/crnormz
sudo rm -rf crNormz_

echo "=> crNormz has been installed successfully!"

