
NAME
----

control-system-design - Notes on Control System Design

DESCRIPTION
-----------

This is a collection of class notes compiled while taking several
control systems classes.  Topics include: Pole Placement, PID,
Mapping, Direct Design, Model Matching.  Both the continuous and
discrete domain are included.

Download: ([notes/main.pdf](https://github.com/jmahler/control-system-design/blob/build/notes/main.pdf?raw=true))

Many of the examples include Matlab code for performing the calculations
and plotting the response.  They have been tested with [Octave][octave] but
many work with Matlab as well (see Matlab NOTES).

 [octave]: http://www.gnu.org/software/octave/

The main document (under 'notes/') was written using [LaTeX][latex].

 [latex]: http://www.latex-project.org/

REQUIREMENTS
------------

The following software versions were shown to work with this code.
All of it has been tested with Octave, only some of it with Matlab.

  * Octave 3.6.4
  * Matlab 2012b - 2013a

Matlab NOTES
------------

With Matlab in Windows a path entry must be added for the 'lib' directory in this
project so that the functions can be found.  To do this find the path to where
the lib is and then copy it as a string.  Then run 'addpath' from the Matlab workspace.

    >> addpath('\\Client\C$\Users\Joe bob\Desktop\control-system-design\lib');

AUTHOR
------

Jeremiah Mahler <jmmahler@gmail.com><br>
<https://plus.google.com/+JeremiahMahler/about>

COPYRIGHT
---------

Copyright &copy; 2013, Jeremiah Mahler.  All Rights Reserved.<br>
This project is free software and released under
the [GNU General Public License][gpl].

 [gpl]: http://www.gnu.org/licenses/gpl.html

