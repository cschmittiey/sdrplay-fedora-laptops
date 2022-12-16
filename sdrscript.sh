#!/bin/bash


dnf install htop vim tmux git cmake SoapySDR SoapySDR-devel rtl-sdr sdrpp gcc-c++
dnf groupinstall "Development Tools"
wget https://www.sdrplay.com/software/SDRplay_RSP_API-Linux-3.07.1.run
chmod +x SDRplay_RSP_API-Linux-3.07.1.run
./SDRplay_RSP_API-Linux-3.07.1.run
sudo systemctl enable --now sdrplay
git clone https://github.com/pothosware/SoapySDRPlay3
cd SoapySDRPlay3
mkdir build
cd build
cmake ..
make
sudo make install
echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf
echo "/usr/local/lib64" >> /etc/ld.so.conf.d/local.conf
sudo ldconfig
