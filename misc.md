# Tweak Tool: 
- Windows: window action key: alt
- Typing: ctrl key position: caps lock as ctrl, kill seq : ctrl alt backspace

Settings: Keyboard: shortcuts: custom: ctrl alt t terminal

/etc/sysctl.conf: kernel.sysrq = 1

If on desktop for Micca speakers:
$ git clone https://github.com/bmc0/dsp.git
$ cd dsp
$ ./configure --disable-dsp --disable-fftw3
$ make
$ sudo make install
cp in ladspa_dsp into ~/.config
cp ~/.config/pulse/default.pa in place to load the ladspa_dsp module

# If using wireless adapter:
git clone https://github.com/abperiasamy/rtl8812AU_8821AU_linux.git
cd rt18812AU_8821AU_linux
sudo make -f Makefile.dkms install

