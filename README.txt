README

Background

This is an attempt to create a fairly simple paper tape punch. Some time ago a bought an
emulated PDP11/70 from https://obsolescence.wixsite.com/obsolescence/pidp-11 . 
The emulated PDP11/70 is based on a Raspberry Pi and runs faster than the original machine.
I have tried out some very early Unix version and then I realized that it would be nice
to be able to demonstrate to young people interested in computers how programs were read 
from paper tape.
  The problem turned out to be that there are a lot of paper tape readers available on the
net. The reason is that a reader is very simple to design because it is mechanically very
simple. Trying to find a working paper tape punch turned out to be difficult. Occasionally
paper tape punches are available on the net but they are often broken and still expensive.
The obvious solution was then to try to design my own version that would be reasonably
simple to build using components that are easy to obtain over Internet.
  At present the project may change from day to day depending on good input from interested
persons or my own changed design ideas based on experiences while building a punch. I have
done no attempts to try to make the punch small because spreading the design out over
a plywood base plate of roughly 25x45 cm makes it easy to do adjustments. A more compact
version may be designed later if there is enought interest.

Basic design

The present design, that so far hasn't been fully tested, is:
All nine punches, there ar 8 data bit bunches and one paper feed punch, are separately
controlled using small SG-90 9g micro servos. The servos are arranged as two servo 
towers. One tower contains four servos that is the data bit servos 0...3 plus the paper
feed punch. The other tower contains the servos for data bits 4...7. All mechanical parts
needed for the towers are 3-d printed using an Anycubic I3 Mega. Parts have so far been
designed using the OpenScad language. I have also used FreeCAD for 3-d design but I find
OpenScad easier to use when substantial changes occasionally are needed. OpenScad produces
stl-files that are fed to the printer for printing.
